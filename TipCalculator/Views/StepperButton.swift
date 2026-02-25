//
//  StepperButton.swift
//  TipCalculator
//
//  Created by NJ Rojas on 25.02.26.
//

import SwiftUI

struct StepperButton: View {

    let symbol: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: symbol)
                .font(.system(size: 16, weight: .bold))
                .foregroundStyle(.white.opacity(0.85))
                .frame(width: 54, height: 44)
                .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    VStack {
        StepperButton(symbol: "plus", action: { } )
    }
    .background(Color(red: 0.16, green: 0.56, blue: 0.52))
}
