# Xiaomi Custom Boot Animation
English | [简体中文](/README_zh-CN.md)

## Introduction
A simple module that replaces boot animations with custom ones and works on almost every Xiaomi device. This module is also compatible with tablets since, in contrast to phones, tablets frequently modify their animations according to the orientation of the device.

This module utilizes systemless mount to mount the bootanimation files to the specified location, ensuring no modifications are made to the system partition.

## Requirements
- Magisk v26.1+ / KernelSU v0.8.0+ / APatch 10568+
- Android 11+ (API 30+) running MIUI/HyperOS

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
| myron | Redmi K90 Pro Max / POCO F8 Ultra |
| annibale | Redmi K90 / POCO F8 Pro |
| popsicle | Xiaomi 17 Pro Max |
| pandora | Xiaomi 17 Pro |
| pudding | Xiaomi 17 |
| piano | Xiaomi Pad 8 Pro |
| yupei | Xiaomi Pad 8 |
| klimt | Xiaomi 15T Pro |
| goya | Xiaomi 15T |
| organ | Redmi Pad 2 Pro 5G |
| flute | Redmi Pad 2 Pro / POCO Pad M1 |
| dew | Redmi 15C / POCO C85 |
| tornado | Redmi 15C 5G / Redmi 15R 5G |
| kunzite | Redmi Note 15 5G |
| lapis | Redmi Note 15 Pro |
| flourite | Redmi Note 15 Pro+ |
| creek | Redmi 15 4G |
| spring | Redmi Note 15R / Redmi 15 5G / POCO M7 Plus 5G |
| dali | Redmi K80 Ultra |
| bixi | Xiaomi MIX Flip 2 |
| turner | Redmi K Pad / Xiaomi Pad Mini |
| violin | Xiaomi Pad 7S Pro 12.5 |
| taiko | Redmi Pad 2 |
| koto | Redmi Pad 2 4G |
| dijun | Xiaomi 15S Pro |
| jinghu | Xiaomi Pad 7 Ultra |
| luming | Xiaomi Civi 5 Pro |
| onyx | Redmi Turbo 4 Pro / POCO F7 |
| serenity | POCO C71 / Redmi A5 |
| emerald | Redmi Note 14S |
| xuanyuan | Xiaomi 15 Ultra |
| obsidian | Redmi Note 14 Pro 4G |
| tanzanite | Redmi Note 14 4G |
| rodin | Redmi Turbo 4 / POCO X7 Pro |
| miro | Redmi K80 Pro / POCO F7 Ultra |
| zorn | Redmi K80 / POCO F7 Pro |
| warm | POCO C75 5G / Redmi A4 5G |
| haotian | Xiaomi 15 Pro |
| dada | Xiaomi 15 |
| muyu | Xiaomi Pad 7 Pro |
| uke | Xiaomi Pad 7 / POCO Pad X1 |
| degas | Xiaomi 14T |
| amethyst | Redmi Note 14 Pro+ |
| malachite | Redmi Note 14 Pro / POCO X7 |
| beryl | Redmi Note 14 5G / POCO M7 Pro 5G |
| flame | Redmi 14R 5G / POCO M7 5G |
| lake | Redmi 14C / Redmi A3 Pro / POCO C75 |
| flare | Redmi Pad SE 8.7 WiFi |
| spark | Redmi Pad SE 8.7 4G |
| breeze | Redmi 13 5G / Redmi Note 13R / POCO M6 Plus 5G |
| ruyi | Xiaomi MIX Flip |
| goku | Xiaomi MIX Fold 4 |
| rothko | Redmi K70 Ultra / Xiaomi 14T Pro |
| klein | Redmi A3x |
| peridot | Redmi Turbo 3 / POCO F6 |
| ruan | Redmi Pad Pro 5G / POCO Pad 5G |
| dizi | Redmi Pad Pro |
| chenfeng | Xiaomi Civi 4 Pro / Xiaomi 14 Civi |
| blue | Redmi A3 / POCO C61 |
| aurora | Xiaomi 14 Ultra |
| shennong_t | Xiaomi 14 Pro Titanium |
| sheng | Xiaomi Pad 6S Pro 12.4 |
| sapphiren | Redmi Note 13 4G NFC |
| sapphire | Redmi Note 13 4G |
| moon | Redmi 13 / POCO M6 |
| air | Redmi 13R 5G / Redmi 13C 5G |
| duchamp | Redmi K70E / POCO X6 Pro 5G |
| manet | Redmi K70 Pro |
| vermeer | Redmi K70 / POCO F6 Pro |
| gale | Redmi 13C / POCO C65 |
| shennong | Xiaomi 14 Pro |
| houji | Xiaomi 14 |
| aristotle | Xiaomi 13T |
| garnet | Redmi Note 13 Pro 5G / POCO X6 |
| gold | Redmi Note 13 5G / Redmi 13R Pro |
| zircon | Redmi Note 13 Pro+ 5G |
| xun | Redmi Pad SE |
| babylon | Xiaomi MIX Fold 3 |
| corot | Redmi K60 Ultra / Xiaomi 13T Pro |
| yudi | Xiaomi Pad 6 Max |
| sky | Redmi Note 12R / POCO M6 Pro 5G / Redmi 12 5G |
| fire | Redmi 12 |
| pearl | Redmi Note 12T Pro |
| yuechu | Xiaomi Civi 3 |
| sea | Redmi Note 12S |
| ishtar | Xiaomi 13 Ultra |
| liuqin | Xiaomi Pad 6 Pro |
| pipa | Xiaomi Pad 6 |
| sweet_k6a | Redmi Note 12 Pro 4G |
| topaz | Redmi Note 12 4G NFC |
| tapas | Redmi Note 12 4G |
| marble | Redmi Note 12 Turbo / POCO F5 5G |
| water | POCO C51 / Redmi A2 / A2+ |
| earth | Redmi 12C / POCO C55 |
| redwood | Redmi Note 12 Pro Speed / POCO X5 Pro 5G |
| rembrandt | Redmi K60E |
| socrates | Redmi K60 Pro |
| mondrian | Redmi K60 / POCO F5 Pro |
| nuwa | Xiaomi 13 Pro |
| fuxi | Xiaomi 13 |
| moonstone | POCO X5 5G |
| sunstone | Redmi Note 12 5G / Redmi Note 12R Pro |
| ruby | Redmi Note 12 Pro+ |
| plato | Xiaomi 12T |
| yunluo | Redmi Pad |
| ziyi | Xiaomi Civi 2 / Xiaomi 13 Lite |
| ice | POCO C50 / Redmi A1 |
| rosemary_p | POCO M5S |
| rock | POCO M5 / Redmi 11 Prime 4G |
| dagu | Xiaomi Pad 5 Pro 12.4 |
| diting | Redmi K50 Ultra / Xiaomi 12T Pro |
| zizhan | Xiaomi MIX Fold 2 |
| mayfly | Xiaomi 12S |
| thor | Xiaomi 12S Ultra |
| unicorn | Xiaomi 12S Pro |
| daumier | Xiaomi 12 Pro Dimensity |
| taoyao | Xiaomi 12 Lite |
| frost | POCO C40 |
| xaga | Redmi Note 11T Pro / Pro+ / POCO X4 GT / Pro / Redmi K50i / Pro |
| zijin | Xiaomi Civi 1S |
| lilac | Redmi Note 10T |
| dandelion | Redmi 10A |
| fog | Redmi 10C |
| rubens | Redmi K50 |
| matisse | Redmi K50 Pro |
| munch | Redmi K40S / POCO F4 |
| viva | Redmi Note 11 Pro |
| lightcm | Redmi Note 11R |
| light | Redmi Note 11E / POCO M4 5G / Redmi 10 Prime+ 5G |
| ingres | Redmi K50 Gaming / POCO F4 GT |
| spesn | Redmi Note 11 NFC |
| spes | Redmi Note 11 |
| veux | Redmi Note 11E Pro / Redmi Note 11 Pro 5G |
| opal | Redmi Note 11S 5G |
| fleur | Redmi Note 11S / POCO M4 Pro 4G |
| zeus | Xiaomi 12 Pro |
| psyche | Xiaomi 12X |
| cupid | Xiaomi 12 |
| evergreen | POCO M4 Pro 5G |
| pissarro | Redmi Note 11 Pro / Pro+ |
| evergo | Redmi Note 11 5G |
| selenes | Redmi Note 11 4G |
| mona | Xiaomi Civi |
| lisa | Xiaomi 11 Lite 5G NE |
| agate | Xiaomi 11T |
| vili | Xiaomi 11T Pro |
| selene | Redmi 10 |
| odin | Xiaomi MIX 4 |
| elish | Xiaomi Pad 5 Pro (WiFi) |
| enuma | Xiaomi Pad 5 Pro (5G) |
| nabu | Xiaomi Pad 5 |
| chopin | Redmi Note 10 Pro (China) / POCO X3 GT |
| camellia | Redmi Note 10 (China) / POCO M3 Pro / Redmi Note 11 SE |
| biloba | Redmi Note 8 (2021) |
| ares | Redmi K40 Gaming / POCO F3 GT |
| cetus | Xiaomi MIX Fold |
| renoir | Xiaomi 11 Lite |
| star | Xiaomi 11 Pro / Ultra |
| courbet | Xiaomi 11 Lite 4G |

