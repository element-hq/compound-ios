//
// Copyright 2022 New Vector Ltd
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
    
    var kind: Kind
    public enum Kind {
        /// A plain button with no background.
        case plain
        /// A filled button usually representing the default action.
        case primary
        /// A stroked button usually representing alternate actions.
        case secondary
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
        switch kind {
        case .plain:
            return nil
        case .primary, .secondary:
            return .infinity
        }
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
        case .plain:
            EmptyView()
        case .primary:
            Capsule().fill(buttonColor(configuration: configuration))
        case .secondary:
            Capsule().stroke(buttonColor(configuration: configuration))
        }
    }

    private var contentShape: AnyShape {
        switch kind {
        case .plain:
            return AnyShape(Rectangle())
        case .primary, .secondary:
            return AnyShape(Capsule())
        }
    }

    private func buttonColor(configuration: Self.Configuration) -> Color {
        guard isEnabled else { return .compound.bgActionPrimaryDisabled }
        if configuration.role == .destructive {
            return .compound.bgCriticalPrimary.opacity(configuration.isPressed ? 0.6 : 1)
        } else {
            return configuration.isPressed ? .compound.bgActionPrimaryPressed : .compound.bgActionPrimaryRest
        }
    }
    
    private func textColor(configuration: Configuration) -> Color {
        if kind == .primary {
            return .compound.textOnSolidPrimary
        } else {
            guard isEnabled else { return .compound.textDisabled }
            let textColor: Color = configuration.role == .destructive ? .compound.textCriticalPrimary : .compound.textActionPrimary
            return textColor.opacity(kind == .plain && configuration.isPressed ? 0.6 : 1.0)
        }
    }
}

public struct CompoundButtonStyle_Previews: PreviewProvider, PrefireProvider {
    public static var previews: some View {
        ScrollView {
            Section {
                states(.large)
            } header: {
                Header(title: "Large")
            }
            
            Section {
                states(.medium)
            } header: {
                Header(title: "Medium")
            }
            
            Section {
                plain
            } header: {
                Header(title: "Plain")
            }
        }
    }
    
    public static func states(_ size: CompoundButtonStyle.Size) -> some View {
        VStack {
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
