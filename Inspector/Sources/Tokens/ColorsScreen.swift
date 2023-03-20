//
//  ColorsScreen.swift
//  Compound Inspector
//
//  Created by Doug on 06/05/2022.
//

import SwiftUI
import Compound

struct ColorsScreen: View {
    var body: some View {
        ScreenContent(navigationTitle: "Colors") {
            let allColors = Color.compound.allColors
            ForEach(Array(allColors.keys.sorted()), id: \.self) { key in
                ColorItem(color: allColors[key]!, name: key)
            }
        }
    }
}

struct ColorItem: View {
    let color: Color
    let name: String
    
    var body: some View {
        HStack {
            swatch
            
            VStack(alignment: .leading) {
                Text(name)
                Text(color.hexValue())
                    .font(.footnote.monospaced())
                    .foregroundColor(.compound.textSecondary)
            }
        }
    }
    
    var swatch: some View {
        swatchShape
            .foregroundColor(color)
            .frame(height: 40)
            .aspectRatio(1, contentMode: .fit)
            .overlay {
                swatchShape
                    .strokeBorder(Color.compound.textPrimary, lineWidth: 1.5)
                    .opacity(0.2)
            }
    }
    
    var swatchShape: some InsettableShape {
        RoundedRectangle(cornerRadius: 12, style: .continuous)
    }
}

private extension Color {
    func hexValue() -> String {
        let uiColor = UIColor(self)
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return "#\(red.asHex)\(green.asHex)\(blue.asHex)"
    }
}

private extension CGFloat {
    var asHex: String {
        String(format:"%02X", Int((self * 255).rounded()))
    }
}

struct ColorsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ColorsScreen()
        }
        .previewLayout(.fixed(width: 375, height: 700))
    }
}
