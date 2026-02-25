//
//  CustomTipSheet.swift
//  TipCalculator
//
//  Created by NJ Rojas on 25.02.26.
//

import SwiftUI

struct CustomTipSheet: View {

    @Binding var customTipPercent: Double
    var onDone: (Double) -> Void

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            VStack(spacing: 18) {
                Text("Custom tip")
                    .font(.system(size: 22, weight: .bold, design: .rounded))

                Text("\(Int(customTipPercent))%")
                    .font(.system(size: 44, weight: .bold, design: .rounded))
                    .monospacedDigit()

                Slider(value: $customTipPercent, in: 1...100, step: 1)

                Text("Tip is rounded to a whole percent.")
                    .font(.system(size: 14, weight: .medium))
                    .foregroundStyle(.secondary)

                Spacer()
            }
            .padding(20)
            .navigationTitle("Tip")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        onDone(customTipPercent)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    CustomTipSheet(customTipPercent: .constant(10), onDone: { _ in  })
}
