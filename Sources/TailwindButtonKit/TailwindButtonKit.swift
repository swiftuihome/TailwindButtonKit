// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

// MARK: - 主按钮组件
public struct TailwindButton: View {
    enum ButtonSize {
        case large
        case medium
        case small
    }
    
    enum ButtonStyle {
        case solid
        case outline
        case light
        case subtle
    }
    
    enum ColorScheme {
        case slate
        case gray
        case zinc
        case neutral
        case stone
        case red
        case orange
        case amber
        case yellow
        case lime
        case green
        case emerald
        case teal
        case cyan
        case sky
        case blue
        case indigo
        case violet
        case purple
        case fuchsia
        case pink
        case rose
    }
    
    let text: String
    let icon: String?
    let size: ButtonSize
    let style: ButtonStyle
    let color: ColorScheme
    let action: () -> Void
    
    @State private var isHovered = false
    
    init(
        _ text: String,
        icon: String? = nil,
        size: ButtonSize = .medium,
        style: ButtonStyle = .solid,
        color: ColorScheme = .blue,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.icon = icon
        self.size = size
        self.style = style
        self.color = color
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            HStack(spacing: spacing) {
                if let icon = icon {
                    Image(systemName: icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: iconSize, height: iconSize)
                }
                
                Text(text)
                    .font(font)
                    .lineLimit(1)
            }
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .frame(minWidth: minWidth)
            .background(background)
            .foregroundColor(foregroundColor)
            .overlay(overlay)
            .cornerRadius(cornerRadius)
            .shadow(color: shadowColor, radius: shadowRadius, x: 0, y: shadowYOffset)
            .scaleEffect(isHovered ? hoverScale : 1.0)
            .animation(.easeInOut(duration: 0.15), value: isHovered)
        }
        .buttonStyle(PlainButtonStyle())
        .onHover { hovering in
            isHovered = hovering
        }
    }
    
    // MARK: - 计算属性
    private var spacing: CGFloat {
        switch size {
        case .large: return 12
        case .medium: return 8
        case .small: return 6
        }
    }
    
    private var iconSize: CGFloat {
        switch size {
        case .large: return 18
        case .medium: return 16
        case .small: return 14
        }
    }
    
    private var font: Font {
        switch size {
        case .large: return .system(size: 16, weight: .semibold)
        case .medium: return .system(size: 14, weight: .medium)
        case .small: return .system(size: 12, weight: .medium)
        }
    }
    
    private var horizontalPadding: CGFloat {
        switch size {
        case .large: return 20
        case .medium: return 16
        case .small: return 12
        }
    }
    
    private var verticalPadding: CGFloat {
        switch size {
        case .large: return 14
        case .medium: return 10
        case .small: return 8
        }
    }
    
    private var minWidth: CGFloat? {
        switch size {
        case .large: return 120
        case .medium: return 100
        case .small: return 80
        }
    }
    
    private var cornerRadius: CGFloat {
        switch size {
        case .large: return 14
        case .medium: return 12
        case .small: return 10
        }
    }
    
    private var hoverScale: CGFloat {
        switch style {
        case .subtle: return 1.0
        default: return 1.03
        }
    }
    
    private var shadowRadius: CGFloat {
        switch style {
        case .solid: return 3
        case .outline: return 0
        case .light: return 1
        case .subtle: return 0
        }
    }
    
    private var shadowYOffset: CGFloat {
        switch style {
        case .solid: return 2
        default: return 1
        }
    }
    
    // MARK: - 颜色计算
    private var foregroundColor: Color {
        switch style {
        case .solid:
            return isHovered ? colorPalette.foregroundSolidHover : colorPalette.foregroundSolid
        case .outline:
            return isHovered ? colorPalette.foregroundOutlineHover : colorPalette.foregroundOutline
        case .light:
            return isHovered ? colorPalette.foregroundLightHover : colorPalette.foregroundLight
        case .subtle:
            return isHovered ? colorPalette.foregroundSubtleHover : colorPalette.foregroundSubtle
        }
    }
    
    //    private var background: some View {
    //        Group {
    //            switch style {
    //            case .solid:
    //                isHovered ? colorPalette.backgroundSolidHover : colorPalette.backgroundSolid
    //            case .outline:
    //                colorPalette.backgroundOutline
    //            case .light:
    //                isHovered ? colorPalette.backgroundLightHover : colorPalette.backgroundLight
    //            case .subtle:
    //                isHovered ? colorPalette.backgroundSubtleHover : colorPalette.backgroundSubtle
    //            }
    //        }
    //    }
    
    private var background: some View {
        Group {
            switch style {
            case .solid:
                if isHovered {
                    colorPalette.backgroundSolidHover
                } else {
                    colorPalette.backgroundSolid
                }
            case .outline:
                colorPalette.backgroundOutline
            case .light:
                if isHovered {
                    colorPalette.backgroundLightHover
                } else {
                    colorPalette.backgroundLight
                }
            case .subtle:
                if isHovered {
                    colorPalette.backgroundSubtleHover
                } else {
                    colorPalette.backgroundSubtle
                }
            }
        }
    }
    
    private var overlay: some View {
        Group {
            if style == .outline {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(isHovered ? colorPalette.borderHover : colorPalette.border, lineWidth: 2)
            } else {
                EmptyView()
            }
        }
    }
    
    private var shadowColor: Color {
        colorPalette.shadow
    }
    
    // MARK: - 颜色配置
    private var colorPalette: TailwindColorPalette {
        TailwindColorPalette(color: color, style: style)
    }
}

