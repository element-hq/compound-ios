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
import SwiftUI

public extension LabelStyle where Self == FormRowLabelStyle {
    /// A label style that applies Compound design tokens for a row within a `Form`.
    /// - Parameter secondaryText: If the row's title has supporting text, it should be passed in here.
    /// - Parameter role: An optional semantic role describing the row's purpose.
    /// - Parameter alignment: The vertical alignment between the label's icon and title.
    /// - Parameter hideIconBackground: Pass `true` if the default icon background should be hidden.
    static func compoundFormRow(secondaryText: String? = nil,
                                role: FormRowLabelStyle.Role? = nil,
                                alignment: VerticalAlignment = .center,
                                hideIconBackground: Bool = false) -> FormRowLabelStyle {
        FormRowLabelStyle(secondaryText: secondaryText,
                          role: role,
                          alignment: alignment,
                          hideIconBackground: hideIconBackground)
    }
}

/// Default label styling for form rows.
///
/// The icon will be inset inside a square with rounded corners and the title
/// will be given the correct font and colour.
public struct FormRowLabelStyle: LabelStyle {
    @Environment(\.isEnabled) private var isEnabled
    @ScaledMetric private var menuIconSize = 30.0
    
    /// A value that describes the purpose of a row.
    public enum Role { case destructive }
    
    /// Supporting text that will be shown beneath the title.
    let secondaryText: String?
    /// An optional semantic role describing the row's purpose.
    let role: Role?
    /// The vertical alignment between the label's icon and title.
    let alignment: VerticalAlignment
    /// Whether or not the default icon background should be hidden.
    let hideIconBackground: Bool
    
    var titleColor: Color {
        guard isEnabled else { return .compound.textDisabled }
        return role == .destructive ? .compound.textCriticalPrimary : .compound.textPrimary
    }
    
    var secondaryTextColor: Color {
        isEnabled ? .compound.textSecondary : .compound.textDisabled
    }
    
    var iconForegroundColor: Color {
        guard isEnabled else { return .compound.iconTertiaryAlpha }
        if role == .destructive { return .compound.textCriticalPrimary }
        return hideIconBackground ? .compound.iconPrimary : .compound.iconTertiaryAlpha
    }
    
    var iconBackgroundColor: Color {
        if hideIconBackground { return .clear }
        guard isEnabled else { return .compound._bgSubtleSecondaryAlpha }
        return role == .destructive ? .compound._bgCriticalSubtleAlpha : .compound._bgSubtleSecondaryAlpha
    }

    public func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: alignment, spacing: 16) {
            configuration.icon
                .foregroundColor(iconForegroundColor)
                .frame(width: menuIconSize, height: menuIconSize)
                .background(iconBackgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 2) {
                configuration.title
                    .font(.compound.bodyLG)
                    .foregroundColor(titleColor)
                
                if let secondaryText {
                    Text(secondaryText)
                        .font(.compound.bodySM)
                        .foregroundColor(secondaryTextColor)
                }
            }
            .padding(.vertical, FormRow.verticalPadding)
        }
    }
}

public struct FormRowLabelStyle_Previews: PreviewProvider {
    public static var previews: some View {
        Form {
            Section {
                states
            }
            .compoundFormSection()
        }
        .compoundForm()
    }
    
    @ViewBuilder
    public static var states: some View {
        Label("Person", systemImage: "person")
            .labelStyle(.compoundFormRow())
        
        Label("Help", systemImage: "questionmark.circle")
            .labelStyle(.compoundFormRow(secondaryText: "Supporting text"))
        
        Label("Trash", systemImage: "trash")
            .labelStyle(.compoundFormRow(role: .destructive))
        
        Label("Camera", systemImage: "camera")
            .labelStyle(.compoundFormRow(hideIconBackground: true))
        
        Label("Remove", systemImage: "person.badge.minus")
            .labelStyle(.compoundFormRow(role: .destructive, hideIconBackground: true))
    }
}
