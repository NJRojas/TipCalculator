//
//  String+Extensions.swift
//  TipCalculator
//
//  Created by NJ Rojas on 25.02.26.
//

import Foundation

extension String {
    
    func parseAmount() -> Double {
        // Accept "48,50" or "48.50"
        let normalized = self.replacingOccurrences(of: ",", with: ".")
        return Double(normalized) ?? 0
    }
}
