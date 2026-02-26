//
//  TipSection.swift
//  TipCalculator
//
//  Created by NJ Rojas on 25.02.26.
//

import SwiftUI

struct TipSection: View {
    
    let bill: Double
    @Binding var selectedTip: TipChoice
    @Binding var showCustomTipSheet: Bool
    @Binding var customTipPercent: Double

    private let presetPercents: [Int] = [5, 10, 15, 20, 25]

    private var tipPercent: Int {
        switch selectedTip {
            case .preset(let p): p
            case .custom(let p): p
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Tip percentage")
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .foregroundStyle(.white.opacity(0.55))

            // 3 columns like screenshot
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 12), count: 3), spacing: 12) {
                ForEach(presetPercents, id: \.self) { percent in
                    TipButton(
                        title: "\(percent)%",
                        subtitle: subtitle(percent: Double(percent)),
                        isSelected: selectedTip == .preset(percent)
                    ) {
                        withAnimation(.spring(response: 0.25, dampingFraction: 0.85)) {
                            selectedTip = .preset(percent)
                        }
                    }
                }

                // Custom tile
                TipButton(
                    title: "Custom",
                    subtitle: selectedTip.isCustom ? "\(tipPercent)%" : "",
                    isSelected: selectedTip.isCustom
                ) {
                    customTipPercent = Double(tipPercent)
                    showCustomTipSheet = true
                }
            }
        }
    }

    private func subtitle(percent: Double) -> String {
        (bill * percent / 100.0).formatCurrency()
    }
}

#Preview {
    VStack {
        TipSection(
            bill: 100,
            selectedTip: .constant(.preset(10)),
            showCustomTipSheet: .constant(true),
            customTipPercent: .constant(10)
        )
        .padding(20)
    }
    .background(Color.blue.opacity(0.8))
}
