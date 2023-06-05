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
            NavigationLink(value: Screen.colors) {
                Label("Colours", systemImage: "paintpalette")
            }
            NavigationLink(value: Screen.fonts) {
                Label("Typography", systemImage: "character")
            }
            NavigationLink(value: Screen.icons) {
                Label("Icons", systemImage: "pencil.and.outline")
            }
            NavigationLink(value: Screen.sizes) {
                Label("Sizes", systemImage: "ruler")
            }
            .disabled(true)
        }
    }
    
    var componentsSection: some View {
        Section("Components") {
            NavigationLink(value: Screen.form) {
                Label("Form", systemImage: "list.bullet.clipboard")
            }
            NavigationLink(value: Screen.labels) {
                Label("Labels", systemImage: "character.textbox")
            }
            .disabled(true)
            NavigationLink(value: Screen.buttons) {
                Label("Buttons", systemImage: "rectangle.and.hand.point.up.left")
            }
            .disabled(true)
            NavigationLink(value: Screen.textFields) {
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
