//
// Copyright 2023, 2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only
// Please see LICENSE in the repository root for full details.
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
    
    /// List styles and components
    case list
    /// Label styles
    case labels
    /// Button styles
    case buttons
    /// Text field styles.
    case textFields
    
    /// The system's confirmation dialog component
    case actionSheet
    /// The system's alert component
    case alert
    /// The system's context menu component
    case contextMenu
    /// The system's navigation bar component
    case navigationBar
    /// The system's share sheet component
    case shareSheet
    
    var body: some View {
        switch self {
        case .colors: ColorsScreen()
        case .fonts: FontsScreen()
        case .icons: IconsScreen()
        
        case .list: ListScreen()
        case .sizes: EmptyView()
        case .labels: EmptyView()
        case .buttons: ButtonsScreen()
        case .textFields: EmptyView()
        
        case .actionSheet: ActionSheetScreen()
        case .alert: AlertScreen()
        case .contextMenu: ContextMenuScreen()
        case .navigationBar: NavigationBarScreen()
        case .shareSheet: ShareSheetScreen()
        }
    }
}
