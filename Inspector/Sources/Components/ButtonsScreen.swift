//
//  ButtonsScreen.swift
//  Compound Inspector
//
//  Created by Doug on 06/05/2022.
//

import Compound
import SwiftUI

struct ButtonsScreen: View {
    var body: some View {
        ScreenContent(navigationTitle: "Buttons") {
            CompoundButtonStyle_Previews.previews
        }
    }
}

struct ButtonsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ButtonsScreen()
        }
        .previewLayout(.fixed(width: 375, height: 700))
    }
}
