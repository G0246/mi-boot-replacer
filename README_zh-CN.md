# 小米自定义开机动画
[English](/README.md) | 简体中文

## 介绍
一个简单的模块，用于将开机动画替换为自定义动画。此模块也兼容平板设备，因为与手机不同，平板设备通常会根据设备方向调整其动画。

此模块使用 systemless 挂载方式将开机动画文件挂载到指定位置，确保不会对系统分区进行任何修改。

## 要求
- Magisk v26.1+ / KernelSU v0.8.0+ / APatch 10568+
- Android 11+ (API 30+) 运行 MIUI/HyperOS

> [!WARNING]
> 此模块专为 Magisk 设计。KernelSU 和 APatch 未获得完全支持，可能会出现意外错误。

## 已测试设备

| 设备 | 系统版本 | 状态 |
|------|----------|:----:|
| liuqin | V14.0.9.0.TMYCNXM (MIUI 14) | ✅ |
| liuqin | OS2.0.203.0.VMYCNXM (HyperOS 2) | ✅ |
| liuqin | OS2.0.212.0.VMYCNXM (HyperOS 2) | ✅ |

<details>
<summary>设备代码对照表</summary>

| 代码 | 设备名称 |
|------|----------|
| myron | 红米K90 Pro Max / POCO F8 Ultra |
| annibale | 红米K90 / POCO F8 Pro |
| popsicle | 小米17 Pro Max |
| pandora | 小米17 Pro |
| pudding | 小米17 |
| piano | 小米平板8 Pro |
| yupei | 小米平板8 |
| klimt | 小米15T Pro |
| goya | 小米15T |
| organ | 红米平板2 Pro 5G |
| flute | 红米平板2 Pro / POCO Pad M1 |
| dew | 红米15C / POCO C85 |
| tornado | 红米15C 5G / 红米15R 5G |
| kunzite | 红米Note15 5G |
| lapis | 红米Note15 Pro |
| flourite | 红米Note15 Pro+ |
| creek | 红米15 4G |
| spring | 红米Note15R / 红米15 5G / POCO M7 Plus 5G |
| dali | 红米K80 至尊版 |
| bixi | 小米MIX Flip 2 |
| turner | 红米K平板 / 小米平板Mini |
| violin | 小米平板7S Pro 12.5 |
| taiko | 红米平板2 |
| koto | 红米平板2 4G |
| dijun | 小米15S Pro |
| jinghu | 小米平板7 Ultra |
| luming | 小米Civi5 Pro |
| onyx | 红米Turbo 4 Pro / POCO F7 |
| serenity | POCO C71 / 红米A5 |
| emerald | 红米Note 14S |
| xuanyuan | 小米15 Ultra |
| obsidian | 红米Note 14 Pro 4G |
| tanzanite | 红米Note 14 4G |
| rodin | 红米Turbo 4 / POCO X7 Pro |
| miro | 红米K80 Pro / POCO F7 Ultra |
| zorn | 红米K80 / POCO F7 Pro |
| warm | POCO C75 5G / 红米A4 5G |
| haotian | 小米15 Pro |
| dada | 小米15 |
| muyu | 小米平板7 Pro |
| uke | 小米平板7 / POCO Pad X1 |
| degas | 小米14T |
| amethyst | 红米Note14 Pro+ |
| malachite | 红米Note14 Pro / POCO X7 |
| beryl | 红米Note14 5G / POCO M7 Pro 5G |
| flame | 红米14R 5G / POCO M7 5G |
| lake | 红米14C / 红米A3 Pro / POCO C75 |
| flare | 红米平板SE 8.7 WiFi |
| spark | 红米平板SE 8.7 4G |
| breeze | 红米13 5G / 红米Note 13R / POCO M6 Plus 5G |
| ruyi | 小米MIX Flip |
| goku | 小米MIX Fold 4 |
| rothko | 红米K70 至尊版 / 小米14T Pro |
| klein | 红米A3x |
| peridot | 红米Turbo 3 / POCO F6 |
| ruan | 红米平板 Pro 5G / POCO Pad 5G |
| dizi | 红米平板 Pro |
| chenfeng | 小米CIVI 4 Pro / 小米14 Civi |
| blue | 红米A3 / POCO C61 |
| aurora | 小米14 Ultra |
| shennong_t | 小米14 Pro 钛金属版 |
| sheng | 小米平板6S Pro 12.4 |
| sapphiren | 红米Note13 4G NFC |
| sapphire | 红米Note13 4G |
| moon | 红米13 / POCO M6 |
| air | 红米13R 5G / 红米13C 5G |
| duchamp | 红米K70E / POCO X6 Pro 5G |
| manet | 红米K70 Pro |
| vermeer | 红米K70 / POCO F6 Pro |
| gale | 红米13C / POCO C65 |
| shennong | 小米14 Pro |
| houji | 小米14 |
| aristotle | 小米13T |
| garnet | 红米Note13 Pro 5G / POCO X6 |
| gold | 红米Note13 5G / 13R Pro |
| zircon | 红米Note13 Pro+ 5G |
| xun | 红米平板SE |
| babylon | 小米MIX Fold 3 |
| corot | 红米K60 至尊版 / 小米13T Pro |
| yudi | 小米平板6 Max |
| sky | 红米Note12R / POCO M6 Pro 5G / 红米12 5G |
| fire | 红米12 |
| pearl | 红米Note12T Pro |
| yuechu | 小米CIVI3 |
| sea | 红米Note12S |
| ishtar | 小米13 Ultra |
| liuqin | 小米平板6 Pro |
| pipa | 小米平板6 |
| sweet_k6a | 红米Note12 Pro 4G |
| topaz | 红米Note12 4G NFC |
| tapas | 红米Note12 4G |
| marble | 红米Note12 Turbo / POCO F5 5G |
| water | POCO C51 / 红米A2 / A2+ |
| earth | 红米12C / POCO C55 |
| redwood | 红米Note12 Pro 极速版 / POCO X5 Pro 5G |
| rembrandt | 红米K60E |
| socrates | 红米K60 Pro |
| mondrian | 红米K60 / POCO F5 Pro |
| nuwa | 小米13 Pro |
| fuxi | 小米13 |
| moonstone | POCO X5 5G |
| sunstone | 红米Note12 5G / 红米Note12R Pro |
| ruby | 红米Note12 Pro+ |
| plato | 小米12T |
| yunluo | 红米平板 |
| ziyi | 小米CIVI 2 / 小米13 Lite |
| ice | POCO C50 / 红米A1 |
| rosemary_p | POCO M5S |
| rock | POCO M5 / 红米11 Prime 4G |
| dagu | 小米平板5 Pro 12.4 |
| diting | 红米K50 至尊版 / 小米12T Pro |
| zizhan | 小米MIX Fold 2 |
| mayfly | 小米12S |
| thor | 小米12S Ultra |
| unicorn | 小米12S Pro |
| daumier | 小米12 Pro 天玑版 |
| taoyao | 小米12 Lite |
| frost | POCO C40 |
| xaga | 红米Note11T Pro / Pro+ / POCO X4 GT / Pro / 红米K50i / Pro |
| zijin | 小米CIVI 1S |
| lilac | 红米Note 10T |
| dandelion | 红米10A |
| fog | 红米10C |
| rubens | 红米K50 |
| matisse | 红米K50 Pro |
| munch | 红米K40S / POCO F4 |
| viva | 红米Note11 Pro |
| lightcm | 红米Note11R |
| light | 红米Note11E / POCO M4 5G / 红米10 Prime+ 5G |
| ingres | 红米K50 电竞版 / POCO F4 GT |
| spesn | 红米Note11 NFC |
| spes | 红米Note11 |
| veux | 红米Note11E Pro / 红米Note11 Pro 5G |
| opal | 红米Note 11S 5G |
| fleur | 红米Note 11S / POCO M4 Pro 4G |
| zeus | 小米12 Pro |
| psyche | 小米12X |
| cupid | 小米12 |
| evergreen | POCO M4 Pro 5G |
| pissarro | 红米Note11 Pro / Pro+ |
| evergo | 红米Note11 5G |
| selenes | 红米Note11 4G |
| mona | 小米CIVI |
| lisa | 小米11青春活力版 |
| agate | 小米11T |
| vili | 小米11T Pro |
| selene | 红米10 |
| odin | 小米MIX4 |
| elish | 小米平板5 Pro (WiFi) |
| enuma | 小米平板5 Pro (5G) |
| nabu | 小米平板5 |
| chopin | 红米Note 10 Pro (China) / POCO X3 GT |
| camellia | 红米Note 10 (China) / POCO M3 Pro / 红米Note 11 SE |
| biloba | 红米Note 8 (21年款) |
| ares | 红米K40 游戏增强版 / POCO F3 GT |
| cetus | 小米MIX Fold |
| renoir | 小米11 青春版 |
| star | 小米11 Pro / Ultra |
| courbet | 小米11 Lite 4G |

