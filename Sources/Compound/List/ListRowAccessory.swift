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

/// A view to be added on the trailing edge of a form row.
public struct ListRowAccessory: View {
    @Environment(\.isEnabled) private var isEnabled
    
    enum Kind {
        /// A navigation chevron.
        case navigationLink
        /// A checkmark.
        case selected
        /// ``selected`` but invisible to reserve space.
        case unselected
        /// A circular checkmark.
        case multiSelected
        /// An empty circle.
        case multiUnselected
    }
    
    /// A chevron to indicate that the button pushes another screen.
    public static var navigationLink: Self {
        Self.init(kind: .navigationLink)
    }
    
    /// A checkmark (or reserved space) to indicate that the row is selected.
    public static func selection(_ isSelected: Bool) -> Self {
        Self.init(kind: isSelected ? .selected : .unselected)
    }
    
    /// A circular checkmark (or empty circle) to indicate that the row is one of multiple selected.
    public static func multiSelection(_ isSelected: Bool) -> Self {
        Self.init(kind: isSelected ? .multiSelected : .multiUnselected)
    }
    
    let kind: Kind
    
    /// Negative padding added to prevent the accessory interfering with the row's padding.
    private var verticalPaddingFix: CGFloat { -4 }
    /// Absolute bodge until we have the circle icon in Compound.
    @ScaledMetric private var circleOverlayInsets = 5
    
    public var body: some View {
        switch kind {
        case .navigationLink:
            CompoundIcon(\.chevronRight)
                .foregroundColor(.compound.iconTertiaryAlpha)
                .flipsForRightToLeftLayoutDirection(true)
        case .selected:
            CompoundIcon(\.check)
                .foregroundColor(isEnabled ? .compound.iconPrimary : .compound.iconDisabled)
                .accessibilityAddTraits(.isSelected)
                .padding(.vertical, verticalPaddingFix)
        case .unselected:
            CompoundIcon(\.check)
                .hidden()
                .padding(.vertical, verticalPaddingFix)
        case .multiSelected:
            CompoundIcon(\.checkCircleSolid)
                .foregroundColor(isEnabled ? .compound.iconPrimary : .compound.iconDisabled)
                .accessibilityAddTraits(.isSelected)
                .padding(.vertical, verticalPaddingFix)
        case .multiUnselected:
            CompoundIcon(\.checkCircle)
                .foregroundColor(isEnabled ? .compound.iconTertiary : .compound.iconDisabled)
                .overlay { Circle().inset(by: circleOverlayInsets).fill(.background) } // This is a bodge.
                .padding(.vertical, verticalPaddingFix)
        }
    }
}

// MARK: - Previews

import Prefire

struct ListRowAccessory_Previews: PreviewProvider, PrefireProvider {
    static var previews: some View {
        Grid(alignment: .leading, verticalSpacing: 16) {
            row(title: "Navigation Link", accessory: .navigationLink)
            row(title: "Navigation Link disabled", accessory: .navigationLink)
                .disabled(true)
            
            row(title: "Selected", accessory: .selection(true))
            row(title: "Selected disabled", accessory: .selection(true))
                .disabled(true)
            
            row(title: "Unselected", accessory: .selection(false))
            row(title: "Unselected disabled", accessory: .selection(false))
                .disabled(true)
            
            row(title: "Multi-selected", accessory: .multiSelection(true))
            row(title: "Multi-selected disabled", accessory: .multiSelection(true))
                .disabled(true)
            
            row(title: "Multi-unselected", accessory: .multiSelection(false))
            row(title: "Multi-unselected disabled", accessory: .multiSelection(false))
                .disabled(true)
        }
        .previewDisplayName("Accessories")
    }
    
    static func row(title: String, accessory: ListRowAccessory) -> some View {
        GridRow {
            accessory
            Text(title)
                .foregroundStyle(.compound.textSecondary)
        }
    }
}

/// Just to prove that the overlay bodge works for all Dynamic Type sizes.
struct MultiUnselectedAccessory_Previews: PreviewProvider, PrefireProvider {
    static var previews: some View {
        VStack {
            ForEach(DynamicTypeSize.allCases, id: \.self) { size in
                ListRowAccessory.multiSelection(false)
                    .dynamicTypeSize(size)
            }
        }
        .previewDisplayName("Fake circle icon")
    }
}
