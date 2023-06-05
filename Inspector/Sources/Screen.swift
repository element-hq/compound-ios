//
//  Screen.swift
//  Compound Inspector
//
//  Created by Doug on 05/06/2023.
//

import SwiftUI

/// A screen of components/tokens that can be navigated to.
enum Screen: Hashable, View {
    /// Color tokens
    case colors
    /// Font tokens
    case fonts
    /// Icon tokens
    case icons
    /// Size tokens
    case sizes
    
    /// Form styles and components
    case form
    /// Label styles
    case labels
    /// Button styles
    case buttons
    /// Text field styles.
    case textFields
    
    var body: some View {
        switch self {
        case .colors: ColorsScreen()
        case .fonts: FontsScreen()
        case .icons: IconsScreen()
        case .form: FormScreen()
        case .sizes: EmptyView()
        case .labels: EmptyView()
        case .buttons: EmptyView()
        case .textFields: EmptyView()
        }
    }
}
