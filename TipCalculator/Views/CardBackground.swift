//
//  CardBackground.swift
//  TipCalculator
//
//  Created by NJ Rojas on 25.02.26.
//

import SwiftUI

struct CardBackground: View {

    var body: some View {
        LinearGradient(
            colors: [
                Color(red: 0.34, green: 0.73, blue: 0.60),
                Color(red: 0.16, green: 0.56, blue: 0.52)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .overlay(
            LinearGradient(
                colors: [
                    .white.opacity(0.10),
                    .clear
                ],
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .ignoresSafeArea()
    }
}

#Preview {
    CardBackground()
}
