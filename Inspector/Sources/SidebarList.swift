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
        .tint(.compound.iconAccentTertiary)
    }
    
    var tokensSection: some View {
        Section("Tokens") {
            NavigationLink(destination: ColorsScreen.init) {
                Label("Colours", systemImage: "paintpalette")
            }
            NavigationLink(destination: FontsScreen.init) {
                Label("Typography", systemImage: "character")
            }
            NavigationLink(destination: IconsScreen.init) {
                Label("Icons", systemImage: "pencil.and.outline")
            }
            NavigationLink(destination: ColorsScreen.init) {
                Label("Sizes", systemImage: "ruler")
            }
            .disabled(true)
        }
    }
    
    var componentsSection: some View {
        Section("Components") {
            NavigationLink(destination: FormScreen.init) {
                Label("Form", systemImage: "list.bullet.clipboard")
            }
            NavigationLink(destination: ColorsScreen.init) {
                Label("Labels", systemImage: "character.textbox")
            }
            .disabled(true)
            NavigationLink(destination: ColorsScreen.init) {
                Label("Buttons", systemImage: "rectangle.and.hand.point.up.left")
            }
            .disabled(true)
            NavigationLink(destination: ColorsScreen.init) {
                Label("Text Fields", systemImage: "character.cursor.ibeam")
            }
            .disabled(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SidebarList()
        }
    }
}
