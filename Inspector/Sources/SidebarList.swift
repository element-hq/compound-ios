//
// Copyright 2023, 2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only
// Please see LICENSE in the repository root for full details.
//

import SwiftUI

struct SidebarList: View {
    var body: some View {
        List {
            tokensSection
            componentsSection
            systemComponentsSection
            missingFromFigmaSection
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
        }
    }
    
    var componentsSection: some View {
        Section("Components") {
            NavigationLink(value: Screen.list) {
                Label("List", systemImage: "list.bullet.clipboard")
            }
        }
    }
    
    var systemComponentsSection: some View {
        Section("System Components") {
            NavigationLink(value: Screen.actionSheet) {
                Label("Action Sheets", systemImage: "window.shade.closed")
            }
            
            NavigationLink(value: Screen.alert) {
                Label("Alerts", systemImage: "exclamationmark.triangle")
            }
            
            NavigationLink(value: Screen.contextMenu) {
                Label("Context Menus", systemImage: "contextualmenu.and.cursorarrow")
            }
            
            NavigationLink(value: Screen.navigationBar) {
                Label("Navigation Bar", systemImage: "window.shade.open")
            }
            
            NavigationLink(value: Screen.shareSheet) {
                Label("Share Sheet", systemImage: "square.and.arrow.up")
            }
        }
    }
    
    var missingFromFigmaSection: some View {
        Section("Missing from Figma") {
            NavigationLink(value: Screen.buttons) {
                Label("Buttons", systemImage: "rectangle.and.hand.point.up.left")
            }
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
