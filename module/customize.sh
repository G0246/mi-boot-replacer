SKIPUNZIP=0

# Detect API and architecture
api_level_arch_detect

# Default boot animation location (will be set by user prompt)
BOOT_DIR="/product/media"
BOOT_DIR_FROM_MODULE=false
BACKUP_DIR="/data/adb/boot-backups"
MODULE_ID=$(grep_prop id "$MODPATH/module.prop")
MODULE_VER_CODE=$(($(grep_prop versionCode "$MODPATH/module.prop") + 0))

# Recovery not recommended
if [[ "$BOOTMODE" != true ]]; then
  ui_print "*********************************************"
  ui_print "! Installing from recovery is not supported!"
  ui_print "! Please install via Magisk / KernelSU / APatch app"
  abort "*********************************************"
fi

# Check Android version
if [ "$API" -lt 30 ]; then
  ui_print "*********************************************"
  ui_print "! Android 11+ (API: 30+) required!"
  abort "*********************************************"
fi

key_check() {
  local timeout=60
  local start_time=$(date +%s)
  while true; do
    # Check for timeout
    local current_time=$(date +%s)
    if [ $((current_time - start_time)) -ge $timeout ]; then
      ui_print "! Key input timed out, defaulting to Volume [-]"
      keycheck="KEY_VOLUMEDOWN"
      return
    fi
    key_check=$(/system/bin/getevent -qlc 1)
    key_event=$(echo "$key_check" | awk '{ print $3 }' | grep 'KEY_')
    key_status=$(echo "$key_check" | awk '{ print $4 }')
    if [[ "$key_event" == *"KEY_"* && "$key_status" == "DOWN" ]]; then
      keycheck="$key_event"
      break
    fi
  done
  while true; do
    key_check=$(/system/bin/getevent -qlc 1)
    key_event=$(echo "$key_check" | awk '{ print $3 }' | grep 'KEY_')
    key_status=$(echo "$key_check" | awk '{ print $4 }')
    if [[ "$key_event" == *"KEY_"* && "$key_status" == "UP" ]]; then
      keycheck="$key_event"
      break
    fi
  done
}

# Auto-detect boot animation location from module structure
detect_boot_dir() {
  # First, check if bootanimation files exist in the module's system folder
  # This detects the path chosen during GitHub Actions build
  local module_boot_dir=""

  # Search for bootanimation.zip in module's system directory
  if [ -f "$MODPATH/system/product/media/bootanimation.zip" ]; then
    module_boot_dir="/product/media"
  elif [ -f "$MODPATH/system/media/bootanimation.zip" ]; then
    module_boot_dir="/system/media"
  elif [ -f "$MODPATH/system_ext/media/bootanimation.zip" ]; then
    module_boot_dir="/system_ext/media"
  fi

  if [ -n "$module_boot_dir" ]; then
    # Module has a pre-configured path from build
    BOOT_DIR="$module_boot_dir"
    BOOT_DIR_FROM_MODULE=true
  else
    # Fallback: detect from device's existing bootanimation
    BOOT_DIR_FROM_MODULE=false
    if [ -f "/product/media/bootanimation.zip" ]; then
      BOOT_DIR="/product/media"
    elif [ -f "/system/media/bootanimation.zip" ]; then
      BOOT_DIR="/system/media"
    elif [ -f "/system_ext/media/bootanimation.zip" ]; then
      BOOT_DIR="/system_ext/media"
    else
      BOOT_DIR="/product/media"
    fi
  fi
}

# Let user select boot animation location
select_boot_dir() {
  ui_print "*********************************************"
  ui_print "- Select boot animation location:"
  ui_print "  Volume [+]: Next option"
  ui_print "  Volume [-]: Confirm selection"
  ui_print "*********************************************"

  # Available locations (3 options)
  local current_index=0
  local total=3

  # Find if detected location matches any option
  case "$BOOT_DIR" in
    "/product/media") current_index=0 ;;
    "/system/media") current_index=1 ;;
    "/system_ext/media") current_index=2 ;;
  esac

  while true; do
    ui_print ""
    case $current_index in
      0) ui_print "  >> Product Media (Default)"; ui_print "     Path: /product/media" ;;
      1) ui_print "  >> System Media (Legacy)"; ui_print "     Path: /system/media" ;;
      2) ui_print "  >> System Ext Media"; ui_print "     Path: /system_ext/media" ;;
    esac

    key_check

    if [ "$keycheck" = "KEY_VOLUMEUP" ]; then
      # Next option
      current_index=$(( (current_index + 1) % total ))
    else
      # Confirm selection
      case $current_index in
        0) BOOT_DIR="/product/media" ;;
        1) BOOT_DIR="/system/media" ;;
        2) BOOT_DIR="/system_ext/media" ;;
      esac
      ui_print ""
      ui_print "- Selected: $BOOT_DIR"
      break
    fi
  done
}

