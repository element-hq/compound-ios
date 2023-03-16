//
//  AllCases.swift
//  Compound Inspector
//
//  Created by Doug on 16/03/2023.
//

import Compound
import SwiftUI

extension CompoundColors {
    var allColors: [String: Color] {
        var colors: [String: Color] = [:]
        let mirror = Mirror(reflecting: self)
        
        for property in mirror.children {
            if let label = property.label, let color = property.value as? Color {
                colors[label] = color
            }
        }
        
        return colors
    }
}

extension CompoundFonts {
    var allFonts: [String: Font] {
        var fonts: [String: Font] = [:]
        let mirror = Mirror(reflecting: self)
        
        for property in mirror.children {
            if let label = property.label, let font = property.value as? Font {
                fonts[label] = font
            }
        }
        
        return fonts
    }
}
