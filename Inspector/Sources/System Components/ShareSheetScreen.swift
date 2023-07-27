//
//  ShareSheetScreen.swift
//  Compound Inspector
//
//  Created by Doug on 27/07/2023.
//

import SwiftUI
import Compound

struct ShareSheetScreen: View {
    var body: some View {
        ScreenContent(navigationTitle: "Share Sheets") {
            Text("This component will be rendered differently when running on macOS.")
                .font(.footnote)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
            
            ShareLink(item: URL(string: "https://element.io")!, subject: Text("The subject"), message: Text("The message"))
                .padding(.top)
        }
    }
}

struct ShareSheetScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ShareSheetScreen()
        }
        .previewLayout(.fixed(width: 375, height: 750))
    }
}
