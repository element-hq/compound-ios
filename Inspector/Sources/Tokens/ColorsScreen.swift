//
//  ColorsScreen.swift
//  Compound Inspector
//
//  Created by Doug on 06/05/2022.
//

import SwiftUI
import CompoundTokens

struct ColorsScreen: View {
    var body: some View {
        ScreenContent(navigationTitle: "Colors") {
            let allColors = CompoundColors.allColors
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
                Text(color.description)
                    .font(.footnote)
                    .foregroundColor(CompoundColors.coreSecondaryContent)
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
                    .strokeBorder(CompoundColors.corePrimaryContent, lineWidth: 1.5)
                    .opacity(0.2)
            }
    }
    
    var swatchShape: some InsettableShape {
        RoundedRectangle(cornerRadius: 12, style: .continuous)
    }
}

struct ColorsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ColorsScreen()
        }
        .previewLayout(.fixed(width: 375, height: 700))
        .navigationViewStyle(.stack)
    }
}
