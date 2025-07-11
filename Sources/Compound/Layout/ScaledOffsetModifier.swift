//
// Copyright 2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import SwiftUI

public extension View {
    /// Offset this view by the specified horizontal and vertical distances, scaled relative to the user's selected font size.
    func scaledOffset(x: CGFloat = 0, y: CGFloat = 0, relativeTo textStyle: Font.TextStyle = .body) -> some View {
        modifier(ScaledOffsetModifier(x: x, y: y, relativeTo: textStyle))
    }
}

private struct ScaledOffsetModifier: ViewModifier {
    @ScaledMetric var x: CGFloat
    @ScaledMetric var y: CGFloat
    
    init(x: CGFloat, y: CGFloat, relativeTo textStyle: Font.TextStyle) {
        _x = ScaledMetric(wrappedValue: x, relativeTo: textStyle)
        _y = ScaledMetric(wrappedValue: y, relativeTo: textStyle)
    }
    
    func body(content: Content) -> some View {
        content.offset(x: x, y: y)
    }
}


// MARK: - Previews

struct ScaledOffsetModifier_Previews: PreviewProvider, TestablePreview {
    static var previews: some View {
        VStack {
            ForEach(DynamicTypeSize.allCases, id: \.self) { size in
                verifiedUserComposite
                    .dynamicTypeSize(size)
            }
        }
    }
    
    static var verifiedUserComposite: some View {
        CompoundIcon(\.userSolid)
            .foregroundStyle(.compound.iconAccentTertiary)
            .overlay {
                CompoundIcon(\.verified, size: .custom(10), relativeTo: .body)
                    .scaledOffset(x: 6, y: 6)
                    .foregroundStyle(.compound.gradientActionStop1)
            }
    }
}
