//
//  ScreenContent.swift
//  Compound Inspector
//
//  Created by Doug on 06/05/2022.
//

import SwiftUI

/// A helper to provider a default layout for the content of a screen.
struct ScreenContent<Content: View>: View {
    let navigationTitle: String
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 16) {
                content()
            }
            .padding()
        }
        .navigationTitle(navigationTitle)
    }
}

struct ComponentsContainer_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ScreenContent(navigationTitle: "Buttons") {
                Button("Confirm") { }
            }
        }
    }
}
