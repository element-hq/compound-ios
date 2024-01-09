//
// Copyright 2023 New Vector Ltd
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
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
