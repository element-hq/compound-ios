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

public extension PrimitiveButtonStyle where Self == FormButtonStyle {
    /// A button style that applies Compound design tokens for a tappable row within a `Form`.
    /// - Parameter secondaryText: If the row's title has supporting text, it should be passed in here.
    /// - Parameter hideIconBackground: Pass `true` if the default icon background should be hidden.
    /// - Parameter accessory: An optional accessory to be added on the trailing side of the row.
    static func compoundForm(secondaryText: String? = nil,
                             accessory: FormRowAccessory? = nil,
                             hideIconBackground: Bool = false) -> FormButtonStyle {
        FormButtonStyle(options: Options(secondaryText: secondaryText,
                                         accessory: accessory,
                                         hideIconBackground: hideIconBackground,
                                         hasCenterAlignment: false))
    }
    
    /// A button style that applies Compound design tokens for a tappable `Form` row that has a centred label.
    ///
    /// This style should only ever be used as the sole row in a section.
    static func compoundFormCentred() -> FormButtonStyle {
        FormButtonStyle(options: Options(secondaryText: nil,
                                         accessory: nil,
                                         hideIconBackground: true,
                                         hasCenterAlignment: true))
    }
}

/// A view to be added on the trailing edge of a form row.
public enum FormRowAccessory: View {
    /// A chevron to indicate that the button pushes another screen.
    case navigationLink
    /// A checkmark (when `true`) to indicate that the row is selected.
    @available(iOS, deprecated: 17.0, message: "Add the .isToggle accessibility trait to the body.")
    case selected(Bool)
    
    public var body: some View {
        switch self {
        case .navigationLink:
            Image(systemName: "chevron.forward")
                .font(.compound.bodySMSemibold)
                .foregroundColor(.compound.iconTertiaryAlpha)
        case .selected(let isSelected):
            if isSelected {
                CompoundIcon(\.check)
                    .foregroundColor(.compound.iconPrimary)
                    .accessibilityAddTraits(.isSelected)
            }
        }
    }
}

/// Supported configuration options for the style.
private struct Options {
    /// Supporting text that will be shown beneath the title.
    let secondaryText: String?
    /// An accessory to be added on the trailing side of the row.
    let accessory: FormRowAccessory?
    /// Whether or not the default icon background should be hidden.
    let hideIconBackground: Bool
    /// Whether the button's label is center aligned or not.
    let hasCenterAlignment: Bool
}

/// Default button styling for form rows.
///
/// The primitive style is needed to set the list row insets to `0`. The inner style is then needed
/// to change the background colour depending on whether the button is currently pressed or not.
public struct FormButtonStyle: PrimitiveButtonStyle {
    fileprivate let options: Options
    
    public func makeBody(configuration: Configuration) -> some View {
        Button(role: configuration.role, action: configuration.trigger) {
            configuration.label
                .frame(maxHeight: .infinity) // Make sure the label fills the cell vertically.
        }
        .buttonStyle(Style(options: options))
        .listRowInsets(EdgeInsets()) // Remove insets so the background fills the cell.
    }
    
    /// Inner style used to set the pressed background colour.
    struct Style: ButtonStyle {
        fileprivate let options: Options
        
        var alignment: Alignment { options.hasCenterAlignment ? .center : .leading }
        
        func makeBody(configuration: Configuration) -> some View {
            Group {
                if options.hasCenterAlignment {
                    centeredBody(configuration: configuration)
                } else {
                    defaultBody(configuration: configuration)
                }
            }
            .contentShape(Rectangle())
            .padding(FormRow.insets) // Re-apply the normal insets using padding.
            .background(configuration.isPressed ? Color.compound.bgSubtlePrimary : .compound.bgCanvasDefaultLevel1)
        }
        
        func defaultBody(configuration: Configuration) -> some View {
            HStack {
                configuration.label
                    .labelStyle(labelStyle(for: configuration, and: options))
                    .labeledContentStyle(.compoundForm(labelStyle: labelStyle(for: configuration, and: options)))
                    .frame(maxWidth: .infinity, alignment: alignment)
                
                options.accessory
            }
        }
        