</details>

> [!NOTE]
> 此模块应该可以在其他型号、品牌和系统上运行，但仍需进一步测试。欢迎反馈您的测试结果！

## 安装

> [!CAUTION]
> 请勿直接下载并刷入发布版本，除非您想手动替换开机动画文件。请使用下方的 **GitHub Actions 工作流程** 来构建包含您自定义动画的模块。

1. 使用 [GitHub Actions 工作流程](#github-actions构建您自己的模块) 构建您的自定义模块
2. 从 Artifacts 下载构建好的模块
3. 在 Magisk / KernelSU / APatch 应用中刷入 .zip 模块

> [!TIP]
> 如果您在添加自己的动画主题后看到空白一片，则说明您没有正确压缩它，创建时请使用仅存储模式进行压缩（无压缩）。

## 待办事项
1. ~~添加 GitHub Actions 工作流程以自动构建模块~~（完成）
2. 自动检测并选择相应的路径

## GitHub Actions（构建您自己的模块）

您可以使用 GitHub Actions 构建自定义开机动画模块，无需任何本地工具！工作流程会自动下载最新版本作为基础。

### 方法一：使用模板

1. **Fork** 此仓库
2. 前往 **Actions** → **"Build Custom Boot Animation Module"**
3. 点击 **"Run workflow"**
4. 将 **Source** 设置为 `template`
5. 选择您的**设备型号**（例如 `liuqin`）
6. 选择**模板**（例如 `HyperOS`）
7. 选择**目标位置**
8. 从 **Artifacts** 下载构建好的模块

> [!NOTE]
> 如果没有适用于您设备的模板，您必须使用方法二并上传您自己的开机动画文件。

### 方法二：上传自定义文件

1. **Fork** 此仓库
2. 将您的 `bootanimation.zip` 文件添加到 `upload/` 文件夹
3. 提交并推送您的更改
4. 前往 **Actions** → **"Build Custom Boot Animation Module"**
5. 点击 **"Run workflow"**
6. 选择 `upload` 作为来源
7. 选择**目标位置**
8. 从 **Artifacts** 下载构建好的模块

> [!TIP]
> 如果您的设备是手机，您只需要一个 `bootanimation.zip` 文件。多个动画文件仅适用于会根据设备方向更改动画的平板设备。

> [!WARNING]
> `upload/` 文件夹仅供在您自己的 Fork 中个人使用。请勿提交包含此文件夹更改的 Pull Request，否则将被自动关闭。

### 可用目标位置

| 位置 | 描述 |
|------|------|
| `/product/media` | 默认位置（大多数设备） |
| `/system/media` | 传统位置 |
| `/system_ext/media` | 系统扩展媒体 |

### 文件命名规范

- `bootanimation.zip` - 主开机动画
- `bootanimation01.zip` - 备选动画 1（其他旋转角度）
- `bootanimation02.zip` - 备选动画 2
- ... 以此类推

### 开机动画文件要求

每个 `bootanimation.zip` 应包含：

```
bootanimation.zip
├── desc.txt          # 必需：动画描述符
├── part0/            # 必需：第一个动画部分
│   ├── 00000.png
│   ├── 00001.png
│   └── ...
├── part1/            # 可选：第二个动画部分
│   ├── 00000.png
│   └── ...
└── ...
```

#### desc.txt 格式

```
<高度> <宽度> <帧率>
<类型> <循环次数> <暂停帧数> <路径>
...
```

示例：
```
1880 2880 60
p 0 5 part0
```

- `c` = 完整播放， `p` = 播放并重复
- 第一个数字 = 循环次数（0 = 无限）
- 第二个数字 = 循环后暂停（以帧为单位）
- 路径 = 包含帧的文件夹

> [!IMPORTANT]
> 开机动画 ZIP 文件**必须**使用 STORE 压缩（无压缩）。工作流程会自动处理此问题。

## 免责声明
**尽管刷写此模块导致设备进入引导循环的可能性很小，但仍强烈建议使用引导循环保护模块。对于使用此模块对您的设备或数据造成的任何损害，我概不负责。使用风险自负。**

## 许可证
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
