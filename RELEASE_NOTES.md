### New Features

- **Dynamic boot animation path detection**: The module now automatically detects the bootanimation path from the module structure during installation
- **Interactive location selector**: Added user prompt to select or confirm the boot animation backup location during installation
  - Auto-detects from multiple common paths
  - Users can cycle through options using volume keys
  - Shows warning when changing from pre-configured path

### Improvements

- **Smarter path detection**: Installation script checks the module's own structure first, falling back to device detection if not found
- **Better user feedback**: Clearer prompts showing whether the path was detected from the module or from the device

### Supported Paths

The module now supports these boot animation locations:
- `/product/media` (default, most common)
- `/system/media` (legacy)
- `/system_ext/media`
- `/product/media/theme/default`