// MARK: - 颜色配置结构体
public struct TailwindColorPalette {
    let color: TailwindButton.ColorScheme
    let style: TailwindButton.ButtonStyle
    
    var backgroundSolid: some View {
        LinearGradient(
            gradient: Gradient(colors: [baseColor(600), baseColor(500)]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    var backgroundSolidHover: some View {
        LinearGradient(
            gradient: Gradient(colors: [baseColor(700), baseColor(600)]),
            startPoint: .top,
            endPoint: .bottom
        )
    }
    
    var backgroundOutline: some View {
        Color.clear
    }
    
    var backgroundLight: some View {
        baseColor(50)
    }
    
    var backgroundLightHover: some View {
        baseColor(100)
    }
    
    var backgroundSubtle: some View {
        Color.clear
    }
    
    var backgroundSubtleHover: some View {
        baseColor(50)
    }
    
    var foregroundSolid: Color {
        .white
    }
    
    var foregroundSolidHover: Color {
        .white
    }
    
    var foregroundOutline: Color {
        baseColor(600)
    }
    
    var foregroundOutlineHover: Color {
        baseColor(700)
    }
    
    var foregroundLight: Color {
        baseColor(600)
    }
    
    var foregroundLightHover: Color {
        baseColor(700)
    }
    
    var foregroundSubtle: Color {
        baseColor(500)
    }
    
    var foregroundSubtleHover: Color {
        baseColor(600)
    }
    
    var border: Color {
        baseColor(300)
    }
    
    var borderHover: Color {
        baseColor(400)
    }
    
    var shadow: Color {
        baseColor(500).opacity(style == .solid ? 0.3 : 0.1)
    }
    
    private func baseColor(_ shade: Int) -> Color {
        switch color {
        case .slate: return TailwindColors.slate(shade)
        case .gray: return TailwindColors.gray(shade)
        case .zinc: return TailwindColors.zinc(shade)
        case .neutral: return TailwindColors.neutral(shade)
        case .stone: return TailwindColors.stone(shade)
        case .red: return TailwindColors.red(shade)
        case .orange: return TailwindColors.orange(shade)
        case .amber: return TailwindColors.amber(shade)
        case .yellow: return TailwindColors.yellow(shade)
        case .lime: return TailwindColors.lime(shade)
        case .green: return TailwindColors.green(shade)
        case .emerald: return TailwindColors.emerald(shade)
        case .teal: return TailwindColors.teal(shade)
        case .cyan: return TailwindColors.cyan(shade)
        case .sky: return TailwindColors.sky(shade)
        case .blue: return TailwindColors.blue(shade)
        case .indigo: return TailwindColors.indigo(shade)
        case .violet: return TailwindColors.violet(shade)
        case .purple: return TailwindColors.purple(shade)
        case .fuchsia: return TailwindColors.fuchsia(shade)
        case .pink: return TailwindColors.pink(shade)
        case .rose: return TailwindColors.rose(shade)
        }
    }
}

// MARK: - Tailwind 颜色系统
public struct TailwindColors {
    static func slate(_ shade: Int) -> Color {
        switch shade {
        case 50: return Color(red: 248/255, green: 250/255, blue: 252/255)
        case 100: return Color(red: 241/255, green: 245/255, blue: 249/255)
        case 200: return Color(red: 226/255, green: 232/255, blue: 240/255)
        case 300: return Color(red: 203/255, green: 213/255, blue: 225/255)
        case 400: return Color(red: 148/255, green: 163/255, blue: 184/255)
        case 500: return Color(red: 100/255, green: 116/255, blue: 139/255)
        case 600: return Color(red: 71/255, green: 85/255, blue: 105/255)
        case 700: return Color(red: 51/255, green: 65/255, blue: 85/255)
        case 800: return Color(red: 30/255, green: 41/255, blue: 59/255)
        case 900: return Color(red: 15/255, green: 23/255, blue: 42/255)
        default: return Color(red: 100/255, green: 116/255, blue: 139/255)
        }
    }
    
    static func gray(_ shade: Int) -> Color {
        switch shade {
        case 50: return Color(red: 249/255, green: 250/255, blue: 251/255)
        case 100: return Color(red: 243/255, green: 244/255, blue: 246/255)
        case 200: return Color(red: 229/255, green: 231/255, blue: 235/255)
        case 300: return Color(red: 209/255, green: 213/255, blue: 219/255)
        case 400: return Color(red: 156/255, green: 163/255, blue: 175/255)
        case 500: return Color(red: 107/255, green: 114/255, blue: 128/255)
        case 600: return Color(red: 75/255, green: 85/255, blue: 99/255)
        case 700: return Color(red: 55/255, green: 65/255, blue: 81/255)
        case 800: return Color(red: 31/255, green: 41/255, blue: 55/255)
        case 900: return Color(red: 17/255, green: 24/255, blue: 39/255)
        default: return Color(red: 107/255, green: 114/255, blue: 128/255)
        }
    }
    
    static func zinc(_ shade: Int) -> Color {
        switch shade {
        case 50: return Color(red: 250/255, green: 250/255, blue: 250/255)
        case 100: return Color(red: 244/255, green: 244/255, blue: 245/255)
        case 200: return Color(red: 228/255, green: 228/255, blue: 231/255)
        case 300: return Color(red: 212/255, green: 212/255, blue: 216/255)
        case 400: return Color(red: 161/255, green: 161/255, blue: 170/255)
        case 500: return Color(red: 113/255, green: 113/255, blue: 122/255)
        case 600: return Color(red: 82/255, green: 82/255, blue: 91/255)
        case 700: return Color(red: 63/255, green: 63/255, blue: 70/255)
        case 800: return Color(red: 39/255, green: 39/255, blue: 42/255)
        case 900: return Color(red: 24/255, green: 24/255, blue: 27/255)
        default: return Color(red: 113/255, green: 113/255, blue: 122/255) // 500
        }
    }
    
    static func neutral(_ shade: Int) -> Color {
        switch shade {
        case 50: return Color(red: 250/255, green: 250/255, blue: 250/255)
        case 100: return Color(red: 245/255, green: 245/255, blue: 245/255)
        case 200: return Color(red: 229/255, green: 229/255, blue: 229/255)
        case 300: return Color(red: 212/255, green: 212/255, blue: 212/255)
        case 400: return Color(red: 163/255, green: 163/255, blue: 163/255)
        case 500: return Color(red: 115/255, green: 115/255, blue: 115/255)
        case 600: return Color(red: 82/255, green: 82/255, blue: 82/255)
        case 700: return Color(red: 64/255, green: 64/255, blue: 64/255)
        case 800: return Color(red: 38/255, green: 38/255, blue: 38/255)
        case 900: return Color(red: 23/255, green: 23/255, blue: 23/255)
        default: return Color(red: 115/255, green: 115/255, blue: 115/255) // 500
        }
    }
    
    static func stone(_ shade: Int) -> Color {
        switch shade {
        case 50: return Color(red: 250/255, green: 250/255, blue: 249/255)
        case 100: return Color(red: 245/255, green: 245/255, blue: 244/255)
        case 200: return Color(red: 231/255, green: 229/255, blue: 228/255)
        case 300: return Color(red: 214/255, green: 211/255, blue: 209/255)
        case 400: return Color(red: 168/255, green: 162/255, blue: 158/255)
        case 500: return Color(red: 120/255, green: 113/255, blue: 108/255)
        case 600: return Color(red: 87/255, green: 83/255, blue: 78/255)
        case 700: return Color(red: 68/255, green: 64/255, blue: 60/255)
        case 800: return Color(red: 41/255, green: 37/255, blue: 36/255)
        case 900: return Color(red: 28/255, green: 25/255, blue: 23/255)
        default: return Color(red: 120/255, green: 113/255, blue: 108/255) // 500
        }
    }
    
    static func blue(_ shade: Int) -> Color {
        switch shade {
        case 50: return Color(red: 239/255, green: 246/255, blue: 255/255)
        case 100: return Color(red: 219/255, green: 234/255, blue: 254/255)
        case 200: return Color(red: 191/255, green: 219/255, blue: 254/255)
        case 300: return Color(red: 147/255, green: 197/255, blue: 253/255)
        case 400: return Color(red: 96/255, green: 165/255, blue: 250/255)
        case 500: return Color(red: 59/255, green: 130/255, blue: 246/255)
        case 600: return Color(red: 37/255, green: 99/255, blue: 235/255)
        case 700: return Color(red: 29/255, green: 78/255, blue: 216/255)
        case 800: return Color(red: 30/255, green: 64/255, blue: 175/255)
        case 900: return Color(red: 30/255, green: 58/255, blue: 138/255)
        default: return Color(red: 59/255, green: 130/255, blue: 246/255)
        }
    }
    
    static func red(_ shade: Int) -> Color {
        switch shade {
        case 50: return Color(red: 254/255, green: 242/255, blue: 242/255)
        case 100: return Color(red: 254/255, green: 226/255, blue: 226/255)
        case 200: return Color(red: 254/255, green: 202/255, blue: 202/255)
        case 300: return Color(red: 252/255, green: 165/255, blue: 165/255)
        case 400: return Color(red: 248/255, green: 113/255, blue: 113/255)
        case 500: return Color(red: 239/255, green: 68/255, blue: 68/255)
        case 600: return Color(red: 220/255, green: 38/255, blue: 38/255)
        case 700: return Color(red: 185/255, green: 28/255, blue: 28/255)
        case 800: return Color(red: 153/255, green: 27/255, blue: 27/255)
        case 900: return Color(red: 127/255, green: 29/255, blue: 29/255)
        default: return Color(red: 239/255, green: 68/255, blue: 68/255)
        }
    }
    
    static func green(_ shade: Int) -> Color {
        switch shade {
        case 50: return Color(red: 240/255, green: 253/255, blue: 244/255)
        case 100: return Color(red: 220/255, green: 252/255, blue: 231/255)
        case 200: return Color(red: 187/255, green: 247/255, blue: 208/255)
        case 300: return Color(red: 134/255, green: 239/255, blue: 172/255)
        case 400: return Color(red: 74/255, green: 222/255, blue: 128/255)
        case 500: return Color(red: 34/255, green: 197/255, blue: 94/255)
        case 600: return Color(red: 22/255, green: 163/255, blue: 74/255)
        case 700: return Color(red: 21/255, green: 128/255, blue: 61/255)
        case 800: return Color(red: 22/255, green: 101/255, blue: 52/255)
        case 900: return Color(red: 20/255, green: 83/255, blue: 45/255)
        default: return Color(red: 34/255, green: 197/255, blue: 94/255)
        }
    }
    
    static func indigo(_ shade: Int) -> Color {
        switch shade {
        case 50: return Color(red: 238/255, green: 242/255, blue: 255/255)
        case 100: return Color(red: 224/255, green: 231/255, blue: 255/255)
        case 200: return Color(red: 199/255, green: 210/255, blue: 254/255)
        case 300: return Color(red: 165/255, green: 180/255, blue: 252/255)
        case 400: return Color(red: 129/255, green: 140/255, blue: 248/255)
        case 500: return Color(red: 99/255, green: 102/255, blue: 241/255)
        case 600: return Color(red: 79/255, green: 70/255, blue: 229/255)
        case 700: return Color(red: 67/255, green: 56/255, blue: 202/255)
        case 800: return Color(red: 55/255, green: 48/255, blue: 163/255)
        case 900: return Color(red: 49/255, green: 46/255, blue: 129/255)
        default: return Color(red: 99/255, green: 102/255, blue: 241/255)
        }
    }
    
    static func purple(_ shade: Int) -> Color {
        switch shade {
        case 50: return Color(red: 245/255, green: 243/255, blue: 255/255)
        case 100: return Color(red: 237/255, green: 233/255, blue: 254/255)
        case 200: return Color(red: 221/255, green: 214/255, blue: 254/255)
        case 300: return Color(red: 196/255, green: 181/255, blue: 253/255)
        case 400: return Color(red: 167/255, green: 139/255, blue: 250/255)
        case 500: return Color(red: 139/255, green: 92/255, blue: 246/255)
        case 600: return Color(red: 124/255, green: 58/255, blue: 237/255)
        case 700: return Color(red: 109/255, green: 40/255, blue: 217/255)
        case 800: return Color(red: 91/255, green: 33/255, blue: 182/255)
        case 900: return Color(red: 76/255, green: 29/255, blue: 149/255)
        default: return Color(red: 139/255, green: 92/255, blue: 246/255)
        }
    }
    
    static func pink(_ shade: Int) -> Color {
        switch shade {
        case 50: return Color(red: 253/255, green: 242/255, blue: 248/255)
        case 100: return Color(red: 252/255, green: 231/255, blue: 243/255)
        case 200: return Color(red: 251/255, green: 207/255, blue: 232/255)
        case 300: return Color(red: 249/255, green: 168/255, blue: 212/255)
        case 400: return Color(red: 244/255, green: 114/255, blue: 182/255)
        case 500: return Color(red: 236/255, green: 72/255, blue: 153/255)
        case 600: return Color(red: 219/255, green: 39/255, blue: 119/255)
        case 700: return Color(red: 190/255, green: 24/255, blue: 93/255)
        case 800: return Color(red: 157/255, green: 23/255, blue: 77/255)
        case 900: return Color(red: 131/255, green: 24/255, blue: 67/255)
        default: return Color(red: 236/255, green: 72/255, blue: 153/255)
        }
    }
    
    static func orange(_ shade: Int) -> Color {
        switch shade {
        case 50: return Color(red: 255/255, green: 247/255, blue: 237/255)
        case 100: return Color(red: 255/255, green: 237/255, blue: 213/255)
        case 200: return Color(red: 254/255, green: 215/255, blue: 170/255)
        case 300: return Color(red: 253/255, green: 186/255, blue: 116/255)
        case 400: return Color(red: 251/255, green: 146/255, blue: 60/255)
        case 500: return Color(red: 249/255, green: 115/255, blue: 22/255)
        case 600: return Color(red: 234/255, green: 88/255, blue: 12/255)
        case 700: return Color(red: 194/255, green: 65/255, blue: 12/255)
        case 800: return Color(red: 154/255, green: 52/255, blue: 18/255)
        case 900: return Color(red: 124/255, green: 45/255, blue: 18/255)
        default: return Color(red: 249/255, green: 115/255, blue: 22/255)
        }
    }
    
    static func amber(_ shade: Int) -> Color {
        switch shade {
        case 50: return Color(red: 255/255, green: 251/255, blue: 235/255)
        case 100: return Color(red: 254/255, green: 243/255, blue: 199/255)
        case 200: return Color(red: 253/255, green: 230/255, blue: 138/255)
        case 300: return Color(red: 252/255, green: 211/255, blue: 77/255)
        case 400: return Color(red: 251/255, green: 191/255, blue: 36/255)
        case 500: return Color(red: 245/255, green: 158/255, blue: 11/255)
        case 600: return Color(red: 217/255, green: 119/255, blue: 6/255)
        case 700: return Color(red: 180/255, green: 83/255, blue: 9/255)
        case 800: return Color(red: 146/255, green: 64/255, blue: 14/255)
        case 900: return Color(red: 120/255, green: 53/255, blue: 15/255)
        default: return Color(red: 245/255, green: 158/255, blue: 11/255)
        }
    }
    
    static func yellow(_ shade: Int) -> Color {
        switch shade {
        case 50: return Color(red: 254/255, green: 252/255, blue: 232/255)
        case 100: return Color(red: 254/255, green: 249/255, blue: 195/255)
        case 200: return Color(red: 254/255, green: 240/255, blue: 138/255)
        case 300: return Color(red: 253/255, green: 224/255, blue: 71/255)
        case 400: return Color(red: 250/255, green: 204/255, blue: 21/255)
        case 500: return Color(red: 234/255, green: 179/255, blue: 8/255)
        case 600: return Color(red: 202/255, green: 138/255, blue: 4/255)
        case 700: return Color(red: 161/255, green: 98/255, blue: 7/255)
        case 800: return Color(red: 133/255, green: 77/255, blue: 14/255)
        case 900: return Color(red: 113/255, green: 63/255, blue: 18/255)
        default: return Color(red: 234/255, green: 179/255, blue: 8/255)
        }
    }
    
    static func lime(_ shade: Int) -> Color {
        switch shade {
        case 50: return Color(red: 247/255, green: 254/255, blue: 231/255)
        case 100: return Color(red: 236/255, green: 252/255, blue: 203/255)
        case 200: return Color(red: 217/255, green: 249/255, blue: 157/255)
        case 300: return Color(red: 190/255, green: 242/255, blue: 100/255)
        case 400: return Color(red: 163/255, green: 230/255, blue: 53/255)
        case 500: return Color(red: 132/255, green: 204/255, blue: 22/255)
        case 600: return Color(red: 101/255, green: 163/255, blue: 13/255)
        case 700: return Color(red: 77/255, green: 124/255, blue: 15/255)
        case 800: return Color(red: 63/255, green: 98/255, blue: 18/255)
        case 900: return Color(red: 54/255, green: 83/255, blue: 20/255)
        default: return Color(red: 132/255, green: 204/255, blue: 22/255)
        }
    }
    
    static func emerald(_ shade: Int) -> Color {
        switch shade {
        case 50: return Color(red: 236/255, green: 253/255, blue: 245/255)
        case 100: return Color(red: 209/255, green: 250/255, blue: 229/255)
        case 200: return Color(red: 167/255, green: 243/255, blue: 208/255)
        case 300: return Color(red: 110/255, green: 231/255, blue: 183/255)
        case 400: return Color(red: 52/255, green: 211/255, blue: 153/255)
        case 500: return Color(red: 16/255, green: 185/255, blue: 129/255)
        case 600: return Color(red: 5/255, green: 150/255, blue: 105/255)
        case 700: return Color(red: 4/255, green: 120/255, blue: 87/255)
        case 800: return Color(red: 6/255, green: 95/255, blue: 70/255)
        case 900: return Color(red: 6/255, green: 78/255, blue: 59/255)
        default: return Color(red: 16/255, green: 185/255, blue: 129/255)
        }
    }
    
    static func teal(_ shade: Int) -> Color {
        switch shade {
        case 50: return Color(red: 240/255, green: 253/255, blue: 250/255)
        case 100: return Color(red: 204/255, green: 251/255, blue: 241/255)
        case 200: return Color(red: 153/255, green: 246/255, blue: 228/255)
        case 300: return Color(red: 94/255, green: 234/255, blue: 212/255)
        case 400: return Color(red: 45/255, green: 212/255, blue: 191/255)
        case 500: return Color(red: 20/255, green: 184/255, blue: 166/255)
        case 600: return Color(red: 13/255, green: 148/255, blue: 136/255)
        case 700: return Color(red: 15/255, green: 118/255, blue: 110/255)
        case 800: return Color(red: 17/255, green: 94/255, blue: 89/255)
        case 900: return Color(red: 19/255, green: 78/255, blue: 74/255)
        default: return Color(red: 20/255, green: 184/255, blue: 166/255)
        }
    }
    
    static func cyan(_ shade: Int) -> Color {
        switch shade {
        case 50: return Color(red: 236/255, green: 254/255, blue: 255/255)
        case 100: return Color(red: 207/255, green: 250/255, blue: 254/255)
        case 200: return Color(red: 165/255, green: 243/255, blue: 252/255)
        case 300: return Color(red: 103/255, green: 232/255, blue: 249/255)
        case 400: return Color(red: 34/255, green: 211/255, blue: 238/255)
        case 500: return Color(red: 6/255, green: 182/255, blue: 212/255)
        case 600: return Color(red: 8/255, green: 145/255, blue: 178/255)
        case 700: return Color(red: 14/255, green: 116/255, blue: 144/255)
        case 800: return Color(red: 21/255, green: 94/255, blue: 117/255)
        case 900: return Color(red: 22/255, green: 78/255, blue: 99/255)
        default: return Color(red: 6/255, green: 182/255, blue: 212/255)
        }
    }
    
    static func sky(_ shade: Int) -> Color {
        switch shade {
        case 50: return Color(red: 240/255, green: 249/255, blue: 255/255)
        case 100: return Color(red: 224/255, green: 242/255, blue: 254/255)
        case 200: return Color(red: 186/255, green: 230/255, blue: 253/255)
        case 300: return Color(red: 125/255, green: 211/255, blue: 252/255)
        case 400: return Color(red: 56/255, green: 189/255, blue: 248/255)
        case 500: return Color(red: 14/255, green: 165/255, blue: 233/255)
        case 600: return Color(red: 2/255, green: 132/255, blue: 199/255)
        case 700: return Color(red: 3/255, green: 105/255, blue: 161/255)
        case 800: return Color(red: 7/255, green: 89/255, blue: 133/255)
        case 900: return Color(red: 12/255, green: 74/255, blue: 110/255)
        default: return Color(red: 14/255, green: 165/255, blue: 233/255)
        }
    }
    
    static func violet(_ shade: Int) -> Color {
        switch shade {
        case 50: return Color(red: 245/255, green: 243/255, blue: 255/255)
        case 100: return Color(red: 237/255, green: 233/255, blue: 254/255)
        case 200: return Color(red: 221/255, green: 214/255, blue: 254/255)
        case 300: return Color(red: 196/255, green: 181/255, blue: 253/255)
        case 400: return Color(red: 167/255, green: 139/255, blue: 250/255)
        case 500: return Color(red: 139/255, green: 92/255, blue: 246/255)
        case 600: return Color(red: 124/255, green: 58/255, blue: 237/255)
        case 700: return Color(red: 109/255, green: 40/255, blue: 217/255)
        case 800: return Color(red: 91/255, green: 33/255, blue: 182/255)
        case 900: return Color(red: 76/255, green: 29/255, blue: 149/255)
        default: return Color(red: 139/255, green: 92/255, blue: 246/255)
        }
    }
    
    static func fuchsia(_ shade: Int) -> Color {
        switch shade {
        case 50: return Color(red: 253/255, green: 244/255, blue: 255/255)
        case 100: return Color(red: 250/255, green: 232/255, blue: 255/255)
        case 200: return Color(red: 245/255, green: 208/255, blue: 254/255)
        case 300: return Color(red: 240/255, green: 171/255, blue: 252/255)
        case 400: return Color(red: 232/255, green: 121/255, blue: 249/255)
        case 500: return Color(red: 217/255, green: 70/255, blue: 239/255)
        case 600: return Color(red: 192/255, green: 38/255, blue: 211/255)
        case 700: return Color(red: 162/255, green: 28/255, blue: 175/255)
        case 800: return Color(red: 134/255, green: 25/255, blue: 143/255)
        case 900: return Color(red: 112/255, green: 26/255, blue: 117/255)
        default: return Color(red: 217/255, green: 70/255, blue: 239/255)
        }
    }
    
    static func rose(_ shade: Int) -> Color {
        switch shade {
        case 50: return Color(red: 255/255, green: 241/255, blue: 242/255)
        case 100: return Color(red: 255/255, green: 228/255, blue: 230/255)
        case 200: return Color(red: 254/255, green: 205/255, blue: 211/255)
        case 300: return Color(red: 253/255, green: 164/255, blue: 175/255)
        case 400: return Color(red: 251/255, green: 113/255, blue: 133/255)
        case 500: return Color(red: 244/255, green: 63/255, blue: 94/255)
        case 600: return Color(red: 225/255, green: 29/255, blue: 72/255)
        case 700: return Color(red: 190/255, green: 18/255, blue: 60/255)
        case 800: return Color(red: 159/255, green: 18/255, blue: 57/255)
        case 900: return Color(red: 136/255, green: 19/255, blue: 55/255)
        default: return Color(red: 244/255, green: 63/255, blue: 94/255)
        }
    }
}
