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

/// A view that displays an icon from Compound. The icon defaults to a size of 24pt
/// and scales with Dynamic Type, relative to any font given to it by the `font` modifier.
public struct CompoundIcon: View {
    /// The size of the icon.
    public enum Size {
        /// An icon size of 16pt.
        case xSmall
        /// An icon size of 20pt.
        case small
        /// An icon size of 24pt.
        case medium
        /// A custom icon size.
        case custom(CGFloat)
        
        var value: CGFloat {
            switch self {
            case .xSmall: return 16
            case .small: return 20
            case .medium: return 24
            case .custom(let size): return size
            }
        }
    }
    
    private var size: Size
    private var image: Image
    
    /// Creates an icon using a key path from the Compound tokens.
    ///
    /// - Parameters:
    ///   - icon: The icon to show.
    ///   - size: The size of the icon. Defaults to `.medium` (24pt).
    public init(_ icon: KeyPath<CompoundIcons, Image>, size: Size = .medium) {
        image = .compound[keyPath: icon]
        self.size = size
    }
    
    /// Creates an icon using a custom image to allow assets from outside
    /// of Compound to scale in the same way as icons.
    ///
    /// - Parameters:
    ///   - customImage: The image that should be displayed
    ///   - size: The size of the icon. Defaults to `.medium` (24pt).
    ///
    /// ** Note:** The image should have a square frame or it may end up distorted.
    public init(customImage: Image, size: Size = .medium) {
        image = customImage
        self.size = size
    }
    
    public var body: some View {
        image
            .resizable()
            .modifier(CompoundIconStyle(size: size))
    }
}

/// A style that ensures the icon is rendered at the correct size, based upon
/// its font.
///
/// This is a modifier to get access to the font from the environment as it
/// doesn't appear to be available directly from the view as of iOS 16.4.
private struct CompoundIconStyle: ViewModifier {
    @Environment(\.font) private var font
    
    let size: CompoundIcon.Size
    
    private var fontSize: FontSize {
        FontSize.reflecting(font ?? .body) ?? .style(.body)
    }
    
    func body(content: Content) -> some View {
        let fontSize = fontSize
        content
            .modifier(CompoundIconFrame(fontSize: size.value, textStyle: fontSize.style))
    }
}

/// A simple modifier that applies a square frame of a given size that will be
/// scaled dynamically based upon the specified text style.
private struct CompoundIconFrame: ViewModifier {
    @ScaledMetric private var size: CGFloat
    
    init(fontSize: CGFloat, textStyle: Font.TextStyle) {
        _size = ScaledMetric(wrappedValue: fontSize, relativeTo: textStyle)
    }
    
    func body(content: Content) -> some View {
        content
            .frame(width: size, height: size)
    }
}

public extension Label {
    /// Creates a label with an icon from Compound and a title generated from a string.
    /// - Parameters:
    ///   - title: A string used as the label’s title.
    ///   - icon: The icon to use from Compound.
    ///   - size: The size of the icon. Defaults to `.medium` (24pt).
    init(_ title: some StringProtocol, icon: KeyPath<CompoundIcons, Image>, size: CompoundIcon.Size = .medium) where Title == Text, Icon == CompoundIcon {
        self.init {
            Text(title)
        } icon: {
            CompoundIcon(icon, size: size)
        }
    }
}

struct CompoundIcon_Previews: PreviewProvider {
    static var previews: some View {
        form
            .previewLayout(.fixed(width: 375, height: 400))
            .previewDisplayName("Form")
        buttons
            .padding(8)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("Buttons")
    }
    
    static var form: some View {
        Form {
            Section {
                Label { Text("Plain Icon") } icon: {
                    CompoundIcon(\.userProfile)
                        .foregroundColor(.compound.iconSecondary)
                }
                
                Label { Text("Styled Icon") } icon: {
                    CompoundIcon(\.userProfile)
                }
                .labelStyle(.compoundFormRow(alignment: .center))
                
                Label("SF Symbol", systemImage: "person.crop.circle")
                    .labelStyle(.compoundFormRow())
            }
            .compoundFormSection()
        }
        .compoundForm()
        .safeAreaInset(edge: .bottom) {
            Button { } label: {
                Label { Text("Button") } icon: {
                    CompoundIcon(\.userProfile)
                }
                .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
            .padding()
        }
    }
    
    static var buttons: some View {
        VStack {
            Button { } label: {
                Label { Text("Body Large") } icon: {
                    CompoundIcon(\.userProfile, size: .medium)
                }
            }
            .buttonStyle(.borderedProminent)
            
            Button { } label: {
                Label { Text("Body Small") } icon: {
                    CompoundIcon(\.userProfile, size: .small)
                }
            }
            .font(.compound.bodySM)
            .buttonStyle(.borderedProminent)
            
            Button { } label: {
                Label { Text("Body xSmall") } icon: {
                    CompoundIcon(\.userProfile, size: .xSmall)
                }
            }
            .font(.compound.bodyXS)
            .buttonStyle(.borderedProminent)
        }
    }
}
