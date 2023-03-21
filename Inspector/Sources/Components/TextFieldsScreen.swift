//
//  TextFieldsScreen.swift
//  Compound Inspector
//
//  Created by Doug on 06/05/2022.
//

import SwiftUI
import DesignKit

struct TextFieldsScreen: View {
    var body: some View {
        ScreenContent(navigationTitle: "Text Fields") {
            BorderedInputFieldStyle_Previews.states
        }
    }
}

struct TextFieldsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TextFieldsScreen()
        }
        .previewLayout(.fixed(width: 375, height: 700))
    }
}
