//
//  PanelBackground.swift
//  TipCalculator
//
//  Created by NJ Rojas on 25.02.26.
//

import SwiftUI

struct PanelBackground: View {
    var body: some View {
        LinearGradient(
            colors: [
                Color(red: 0.08, green: 0.43, blue: 0.43),
                Color(red: 0.06, green: 0.36, blue: 0.38)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}

#Preview {
    PanelBackground()
}