backup() {
  ui_print "- Backing up boot animations from $BOOT_DIR"
  if [ -d "$BOOT_DIR" ]; then
    for FILE in "$BOOT_DIR"/bootanimation*; do
      if [ -f "$FILE" ]; then
        cp -f "$FILE" "$BACKUP_DIR/" && ui_print "- Cloned $(basename "$FILE")" || ui_print "! Unable to clone $(basename "$FILE")"
      fi
    done
  else
    ui_print "! $BOOT_DIR does not exist!"
    abort "*********************************************"
  fi
}

ui_print "*********************************************"
ui_print "- MiPad Custom Boot Animation"
ui_print "- By Veutexus (github.com/G0246)"
ui_print "- ID: $MODULE_ID"
ui_print "- Version: $MODULE_VER_CODE"
ui_print "*********************************************"

# Check root manager
if [[ "$KSU" == "true" ]]; then
  ui_print "- KernelSU Userspace Version: $KSU_VER_CODE"
  ui_print "- KernelSU Kernel Space Version: $KSU_KERNEL_VER_CODE"
  if [ "$KSU_VER_CODE" -lt 11551 ]; then
    ui_print "*********************************************"
    ui_print "! KernelSU v0.8.0+ required!"
    abort "*********************************************"
  fi
elif [[ "$APATCH" == "true" ]]; then
  ui_print "- APatch Version: $APATCH_VER ($APATCH_VER_CODE)"
  ui_print "- KernelPatch Version: $KERNELPATCH_VERSION"
  ui_print "- KernelPatch Kernel Version: $KERNEL_VERSION"
  if [ "$APATCH_VER_CODE" -lt 10568 ]; then
    ui_print "*********************************************"
    ui_print "! APatch 10568+ required!"
    abort "*********************************************"
  fi
else
  ui_print "- Magisk Version: $MAGISK_VER ($MAGISK_VER_CODE)"
  if [ "$MAGISK_VER_CODE" -lt 26100 ]; then
    ui_print "*********************************************"
    ui_print "- Your current version of Magisk does not meet the minimum requirements"
    ui_print "  Would you like to proceed with the installation anyway?"
    ui_print "  Press the following keys to proceed:"
    ui_print "  Volume [+]: Continue"
    ui_print "  Volume [-]: Abort"
    ui_print "*********************************************"
    key_check
    if [[ "$keycheck" == "KEY_VOLUMEUP" ]]; then
      ui_print "- You chose to ignore the warning, unexpected bugs may occur"
      ui_print "- Proceeding with the installation"
    else
      ui_print "- Installation aborted"
      abort "*********************************************"
    fi
  fi
fi

# Device infos
ui_print "*********************************************"
ui_print "- Device Information:"
ui_print "  Brand: $(getprop ro.product.brand)"
ui_print "  Model: $(getprop ro.product.model)"
ui_print "  Android: $(getprop ro.build.version.release)"
ui_print "*********************************************"

# Auto-detect and let user confirm/change boot animation location
detect_boot_dir

if [ "$BOOT_DIR_FROM_MODULE" = true ]; then
  ui_print "- Boot animation path (from module): $BOOT_DIR"
  ui_print "- Change location? (Not recommended)"
  ui_print "  Volume [+]: Change location"
  ui_print "  Volume [-]: Use module path (Recommended)"
else
  ui_print "- Detected boot animation location: $BOOT_DIR"
  ui_print "- (May not match module's configured path, please verify before proceeding)"
  ui_print "- Do you want to change the location?"
  ui_print "  Volume [+]: Change location"
  ui_print "  Volume [-]: Use detected path"
fi
ui_print "*********************************************"
key_check
if [[ "$keycheck" == "KEY_VOLUMEUP" ]]; then
  select_boot_dir
else
  ui_print "- Using: $BOOT_DIR"
fi

# Create backup if not found or empty
backup_exists=false
if [ -d "$BACKUP_DIR" ]; then
  # Check if backup directory has bootanimation files
  for file in "$BACKUP_DIR"/bootanimation*; do
    if [ -f "$file" ]; then
      backup_exists=true
      break
    fi
  done
fi

if [ "$backup_exists" = false ]; then
  ui_print "- Do you want to backup your current boot animation?"
  ui_print "  Press the following keys to proceed:"
  ui_print "  Volume [+]: Backup (RECOMMENDED)"
  ui_print "  Volume [-]: Skip"
  ui_print "*********************************************"
  key_check
  if [[ "$keycheck" == "KEY_VOLUMEUP" ]]; then
    mkdir -p "$BACKUP_DIR" && ui_print "- Created $BACKUP_DIR" || {
      ui_print "! Unable to create $BACKUP_DIR"
      abort "*********************************************"
    }
    backup
  else
    ui_print "- Skipping backup process"
  fi
else
  ui_print "- Found existing boot backups"
  ui_print "- Skipping backup process"
fi

ui_print "*********************************************"
ui_print "- Installation completed!"
ui_print "- Reboot to see new animations"
ui_print "*********************************************"
