# TailwindButtonKit - SwiftUI 的 TailwindCSS 风格按钮组件库

[![Swift 版本](https://img.shields.io/badge/Swift-5.9+-orange.svg)](https://swift.org)
[![平台支持](https://img.shields.io/badge/平台-iOS%20|%20macOS%20|%20watchOS%20|%20tvOS-blue.svg)](https://developer.apple.com)
[![开源协议](https://img.shields.io/badge/协议-MIT-lightgrey.svg)](https://opensource.org/licenses/MIT)

一个受 TailwindCSS 启发的 SwiftUI 按钮组件库，提供完整的 Tailwind 配色方案、多种尺寸和样式变体，支持悬停效果和动画。

<img src="light.jpeg" alt="TailwindButtonKit 浅色主题预览图" style="width:300px;" />

<img src="dark.jpeg" alt="TailwindButtonKit 深色主题预览图" style="width:300px;" />

## 特性

- **完整的 TailwindCSS 配色** - 22 种标准颜色，每种颜色 10 个色阶
- **多种样式** - 实心、描边、浅色和极简四种变体
- **三种尺寸** - 小号、中号(默认)和大号
- **图标支持** - 轻松集成 SF Symbols
- **悬停效果** - 精美的交互状态动画
- **深色模式** - 自动适配系统外观

## 安装

### Swift Package Manager

在 `Package.swift` 中添加依赖：

```swift
dependencies: [
    .package(url: "https://github.com/swiftuihome/TailwindButtonKit.git", from: "1.0.3")
]
```

或在 Xcode 中直接添加：
1. 选择 File → Add Packages...
2. 输入仓库地址：`https://github.com/swiftuihome/TailwindButtonKit.git`
3. 选择您偏好的版本规则

## 使用指南

### 基础按钮

```swift
import TailwindButtonKit

struct ContentView: View {
    var body: some View {
        TailwindButton("点击我") {
            print("按钮被点击！")
        }
    }
}
```

### 带图标按钮

```swift
TailwindButton("保存", icon: "square.and.arrow.down") {
    print("保存成功！")
}
```

### 自定义按钮

```swift
TailwindButton("删除",
              icon: "trash",
              size: .large,
              style: .outline,
              color: .red) {
    print("删除项目！")
}
```

### 给按钮指定色阶
```swift
TailwindButton("深色按钮", color: .indigo, shade: .s900) {}
```

## 可用颜色

TailwindButtonKit 包含所有 TailwindCSS 标准颜色：

| 颜色名称 | 预览 |
|------------|---------|
| slate | ![slate](https://placehold.co/30x30/64748B/64748B) |
| gray | ![gray](https://placehold.co/30x30/6B7280/6B7280) |
| zinc | ![zinc](https://placehold.co/30x30/71717A/71717A) |
| neutral | ![neutral](https://placehold.co/30x30/737373/737373) |
| stone | ![stone](https://placehold.co/30x30/78716C/78716C) |
| red | ![red](https://placehold.co/30x30/EF4444/EF4444) |
| orange | ![orange](https://placehold.co/30x30/F97316/F97316) |
| amber | ![amber](https://placehold.co/30x30/F59E0B/F59E0B) |
| yellow | ![yellow](https://placehold.co/30x30/EAB308/EAB308) |
| lime | ![lime](https://placehold.co/30x30/84CC16/84CC16) |
| green | ![green](https://placehold.co/30x30/22C55E/22C55E) |
| emerald | ![emerald](https://placehold.co/30x30/10B981/10B981) |
| teal | ![teal](https://placehold.co/30x30/14B8A6/14B8A6) |
| cyan | ![cyan](https://placehold.co/30x30/06B6D4/06B6D4) |
| sky | ![sky](https://placehold.co/30x30/0EA5E9/0EA5E9) |
| blue | ![blue](https://placehold.co/30x30/3B82F6/3B82F6) |
| indigo | ![indigo](https://placehold.co/30x30/6366F1/6366F1) |
| violet | ![violet](https://placehold.co/30x30/8B5CF6/8B5CF6) |
| purple | ![purple](https://placehold.co/30x30/A855F7/A855F7) |
| fuchsia | ![fuchsia](https://placehold.co/30x30/D946EF/D946EF) |
| pink | ![pink](https://placehold.co/30x30/EC4899/EC4899) |
| rose | ![rose](https://placehold.co/30x30/F43F5E/F43F5E) |

## 按钮样式

### 实心(默认)
```swift
TailwindButton("实心", style: .solid) {}
```

### 描边
```swift
TailwindButton("描边", style: .outline) {}
```

### 浅色
```swift
TailwindButton("浅色", style: .light) {}
```

### 极简
```swift
TailwindButton("极简", style: .subtle) {}
```

## 按钮尺寸

### 小号
```swift
TailwindButton("小号", size: .small) {}
```

### 中号(默认)
```swift
TailwindButton("中号", size: .medium) {}
```

### 大号
```swift
TailwindButton("大号", size: .large) {}
```

## 系统要求

- iOS 17.0+ / macOS 14.0+ / watchOS 10.0+ / tvOS 17.0+
- Swift 5.9+
- Xcode 16+

## 参与贡献

欢迎贡献代码！如有任何改进建议或错误修复，请提交 issue 或 pull request。

## 开源协议

TailwindButtonKit 采用 MIT 开源协议。详情请见 [LICENSE](LICENSE) 文件。
