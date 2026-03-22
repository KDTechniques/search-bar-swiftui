//
//  iOSVersionEnvironmentKey.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2026-03-22.
//

import Foundation

import SwiftUI

public enum iOSVersions: CaseIterable, Sendable {
    case iOS17, iOS26
}

struct iOSVersionEnvironmentKey: EnvironmentKey {
    static let defaultValue: iOSVersions = .iOS17
}

extension EnvironmentValues {
    var iOSVersion: iOSVersions {
        get { self[iOSVersionEnvironmentKey.self] }
        set { self[iOSVersionEnvironmentKey.self] = newValue }
    }
}
