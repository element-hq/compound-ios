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

import SwiftUI

/// The spacing used inside of a ListRow
enum ListRightSectionSpacing {
    static let horizontal = 8.0
}

/// The style applied to the details label in a list row's right section.
private struct ListDetailsLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: ListRightSectionSpacing.horizontal) {
            configuration.title
                .foregroundColor(.compound.textSecondary)
            configuration.icon
                .foregroundColor(.compound.iconPrimary)
        }
        .font(.compound.bodyLG)
    }
}

/// The view shown to the right of the `ListLabel` inside of a `ListRow`.
/// This consists of both the `ListDetails` and the `ListRowAccessory`.
public struct ListRightSection<Icon: View>: View {
    var title: String?
    var icon: Icon?
    
    var isWaiting = false
    var accessory: ListRowAccessory?
    
    @ScaledMetric private var iconSize = 24
    private var hideAccessory: Bool { isWaiting && accessory == .unselected }
    
    init(_ details: ListDetails<Icon>?, accessory: ListRowAccessory? = nil) {
        title = details?.title
        icon = details?.icon
        isWaiting = details?.isWaiting ?? false
        self.accessory = accessory
    }
    
    public var body: some View {
        HStack(spacing: ListRightSectionSpacing.horizontal) {
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
            
            if let accessory, !hideAccessory {
                accessory
            }
        }
        .frame(minWidth: iconSize)
        .accessibilityElement(children: .combine)
    }
}

// MARK: - Previews

import Prefire

struct ListRightSection_Previews: PreviewProvider, PrefireProvider {
    static let someCondition = true
    static let otherCondition = true
    
    static var previews: some View {
        VStack(spacing: 40) {
            details
            withAccessory
        }
    }
    
    static var details: some View {
        VStack(spacing: 20) {
            ListRightSection(.label(title: "Content", icon: Image(systemName: "square.dashed")))
            ListRightSection(.label(title: "Content", systemIcon: .squareDashed))
            ListRightSection(.title("Content"))
            ListRightSection(.icon(Image(systemName: "square.dashed")))
            ListRightSection(.systemIcon(.squareDashed))
            ListRightSection(.isWaiting(true))
            
            ListRightSection(.systemIcon(.checkmark))
            ListRightSection(.title("Hello"))
            
            ListRightSection(someCondition ? .isWaiting(true) : otherCondition ? .systemIcon(.checkmark) : .title("Hello"))
        }
    }
    
    static var withAccessory: some View {
        VStack(spacing: 20) {
            ListRightSection(.isWaiting(true), accessory: .selected)
                .border(.purple)
            
            // The checkmark should be hidden.
            ListRightSection(.isWaiting(true), accessory: .unselected)
                .border(.purple)
            
            // The checkmark's space should be reserved.
            ListRightSection(.isWaiting(false), accessory: .unselected)
                .border(.purple)
        }
    }
}
