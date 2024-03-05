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
enum ListRowTrailingSectionSpacing {
    static let horizontal = 8.0
}

/// The style applied to the details label in a list row's trailing section.
private struct ListRowDetailsLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: ListRowTrailingSectionSpacing.horizontal) {
            configuration.title
                .foregroundColor(.compound.textSecondary)
            configuration.icon
                .foregroundColor(.compound.iconPrimary)
        }
        .font(.compound.bodyLG)
    }
}

/// The view shown to the right of the `ListRowLabel` inside of a `ListRow`.
/// This consists of both the `ListRowDetails` and the `ListRowAccessory`.
public struct ListRowTrailingSection<Icon: View>: View {
    var title: String?
    var icon: Icon?
    
    var isWaiting = false
    var accessory: ListRowAccessory?
    
    @ScaledMetric private var iconSize = 24
    private var hideAccessory: Bool { isWaiting && accessory?.kind == .unselected }
    
    init(_ details: ListRowDetails<Icon>?, accessory: ListRowAccessory? = nil) {
        title = details?.title
        icon = details?.icon
        isWaiting = details?.isWaiting ?? false
        self.accessory = accessory
    }
    
    public var body: some View {
        HStack(spacing: ListRowTrailingSectionSpacing.horizontal) {
            if isWaiting {
                ProgressView()
            }
            
            if title != nil || icon != nil {
                Label {
                    title.map(Text.init)
                } icon: {
                    icon
                }
                .labelStyle(ListRowDetailsLabelStyle())
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

struct ListRowTrailingSection_Previews: PreviewProvider, PrefireProvider {
    static let someCondition = true
    static let otherCondition = true
    
    static var previews: some View {
        VStack(spacing: 40) {
            details
            withAccessory
        }
        .snapshot(perceptualPrecision: 0.98)
    }
    
    static var details: some View {
        VStack(spacing: 20) {
            ListRowTrailingSection(.label(title: "Content", icon: Image(systemName: "square.dashed")))
            ListRowTrailingSection(.label(title: "Content", systemIcon: .squareDashed))
            ListRowTrailingSection(.title("Content"))
            ListRowTrailingSection(.icon(Image(systemName: "square.dashed")))
            ListRowTrailingSection(.systemIcon(.squareDashed))
            ListRowTrailingSection(.isWaiting(true))
            
            ListRowTrailingSection(.systemIcon(.checkmark))
            ListRowTrailingSection(.title("Hello"))
            
            ListRowTrailingSection(someCondition ? .isWaiting(true) : otherCondition ? .systemIcon(.checkmark) : .title("Hello"))
        }
    }
    
    static var withAccessory: some View {
        VStack(spacing: 20) {
            ListRowTrailingSection(.isWaiting(true), accessory: .selection(true))
                .border(.purple)
            
            // The checkmark should be hidden.
            ListRowTrailingSection(.isWaiting(true), accessory: .selection(false))
                .border(.purple)
            
            // The checkmark's space should be reserved.
            ListRowTrailingSection(.isWaiting(false), accessory: .selection(false))
                .border(.purple)
        }
    }
}
