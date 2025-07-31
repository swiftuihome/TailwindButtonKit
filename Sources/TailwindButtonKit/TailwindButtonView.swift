//
//  TailwindButtonView.swift
//  TailwindButtonKit
//
//  Created by devlink on 2025/7/31.
//

import SwiftUI

// 按钮使用示例
struct TailwindButtonView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // 不同颜色按钮
                HStack {
                    TailwindButton("Slate", color: .slate) {}
                    TailwindButton("Gray", color: .gray) {}
                    TailwindButton("Zinc", color: .zinc) {}
                }
                
                HStack {
                    TailwindButton("Red", color: .red) {}
                    TailwindButton("Orange", color: .orange) {}
                    TailwindButton("Amber", color: .amber) {}
                }
                
                HStack {
                    TailwindButton("Yellow", color: .yellow) {}
                    TailwindButton("Lime", color: .lime) {}
                    TailwindButton("Green", color: .green) {}
                }
                
                HStack {
                    TailwindButton("Emerald", color: .emerald) {}
                    TailwindButton("Teal", color: .teal) {}
                    TailwindButton("Cyan", color: .cyan) {}
                }
                
                HStack {
                    TailwindButton("Sky", color: .sky) {}
                    TailwindButton("Blue", color: .blue) {}
                    TailwindButton("Indigo", color: .indigo) {}
                }
                
                HStack {
                    TailwindButton("Violet", color: .violet) {}
                    TailwindButton("Purple", color: .purple) {}
                    TailwindButton("Fuchsia", color: .fuchsia) {}
                }
                
                HStack {
                    TailwindButton("Pink", color: .pink) {}
                    TailwindButton("Rose", color: .rose) {}
                }
                
                // 不同样式
                VStack(spacing: 10) {
                    TailwindButton("Solid", style: .solid) {}
                    TailwindButton("Outline", style: .outline) {}
                    TailwindButton("Light", style: .light) {}
                    TailwindButton("Subtle", style: .subtle) {}
                }
                
                // 不同尺寸
                HStack {
                    TailwindButton("Small", size: .small) {}
                    TailwindButton("Medium", size: .medium) {}
                    TailwindButton("Large", size: .large) {}
                }
                
                // 带图标的按钮
                TailwindButton("With Icon", icon: "star.fill") {}
                
                // 组合示例
                TailwindButton("Premium", icon: "crown.fill", size: .large, style: .solid, color: .amber) {}
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    TailwindButtonView()
        .preferredColorScheme(.light)
}

#Preview {
    TailwindButtonView()
        .preferredColorScheme(.dark)
}
