//
//  ContextTypes.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2024-07-31.
//

import Foundation

public enum ContextTypes: Hashable {
    case sheet // Default context
    case navigation // For navigation views
    case custom(ColorContext) // User define context
}
