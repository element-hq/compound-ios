//
// Copyright 2023, 2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only
// Please see LICENSE in the repository root for full details.
//

import CompoundDesignTokens
import SFSafeSymbols
import SwiftUI

/// The configuration of the details portion of a list row's trailing section.
/// This consists of the title, icon and a waiting indicator.
public struct ListRowDetails<Icon: View> {
    var title: String?
    var icon: Icon?
    
    var isWaiting = false
    
    // MARK: - Initialisers
    
    public static func label(title: String,
                             icon: Icon,
                             isWaiting: Bool = false) -> Self {
        ListRowDetails(title: title, icon: icon, isWaiting: isWaiting)
    }
    
    public static func label(title: String,
                             icon: KeyPath<CompoundIcons, Image>,
                             isWaiting: Bool = false) -> Self where Icon == CompoundIcon {
        ListRowDetails(title: title, icon: CompoundIcon(icon), isWaiting: isWaiting)
    }
    
    public static func label(title: String,
                             systemIcon: SFSymbol,
                             isWaiting: Bool = false) -> Self where Icon == Image {
        ListRowDetails(title: title, icon: Image(systemSymbol: systemIcon), isWaiting: isWaiting)
    }
    
    public static func icon(_ icon: Icon, isWaiting: Bool = false) -> Self {
        ListRowDetails(icon: icon, isWaiting: isWaiting)
    }
    
    public static func icon(_ icon: KeyPath<CompoundIcons, Image>, isWaiting: Bool = false) -> Self where Icon == CompoundIcon {
        ListRowDetails(icon:CompoundIcon(icon), isWaiting: isWaiting)
    }
    
    public static func systemIcon(_ systemIcon: SFSymbol, isWaiting: Bool = false) -> Self where Icon == Image {
        ListRowDetails(icon: Image(systemSymbol: systemIcon), isWaiting: isWaiting)
    }
}

public extension ListRowDetails where Icon == Image {
    static func title(_ title: String, isWaiting: Bool = false) -> Self {
        ListRowDetails(title: title, isWaiting: isWaiting)
    }
    
    static func isWaiting(_ isWaiting: Bool) -> Self {
        ListRowDetails(isWaiting: isWaiting)
    }
}
