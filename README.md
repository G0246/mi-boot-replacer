# MiPad Custom Boot Animation
English | [简体中文](/README_zh-CN.md)

## Introduction
A simple module designed exclusively for tablet devices, replacing the boot animations with custom ones. Unlike phones, tablets often adapt their animations based on device orientation.

## Requirements
- Magisk v26.1+ / KernelSU v0.8.0+ / APatch 10568+
- Android 11+ (API 30+)
> [!WARNING]
> This module is designed for Magisk. KernelSU and APatch are not fully supported and unexpected bugs may occur.

## Tested Devices

| Device | System Version | Status |
|--------|----------------|:------:|
| liuqin | V14.0.9.0.TMYCNXM (MIUI 14) | ✅ |
| liuqin | OS2.0.203.0.VMYCNXM (HyperOS 2) | ✅ |
| liuqin | OS2.0.212.0.VMYCNXM (HyperOS 2) | ✅ |

<details>
<summary>Device Code Reference</summary>

| Code | Device Name |
|------|-------------|
| liuqin | Xiaomi Pad 6 Pro |
| pipa | Xiaomi Pad 6 |
| yudi | Xiaomi Pad 6 Max |
| nabu | Xiaomi Pad 5 |
| elish | Xiaomi Pad 5 Pro |
| enuma | Xiaomi Pad 5 Pro 5G |
| dagu | Xiaomi Pad 5 Pro 12.4 |

</details>

> [!NOTE]
> This module should work on other tablet models, brands, and systems, but further testing is needed. Feel free to report your results!

## Installation

> [!CAUTION]
> Do not directly download and flash the releases unless you want to manually replace the bootanimation files yourself. Use the **GitHub Actions workflow** below to build a module with your own animations.

1. Use the [GitHub Actions workflow](#github-actions-build-your-own-module) to build your custom module
2. Download the built module from Artifacts
3. Flash .zip module in the Magisk / KernelSU / APatch app

> [!TIP]
> If you get a blank screen after adding your own animation, it's likely because the ZIP file wasn't compressed right. Use "store-only" mode (no compression) when creating the ZIP.

## To-Dos
1. ~~Add GitHub Actions workflow for automated module building~~ (Done)
2. Auto detect and select path for corresponding models

## GitHub Actions (Build Your Own Module)

You can use GitHub Actions to build a custom boot animation module without any local tools! The workflow automatically downloads the latest release as a base.

### Method 1: Use a Template

1. **Fork** this repository
2. Go to **Actions** → **"Build Custom Boot Animation Module"**
3. Click **"Run workflow"**
4. Set **Source** to `template`
5. Select your **Device model** (e.g., `liuqin`)
6. Select the **System type** (e.g., `HyperOS`)
7. Select the **Target location**
8. Download the built module from **Artifacts**

### Method 2: Upload Custom Files

1. **Fork** this repository
2. Add your `bootanimation.zip` files to the `upload/` folder
3. Commit and push your changes
4. Go to **Actions** → **"Build Custom Boot Animation Module"**
5. Click **"Run workflow"**
6. Select `upload` as the source
7. Select the **Target location**
8. Download the built module from **Artifacts**

> [!WARNING]
> The `upload/` folder is for personal use in your fork only. Do not submit pull requests with changes to this folder - they will be automatically closed.

### Available Target Locations

| Location | Description |
|----------|-------------|
| `/product/media` | Default location (most devices) |
| `/system/media` | Legacy location |
| `/system_ext/media` | System extension media |

### File Naming Convention

- `bootanimation.zip` - Main boot animation
- `bootanimation01.zip` - Alternative 1 (rotation variant)
- `bootanimation02.zip` - Alternative 2
- ... and so on

### Bootanimation File Requirements

Each `bootanimation.zip` should contain:

```
bootanimation.zip
├── desc.txt          # Required: Animation descriptor
├── part0/            # Required: First animation part
│   ├── 00000.png
│   ├── 00001.png
│   └── ...
├── part1/            # Optional: Second animation part
│   ├── 00000.png
│   └── ...
└── ...
```

#### desc.txt Format

```
<height> <width> <fps>
<type> <count> <pause> <path>
...
```

Example:
```
1880 2880 60
p 0 5 part0
```

- `c` = play complete, `p` = play and repeat
- First number = loop count (0 = infinite)
- Second number = pause after loop (in frames)
- Path = folder containing the frames

> [!IMPORTANT]
> Bootanimation ZIP files **must** use STORE compression (no compression). The workflow handles this automatically.

## Disclaimer
**Flashing this module may cause your device to bootloop, a bootloop saver module is highly recommended. I am not responsible for any damages caused to your device or data by using this module. Use at your own risk.**

## License
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
