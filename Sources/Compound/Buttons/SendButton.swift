// 
// Copyright 2024 New Vector Ltd
//
// SPDX-License-Identifier: AGPL-3.0-only
// Please see LICENSE in the repository root for full details.
//

import SwiftUI

/// The button component for sending messages and media.
public struct SendButton: View {
    @Environment(\.isEnabled) private var isEnabled
    @Environment(\.colorScheme) private var colorScheme
    
    /// The action to perform when the user triggers the button.
    public let action: () -> Void
    
    private var iconColor: Color { isEnabled ? .compound.iconPrimary : .compound.iconQuaternary }
    private var gradient: Gradient { isEnabled ? enabledGradient : .init(colors: [.clear]) }
    private var colorSchemeOverride: ColorScheme { isEnabled ? .dark : colorScheme }
    
    /// This is a custom gradient used for this button, the colours don't come from our core tokens
    /// and aren't reactive to light/dark mode or high contrast, so it is hard coded in here.
    private var enabledGradient: Gradient {
        .init(stops: [Gradient.Stop(color: Color(red: 0.47, green: 0.87, blue: 0.6), location: 0.00),
                      Gradient.Stop(color: Color(red: 0.05, green: 0.74, blue: 0.55), location: 0.30),
                      Gradient.Stop(color: Color(red: 0.07, green: 0.52, blue: 0.52), location: 0.60),
                      Gradient.Stop(color: Color(red: 0.14, green: 0.27, blue: 0.42), location: 1.00)])
    }
    
    /// Creates a send button that performs the provided action.
    public init(action: @escaping () -> Void) {
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            CompoundIcon(\.sendSolid, size: .medium, relativeTo: .compound.headingLG)
                .foregroundStyle(iconColor)
                .scaledPadding(6, relativeTo: .compound.headingLG)
                .background { buttonShape }
                .environment(\.colorScheme, colorSchemeOverride)
                .compositingGroup()
        }
    }
    
    var buttonShape: some View {
        Circle()
            .fill(LinearGradient(gradient: gradient, startPoint: .top, endPoint: .bottom))
    }
}

// MARK: - Previews

import Prefire

public struct SendButton_Previews: PreviewProvider, PrefireProvider {
    public static var previews: some View {
        VStack(spacing: 0) {
            states
                .padding(20)
                .background(.compound.bgCanvasDefault)
            states
                .padding(20)
                .background(.compound.bgCanvasDefault)
                .environment(\.colorScheme, .dark)
        }
        .cornerRadius(20)
    }
    
    public static var states: some View {
        HStack(spacing: 30) {
            SendButton { }
                .disabled(true)
            SendButton { }
        }
    }
}
