//
//  AllCases.swift
//  Compound Inspector
//
//  Created by Doug on 16/03/2023.
//

import Compound
import SwiftUI

extension CompoundColors {
    var allColors: [(name: String, value: Color)] {
        var colors: [(name: String, value: Color)] = []
        let mirror = Mirror(reflecting: self)
        
        for property in mirror.children {
            if let label = property.label, let color = property.value as? Color {
                colors.append((label, color))
            }
        }
        
        return colors
    }
}

extension CompoundFonts {
    var allFonts: [(name: String, value: Font)] {
        var fonts: [(name: String, value: Font)] = []
        let mirror = Mirror(reflecting: self)
        
        for property in mirror.children {
            if let label = property.label, let font = property.value as? Font {
                fonts.append((label, font))
            }
        }
        
        return fonts
    }
}
