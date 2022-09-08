//
//  SidebarList.swift
//  Compound Inspector
//
//  Created by Doug on 06/05/2022.
//

import SwiftUI

struct SidebarList: View {
    var body: some View {
        List {
            tokensSection
            componentsSection
        }
        .navigationTitle("Components")
        .listStyle(.sidebar)
    }
    
    var tokensSection: some View {
        Section("Tokens") {
            NavigationLink(destination: ColorsScreen.init()) {
                Label("Colours", systemImage: "paintpalette")
            }
            NavigationLink(destination: ColorsScreen.init()) {
                Label("Sizes", systemImage: "ruler")
            }
            .disabled(true)
            NavigationLink(destination: ColorsScreen.init()) {
                Label("Typography", systemImage: "character")
            }
            .disabled(true)
        }
    }
    
    var componentsSection: some View {
        Section("Components") {
            NavigationLink(destination: ColorsScreen.init()) {
                Label("Labels", systemImage: "character.textbox")
            }
            NavigationLink(destination: ColorsScreen.init()) {
                Label("Text Fields", systemImage: "character.cursor.ibeam")
            }
        }
        .disabled(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SidebarList()
        }
    }
}
