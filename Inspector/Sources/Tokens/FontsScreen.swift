//
//  ColorsScreen.swift
//  Compound Inspector
//
//  Created by Doug on 06/05/2022.
//

import SwiftUI
import Compound

struct FontsScreen: View {
    var body: some View {
        ScreenContent(navigationTitle: "Fonts") {
            let allFonts = Font.compound.allFonts
            ForEach(Array(allFonts.keys.sorted()), id: \.self) { key in
                FontItem(font: allFonts[key]!, name: key)
            }
        }
    }
}

struct FontItem: View {
    let font: Font
    let name: String
    
    var body: some View {
        Text(name)
            .font(font)
            .foregroundColor(.compound.textPrimary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct FontsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            FontsScreen()
        }
        .previewLayout(.fixed(width: 375, height: 700))
        .navigationViewStyle(.stack)
    }
}
