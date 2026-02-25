//
//  TipButton.swift
//  TipCalculator
//
//  Created by NJ Rojas on 25.02.26.
//

import SwiftUI

struct TipButton: View {

    let title: String
    let subtitle: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Text(title)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .foregroundStyle(.white.opacity(0.92))

                if !subtitle.isEmpty {
                    Text(subtitle)
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                        .foregroundStyle(.white.opacity(0.75))
                        .monospacedDigit()
                } else {
                    Text(" ")
                        .font(.system(size: 14, weight: .semibold, design: .rounded))
                        .foregroundStyle(.clear)
                }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 72)
            .background(isSelected ? .black.opacity(0.14) : .white.opacity(0.10))
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .stroke(isSelected ? .white.opacity(0.22) : .white.opacity(0.14), lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    TipButton(
        title: "Custom",
        subtitle: "15%",
        isSelected: true, action: { }
    )
    .padding(20)
}
