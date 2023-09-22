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

import SFSafeSymbols
import SwiftUI

enum ListDetails {
    static let spacing = 8.0
}

/// The style applied to the details label in a list row.
private struct ListDetailsLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: ListDetails.spacing) {
            configuration.title
                .foregroundColor(.compound.textSecondary)
            configuration.icon
                .foregroundColor(.compound.iconPrimary)
        }
        .font(.compound.bodyLG)
    }
}

public struct ListDetailsLabel<Icon: View>: View {
    var title: String?
    var icon: Icon?
    
    var isWaiting = false
    
    public var body: some View {
        HStack(spacing: ListDetails.spacing) {
            if isWaiting {
                ProgressView()
            }
            
            if title != nil || icon != nil {
                Label {
                    title.map(Text.init)
                } icon: {
                    icon
                }
                .labelStyle(ListDetailsLabelStyle())
            }
        }
        .accessibilityElement(children: .combine)
    }
    
    // MARK: - Initialisers
    
    public static func label(title: String,
                             icon: Icon,
                             isWaiting: Bool = false) -> Self {
        ListDetailsLabel(title: title, icon: icon, isWaiting: isWaiting)
    }
    
    public static func label(title: String,
                             systemIcon: SFSymbol,
                             isWaiting: Bool = false) -> Self where Icon == Image {
        ListDetailsLabel(title: title, icon: Image(systemSymbol: systemIcon), isWaiting: isWaiting)
    }
    
    public static func icon(_ icon: Icon, isWaiting: Bool = false) -> Self {
        ListDetailsLabel(icon: icon, isWaiting: isWaiting)
    }
    
    public static func systemIcon(_ systemIcon: SFSymbol, isWaiting: Bool = false) -> Self where Icon == Image {
        ListDetailsLabel(icon: Image(systemSymbol: systemIcon), isWaiting: isWaiting)
    }
}

public extension ListDetailsLabel where Icon == Image {
    static func title(_ title: String, isWaiting: Bool = false) -> Self {
        ListDetailsLabel(title: title, isWaiting: isWaiting)
    }
    
    static func isWaiting(_ isWaiting: Bool) -> Self {
        ListDetailsLabel(isWaiting: isWaiting)
    }
}

// MARK: - Previews

import Prefire

struct ListDetailsLabel_Previews: PreviewProvider, PrefireProvider {
    static let someCondition = true
    static let otherCondition = true
    
    static var previews: some View {
        VStack(spacing: 20) {
            ListDetailsLabel.label(title: "Content", icon: Image(systemName: "square.dashed"))
            ListDetailsLabel.label(title: "Content", systemIcon: .squareDashed)
            ListDetailsLabel.title("Content")
            ListDetailsLabel.icon(Image(systemName: "square.dashed"))
            ListDetailsLabel.systemIcon(.squareDashed)
            ListDetailsLabel.isWaiting(true)
            
            ListDetailsLabel.systemIcon(.checkmark)
            ListDetailsLabel.title("Hello")
            
            someCondition ? ListDetailsLabel.isWaiting(true) : otherCondition ? .systemIcon(.checkmark) : .title("Hello")

        }
    }
}
