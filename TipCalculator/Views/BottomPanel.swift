//
//  BottomPanel.swift
//  TipCalculator
//
//  Created by NJ Rojas on 25.02.26.
//

import SwiftUI

struct BottomPanel: View {

    let totalPerPerson: Double
    let tipPerPerson: Double
    let billTotal: Double

    var body: some View {
        VStack(spacing: 12) {
            /* To be implemented...
            HStack {
                Spacer()
                ShareButton()
            }
             */
            Text(totalPerPerson.formatCurrency())
                .font(.system(size: 44, weight: .bold, design: .rounded))
                .foregroundStyle(.white.opacity(0.95))
                .monospacedDigit()

            Text("Total per person")
                .font(.system(size: 17, weight: .medium, design: .rounded))
                .foregroundStyle(.white.opacity(0.65))

            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text(tipPerPerson.formatCurrency())
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .foregroundStyle(.white.opacity(0.9))
                        .monospacedDigit()
                    Text("Tip per person")
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .foregroundStyle(.white.opacity(0.6))
                }

                Spacer()

                VStack(alignment: .trailing, spacing: 6) {
                    Text(billTotal.formatCurrency())
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                        .foregroundStyle(.white.opacity(0.9))
                        .monospacedDigit()
                    Text("Bill total")
                        .font(.system(size: 15, weight: .medium, design: .rounded))
                        .foregroundStyle(.white.opacity(0.6))
                }
            }
            .padding(.top, 6)
        }
        .padding(18)
        .background(PanelBackground())
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .stroke(.white.opacity(0.10), lineWidth: 1)
        )
        .padding(.top, 6)
    }
}

#Preview {
    BottomPanel(totalPerPerson: 3, tipPerPerson: 3.3, billTotal: 300)
        .padding(20)
}