        func centeredBody(configuration: Configuration) -> some View {
            configuration.label
                .labelStyle(FormRowCenteredLabelStyle(role: configuration.role == .destructive ? .destructive : nil,
                                                      alignment: .center))
                .frame(maxWidth: .infinity, alignment: .center)
                .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
        }
        
        private func labelStyle(for configuration: Configuration, and options: Options) -> FormRowLabelStyle {
            return .compoundFormRow(secondaryText: options.secondaryText,
                                    role: configuration.role == .destructive ? .destructive : nil,
                                    alignment: .center,
                                    hideIconBackground: options.hideIconBackground)
        }
    }
}

// MARK: - Previews

public struct FormButtonStyle_Previews: PreviewProvider {
    public static var previews: some View {
        Form {
            Section {
                states
            }
            .compoundFormSection()
            
            Section {
                centeredButton
            }
            .compoundFormSection()
            
            Section {
                destructiveCenteredButton
            }
            .compoundFormSection()
            
            Section {
                disabledCenteredButton
            }
            .compoundFormSection()
            
            Section {
                ShareLink(item: "test")
                    .buttonStyle(.compoundForm())
            }
            .compoundFormSection()
        }
        .compoundForm()
    }
    
    // MARK: - States
    
    @ViewBuilder
    public static var states: some View {
        Button { } label: {
            Label("Action", systemImage: "square.dashed")
        }
        .buttonStyle(.compoundForm(secondaryText: "Action description"))
        
        Button { } label: {
            LabeledContent {
                Label("Content", systemImage: "square.dashed")
            } label: {
                Label("Navigation", systemImage: "square.dashed")
            }
        }
        .buttonStyle(.compoundForm(secondaryText: "Navigation description",
                                   accessory: .navigationLink))
        
        Button { } label: {
            Label("Action", systemImage: "square.dashed")
        }
        .buttonStyle(.compoundForm())
        
        Button { } label: {
            Label("Navigation", systemImage: "square.dashed")
        }
        .buttonStyle(.compoundForm(accessory: .navigationLink))
        
        Button(role: .destructive) { } label: {
            Label("Destructive", systemImage: "trash")
        }
        .buttonStyle(.compoundForm())
        
        Button { } label: {
            LabeledContent {
                Text("Content")
            } label: {
                Label("Selected", systemImage: "square.dashed")
            }
        }
        .buttonStyle(.compoundForm(secondaryText: "Selected description",
                                   accessory: .selected(true)))
        
        Button { } label: {
            Label("Selected", systemImage: "square.dashed")
        }
        .buttonStyle(.compoundForm(accessory: .selected(true)))
        
        actionButtons
    }
    
    @ViewBuilder
    static var actionButtons: some View {
        Button { } label: {
            Label("Action", systemImage: "globe")
        }
        .buttonStyle(.compoundForm(hideIconBackground: true))
        
        Button(role: .destructive) { } label: {
            Label("Destructive", systemImage: "globe")
        }
        .buttonStyle(.compoundForm(hideIconBackground: true))
        
        Button { } label: {
            Label("Disabled", systemImage: "globe")
        }
        .buttonStyle(.compoundForm(hideIconBackground: true))
        .disabled(true)
        
        Button { } label: {
            Text("Action without icon")
        }
        .buttonStyle(.compoundForm())
    }
    
    public static var centeredButton: some View {
        Button { } label: {
            Label("Action", systemImage: "app.dashed")
        }
        .buttonStyle(.compoundFormCentred())
    }
    
    public static var destructiveCenteredButton: some View {
        Button(role: .destructive) { } label: {
            Label("Destructive", systemImage: "app.dashed")
        }
        .buttonStyle(.compoundFormCentred())
    }
    
    public static var disabledCenteredButton: some View {
        Button { } label: {
            Label("Disabled", systemImage: "app.dashed")
        }
        .buttonStyle(.compoundFormCentred())
        .disabled(true)
    }
}
