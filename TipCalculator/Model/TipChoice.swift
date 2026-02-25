//
//  TipChoice.swift
//  TipCalculator
//
//  Created by NJ Rojas on 25.02.26.
//

import Foundation

enum TipChoice: Equatable {

    case preset(Int)
    case custom(Int)

    var isCustom: Bool {
        if case .custom = self { return true }
        return false
    }
}
