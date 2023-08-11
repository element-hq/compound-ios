//
//  IconsScreen.swift
//  Compound Inspector
//
//  Created by Doug on 01/06/2023.
//

import SwiftUI
import Compound

struct IconsScreen: View {
    let icons = Image.compound.allIcons.sorted(by: { $0.name < $1.name })
    
    var body: some View {
        ScreenContent(navigationTitle: "Icons") {
            ForEach(icons, id: \.name) { icon in
                IconItem(icon: icon.value, name: icon.name)
            }
        }
    }
}

struct IconItem: View {
    let icon: Image
    let name: String
    
    var body: some View {
        Label {
            Text(name)
                .foregroundColor(.compound.textPrimary)
        } icon: {
            CompoundIcon(customImage: icon)
                .foregroundColor(.compound.iconSecondary)
        }
        .font(.compound.bodyLG)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct IconsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            IconsScreen()
        }
        .previewLayout(.fixed(width: 375, height: 750))
    }
}
