//
//  ScreenContent.swift
//  Compound Inspector
//
//  Created by Doug on 06/05/2022.
//

import SwiftUI
import HyperionCore

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
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button(action: HyperionManager.sharedInstance().togglePluginDrawer) {
                Image(systemName: "ruler")
            }
        }
    }
}

struct ComponentsContainer_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ScreenContent(navigationTitle: "Buttons") {
                Button("Confirm") { }
            }
        }
    }
}
