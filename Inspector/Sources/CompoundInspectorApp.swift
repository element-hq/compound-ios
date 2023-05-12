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
    @State private var dynamicTypeSize: DynamicTypeSize = .large
    
    private var isDark: Bool { colorScheme == .dark }
    
    var body: some Scene {
        WindowGroup {
            NavigationSplitView {
                SidebarList()
                    .navigationTitle("Components")
                    #if targetEnvironment(macCatalyst)
                    .dynamicTypeSize(.large)
                    #endif
            } detail: {
                EmptyView()
            }
            .accentColor(.compound.textActionPrimary)
            .preferredColorScheme(colorScheme)
            #if targetEnvironment(macCatalyst)
            .dynamicTypeSize(dynamicTypeSize)
            #endif
        }
        .commands {
            CommandMenu("Options") {
                Button("Hyperion", action: HyperionManager.sharedInstance().togglePluginDrawer)
                    .keyboardShortcut("i", modifiers: [.command, .option])
                
                Divider()
                
                Button("Toggle Appearance", action: toggleDarkMode)
                    .keyboardShortcut("a", modifiers: [.command, .shift])
                
                #if targetEnvironment(macCatalyst)
                Picker("Text Size", selection: $dynamicTypeSize) {
                    ForEach(DynamicTypeSize.allCases, id: \.self) { size in
                        Text(String(describing: size)).tag(size)
                    }
                }
                #endif
            }
        }
    }
    
    func toggleDarkMode() {
        colorScheme = isDark ? .light : .dark
    }
}
