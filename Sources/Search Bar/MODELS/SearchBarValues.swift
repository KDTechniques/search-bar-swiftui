//
//  File.swift
//  search-bar-swiftui
//
//  Created by Mr. Kavinda Dilshan on 2026-03-22.
//

import SwiftUI

struct SearchBarValues {
    static func containerHeight(_ iOSVersion: iOSVersions) -> CGFloat {
        switch iOSVersion {
        case .iOS17:
            return 36
            
        case .iOS26:
            return 49
        }
    }
    
    static let horizontalIconsSize: CGFloat = 17
    
    static func magnifierLeadingPadding(_ iOSVersion: iOSVersions) -> CGFloat {
        switch iOSVersion {
        case .iOS17:
            return 8
            
        case .iOS26:
            return 20
        }
    }
    
    static func TextFieldTrailingPadding(_ iOSVersion: iOSVersions) -> CGFloat {
        switch iOSVersion {
        case .iOS17:
            return 8
            
        case .iOS26:
            return 13
        }
    }
    
    static func clearTextButtonTrailingPadding(_ iOSVersion: iOSVersions) -> CGFloat {
        switch iOSVersion {
        case .iOS17:
            return 7
            
        case .iOS26:
            return Self.magnifierLeadingPadding(.iOS26)
        }
    }
    
    /// finalize the folling property later
    static let containerColor: Color = .red.opacity(0.1)
}
