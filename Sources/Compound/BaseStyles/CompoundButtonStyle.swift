//
// Copyright 2022-2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only
// Please see LICENSE in the repository root for full details.
//

import Prefire
import SwiftUI

public extension ButtonStyle where Self == CompoundButtonStyle {
    /// A button style that applies Compound design tokens to a button with various configuration options.
    /// - Parameter kind: The kind of button being shown such as primary or secondary.
    /// - Parameter size: The button size to use. Defaults to `large`.
    static func compound(_ kind: Self.Kind, size: Self.Size = .large) -> CompoundButtonStyle {
        CompoundButtonStyle(kind: kind, size: size)
    }
}

/// Default button style for standalone buttons.
public struct CompoundButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.colorScheme) private var colorScheme
    
    var kind: Kind
    public enum Kind {
        /// A stroked button that uses colour to highlight important actions.
        case `super`
        /// A filled button usually representing the default action.
        case primary
        /// A stroked button usually representing alternate actions.
        case secondary
        /// A plain button with no background. This will be renamed to `tertiary` in the future.
        case plain
    }
    
    var size: Size
    public enum Size {
        /// A button that is a regular size.
        case medium
        /// A button that is prominently sized.
        case large
    }
    
    private var horizontalPadding: CGFloat {
        switch (kind, size) {
        case (.plain, _):
            return 0
        case (_, .medium):
            return 7
        case (_, .large):
            return 12
        }
    }

    private var verticalPadding: CGFloat {
        switch (kind, size) {
        case (.plain, _):
            return 0
        case (_, .medium):
            return 7
        case (_, .large):
            return 14
        }
    }
    
    private var maxWidth: CGFloat? {
        switch kind { // This is wrong, it should be switching on size.
        case .super, .primary, .secondary:
            return .infinity
        case .plain:
            return nil
        }
    }
    
    private var pressedOpacity: Double {
        colorScheme == .light ? 0.3 : 0.6
    }

    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .frame(maxWidth: maxWidth)
            .font(.compound.bodyLGSemibold)
            .foregroundColor(textColor(configuration: configuration))
            .multilineTextAlignment(.center)
            .background {
                makeBackground(configuration: configuration)
            }
            .contentShape(contentShape)
    }
    
    @ViewBuilder
    private func makeBackground(configuration: Self.Configuration) -> some View {
        switch kind {
        case .super:
            if isEnabled {
                ZStack {
                    Capsule().fill(.compound.bgCanvasDefault)
                    Capsule().fill(LinearGradient(gradient: Color.compound.gradientSuperButton,
                                                  startPoint: .bottomLeading, endPoint: .topTrailing))
                        .opacity(0.04)
                    Capsule().stroke(LinearGradient(gradient: Color.compound.gradientSuperButton,
                                                    startPoint: .bottomLeading, endPoint: .topTrailing))
                }
                .compositingGroup()
                .opacity(configuration.isPressed ? pressedOpacity : 1)
            } else {
                Capsule().stroke(strokeColor(configuration: configuration))
            }
        case .primary:
            Capsule().fill(fillColor(configuration: configuration))
        case .secondary:
            Capsule().stroke(strokeColor(configuration: configuration))
        case .plain:
            EmptyView()
        }
    }

    private var contentShape: AnyShape {
        switch kind {
        case .super, .primary, .secondary:
            return AnyShape(Capsule())
        case .plain:
            return AnyShape(Rectangle())
        }
    }

    private func fillColor(configuration: Self.Configuration) -> Color {
        guard isEnabled else { return .compound.bgActionPrimaryDisabled }
        if configuration.role == .destructive {
            return .compound.bgCriticalPrimary.opacity(configuration.isPressed ? pressedOpacity : 1)
        } else {
            return configuration.isPressed ? .compound.bgActionPrimaryPressed : .compound.bgActionPrimaryRest
        }
    }
    
    private func strokeColor(configuration: Self.Configuration) -> Color {
        if configuration.role == .destructive {
            return .compound.borderCriticalPrimary.opacity(configuration.isPressed ? pressedOpacity : 1)
        } else {
            return .compound.borderInteractiveSecondary.opacity(configuration.isPressed ? pressedOpacity : 1)
        }
    }
    
    private func textColor(configuration: Configuration) -> Color {
        if kind == .primary {
            return .compound.textOnSolidPrimary
        } else {
            guard isEnabled else { return .compound.textDisabled }
            let textColor: Color = configuration.role == .destructive ? .compound.textCriticalPrimary : .compound.textActionPrimary
            return textColor.opacity(configuration.isPressed ? pressedOpacity : 1)
        }
    }
}

public struct CompoundButtonStyle_Previews: PreviewProvider, PrefireProvider {
    public static var previews: some View {
        ScrollView {
            states
        }
        .previewLayout(.fixed(width: 390, height: 975))
    }
    
    @ViewBuilder
    public static var states: some View {
        Section {
            buttons(.large)
        } header: {
            Header(title: "Large")
        }
        
        Section {
            buttons(.medium)
        } header: {
            Header(title: "Medium")
        }
        
        Section {
            plain
                .padding(.bottom) // Only for the snapshot.
        } header: {
            Header(title: "Plain")
        }
    }
    
    public static func buttons(_ size: CompoundButtonStyle.Size) -> some View {
        VStack {
            Button("Super") { }
                .buttonStyle(.compound(.super, size: size))
            
            Button("Disabled") { }
                .buttonStyle(.compound(.super, size: size))
                .disabled(true)
            
            Button("Primary") { }
                .buttonStyle(.compound(.primary, size: size))
            
            Button("Destructive", role: .destructive) { }
                .buttonStyle(.compound(.primary, size: size))
            
            Button("Disabled") { }
                .buttonStyle(.compound(.primary, size: size))
                .disabled(true)
            
            Button("Secondary") { }
                .buttonStyle(.compound(.secondary, size: size))
            
            Button("Destructive", role: .destructive) { }
                .buttonStyle(.compound(.secondary, size: size))
            
            Button("Disabled") { }
                .buttonStyle(.compound(.secondary, size: size))
                .disabled(true)
        }
        .padding(.horizontal)
    }
    
    static var plain: some View {
        HStack(spacing: 20) {
            Button("Plain") { }
                .buttonStyle(.compound(.plain))
            
            Button("Destructive", role: .destructive) { }
                .buttonStyle(.compound(.plain))
            
            Button("Disabled") { }
                .buttonStyle(.compound(.plain))
                .disabled(true)
        }
    }
    
    struct Header: View {
        let title: String
        
        var body: some View {
            Text(title)
                .foregroundStyle(.compound.textSecondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding([.leading, .top])
                .padding(.leading )
        }
    }
}
