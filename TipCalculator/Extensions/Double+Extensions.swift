//
//  Double+Extensions.swift
//  TipCalculator
//
//  Created by NJ Rojas on 25.02.26.
//

import Foundation

extension Double {
    
    func formatCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current
        return formatter.string(from: NSNumber(value: self)) ?? "$0.00"
    }

}
