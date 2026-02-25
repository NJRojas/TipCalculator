//
//  TipCard.swift
//  TipCalculator
//
//  Created by NJ Rojas on 25.02.26.
//

import SwiftUI

struct TipCard: View {
     
    @State private var billText: String = "10.0"
    @State private var people: Int = 1
    @State private var isEditingBill: Bool = false

    @Binding var selectedTip: TipChoice
    @Binding var showCustomTipSheet: Bool
    @Binding var customTipPercent: Double

    private let presetPercents: [Int] = [10, 15, 18, 20, 25]

    private var bill: Double {
        billText.parseAmount()
    }
    
    private var tipPercent: Int {
        switch selectedTip {
            case .preset(let p): p
            case .custom(let p): p
        }
    }

    private var tipTotal: Double {
        bill * (Double(tipPercent) / 100.0)
    }

    private var billTotal: Double {
        bill + tipTotal
    }

    private var totalPerPerson: Double {
        guard people > 0 else { return 0 }
        return billTotal / Double(people)
    }

    private var tipPerPerson: Double {
        guard people > 0 else { return 0 }
        return tipTotal / Double(people)
    }

    var body: some View {
        VStack(spacing: 18) {
            header
            subtotalRow
            TipSection(
                bill: billText,
                selectedTip: $selectedTip,
                showCustomTipSheet: $showCustomTipSheet,
                customTipPercent: $customTipPercent,
            )
            PeopleRow(people: $people)
            Spacer()
            BottomPanel(
                totalPerPerson: totalPerPerson,
                tipPerPerson: tipPerPerson,
                billTotal: billTotal
            )
        }
        .padding(20)
        .clipShape(RoundedRectangle(cornerRadius: 18, style: .continuous))
        .shadow(color: .black.opacity(0.18), radius: 18, x: 0, y: 10)
    }

    private var header: some View {
        HStack {
            Text("Tip Calculator")
                .font(.system(size: 28, weight: .semibold, design: .rounded))
                .foregroundStyle(.white.opacity(0.95))
                .multilineTextAlignment(.center)
        }
        .padding(.bottom, 10)
    }

    private var subtotalRow: some View {
        HStack(spacing: 14) {
            Text("Bill subtotal")
                .font(.system(size: 18, weight: .medium, design: .rounded))
                .foregroundStyle(.white.opacity(0.6))

            Spacer()

            HStack(spacing: 10) {
                if isEditingBill {
                    TextField("", text: $billText)
                        .keyboardType(.decimalPad)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundStyle(.white.opacity(0.9))
                        .multilineTextAlignment(.trailing)
                        .frame(width: 110)
                } else {
                    Text(bill.formatCurrency())
                        .font(.system(size: 18, weight: .semibold, design: .rounded))
                        .foregroundStyle(.white.opacity(0.9))
                        .frame(minWidth: 110, alignment: .trailing)
                }
                EditButton(action: { isEditingBill.toggle() })
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 10)
            .background(.white.opacity(0.10))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .overlay(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(.white.opacity(0.16), lineWidth: 1)
            )
        }
    }
}

#Preview {
    VStack {
        TipCard(
            selectedTip: .constant(.preset(15)),
            showCustomTipSheet: .constant(false),
            customTipPercent: .constant(15)
        )
    }
    .background(Color(red: 0.34, green: 0.73, blue: 0.60))
}
