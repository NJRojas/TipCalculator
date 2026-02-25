//
//  ShareButton.swift
//  TipCalculator
//
//  Created by NJ Rojas on 25.02.26.
//

import SwiftUI

struct ShareButton: View {
    var body: some View {
        Button {
            print("Implement Share")
        } label: {
            Image(systemName: "square.and.arrow.up")
                .font(.system(size: 14, weight: .semibold))
                .foregroundStyle(.white.opacity(0.75))
                .contentShape(Rectangle())
        }
    }
}
