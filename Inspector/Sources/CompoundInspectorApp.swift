//
//  CompoundInspectorApp.swift
//  Compound Inspector
//
//  Created by Doug on 06/05/2022.
//

import SwiftUI
import Compound
import HyperionCore

@main
struct CompoundInspectorApp: App {
    @State private var colorScheme: ColorScheme = .light
    
    private var isDark: Bool { colorScheme == .dark }
    
    var body: some Scene {
        WindowGroup {
            NavigationSplitView {
                SidebarList()
                    .navigationTitle("Components")
            } detail: {
                EmptyView()
            }
            .accentColor(.compound.textActionPrimary)
            .preferredColorScheme(colorScheme)
        }
        .commands {
            CommandMenu("Options") {
                Button("Hyperion", action: HyperionManager.sharedInstance().togglePluginDrawer)
                    .keyboardShortcut("i", modifiers: [.command, .option])
                
                Divider()
                
                Button("Toggle Appearance", action: toggleDarkMode)
                    .keyboardShortcut("a", modifiers: [.command, .shift])
            }
        }
    }
    
    func toggleDarkMode() {
        colorScheme = isDark ? .light : .dark
    }
}
