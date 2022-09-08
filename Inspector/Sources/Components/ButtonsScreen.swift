//
//  ButtonsScreen.swift
//  Compound Inspector
//
//  Created by Doug on 06/05/2022.
//

import SwiftUI
import DesignKit

struct ButtonsScreen: View {
    var body: some View {
        ScreenContent(navigationTitle: "Buttons") {
            PrimaryActionButtonStyle_Previews.states
            SecondaryActionButtonStyle_Previews.states
        }
    }
}

struct ButtonsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ButtonsScreen()
        }
    }
}
