# 小米平板自定义开机动画
[English](/README.md) | 简体中文

## 介绍
专为平板设备打造的修改开机动画模块。平板与其他设备略有不同，其动画会根据设备的方向而更改。

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
| liuqin | 小米平板 6 Pro |
| pipa | 小米平板 6 |
| yudi | 小米平板 6 Max |
| nabu | 小米平板 5 |
| elish | 小米平板 5 Pro |
| enuma | 小米平板 5 Pro 5G |
| dagu | 小米平板 5 Pro 12.4 |

</details>

> [!NOTE]
> 此模块应该可以在其他平板型号、品牌和系统上运行，但仍需进一步测试。欢迎反馈您的测试结果！

## 要求
- Magisk v26.1+ / KernelSU v0.8.0+ / APatch 10568+
- Android 11+ (API 30+)
> [!WARNING]
> 此模块专为 Magisk 设计。不会为 KernelSU 和 APatch 提供支持，有可能会出现错误。

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
6. 选择**系统类型**（例如 `HyperOS`）
7. 选择**目标位置**
8. 从 **Artifacts** 下载构建好的模块

### 方法二：上传自定义文件

1. **Fork** 此仓库
2. 将您的 `bootanimation.zip` 文件添加到 `upload/` 文件夹
3. 提交并推送您的更改
4. 前往 **Actions** → **"Build Custom Boot Animation Module"**
5. 点击 **"Run workflow"**
6. 选择 `upload` 作为来源
7. 选择**目标位置**
8. 从 **Artifacts** 下载构建好的模块

> [!WARNING]
> `upload/` 文件夹仅供在您自己的 Fork 中个人使用。请勿提交包含此文件夹更改的 Pull Request，否则将被自动关闭。

### 可用目标位置

| 位置 | 描述 |
|------|------|
| `system/product/media` | 默认位置（大多数设备） |
| `system/media` | 传统位置 |
| `system/system_ext/media` | 系统扩展媒体 |
| `system/product/media/theme/default` | 主题默认位置 |

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

- `c` = 完整播放（或 `p` = 播放并重复）
- 第一个数字 = 循环次数（0 = 无限）
- 第二个数字 = 循环后暂停（以帧为单位）
- 路径 = 包含帧的文件夹

> [!IMPORTANT]
> 开机动画 ZIP 文件**必须**使用 STORE 压缩（无压缩）。工作流程会自动处理此问题。

## 免责声明
**刷写此模块可能会导致您的设备进入引导循环，强烈建议使用引导循环保护模块。对于使用此模块对您的设备或数据造成的任何损害，我概不负责。使用风险自负。**

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