</details>

> [!NOTE]
> This module should work on other models, brands, and systems, but further testing is needed. Feel free to report your results!

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
6. Select the **Template** (e.g., `HyperOS`)
7. Select the **Target location**
8. Download the built module from **Artifacts**

> [!NOTE]
> If there is no available template for your device, you must use Method 2 and upload your own bootanimation files.

### Method 2: Upload Custom Files

1. **Fork** this repository
2. Add your `bootanimation.zip` files to the `upload/` folder
3. Commit and push your changes
4. Go to **Actions** → **"Build Custom Boot Animation Module"**
5. Click **"Run workflow"**
6. Select `upload` as the source
7. Select the **Target location**
8. Download the built module from **Artifacts**

> [!TIP]
> If your device is a phone, you only need one `bootanimation.zip` file. Multiple animation files are only needed for tablets that change animations based on device orientation.

> [!WARNING]
> The `upload/` folder is for personal use in your fork only. Do not submit pull requests with changes to this folder - they will be automatically closed.

### Available Target Locations

| Location | Description |
|----------|-------------|
| `/product/media` | Default location (most devices) |
| `/system/media` | Legacy location |
| `/system_ext/media` | System extension media |

> [!TIP]
> If you don't see any change in the boot animation after installation, you may have selected the wrong path. Try reflashing the module and select a different location.

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
**A bootloop saver module is strongly advised even if there is little possibility that flashing this module would cause your device to bootloop. I am not responsible for any damages caused to your device or data by using this module. Use at your own risk.**

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
