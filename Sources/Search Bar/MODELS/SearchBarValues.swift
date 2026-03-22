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
            return 44
        }
    }
    
    static let horizontalIconsSize: CGFloat = 17
    
    static func magnifierLeadingPadding(_ iOSVersion: iOSVersions) -> CGFloat {
        switch iOSVersion {
        case .iOS17:
            return 8
            
        case .iOS26:
            return 14
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
            return 15
        }
    }
    
    static func blurEffectPlainColorWidth(_ iOSVersion: iOSVersions) -> CGFloat {
        switch iOSVersion {
        case .iOS17:
            return 30
            
        case .iOS26:
            return 45
        }
    }
    
    static let blurEffectBlurColorWidth: CGFloat = 62
    
    static func blurEffectBlurColorRadius(_ iOSVersion: iOSVersions) -> CGFloat {
        switch iOSVersion {
        case .iOS17:
            return 10
            
        case .iOS26:
            return 8
        }
    }
    
    static let dismissButtonOffsetX: CGFloat = 53
}
