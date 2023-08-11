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

/// A view that displays an icon from Compound. The icon behaves
/// similarly to an SF Symbol whereby it will scale to match the font
/// given to it by the `font` modifier, as well as with Dynamic Type.
public struct CompoundIcon: View {
    private var image: Image
    
    /// Creates an icon using a key path from the Compound tokens.
    public init(_ icon: KeyPath<CompoundIcons, Image>) {
        image = .compound[keyPath: icon]
    }
    
    /// Creates an icon using a custom image for preview purposes
    /// in the Inspector app.
    ///
    /// If using this initializer with any other image, make sure that its
    /// dimensions match those of the compound icons otherwise it
    /// will likely not behave as expected.
    public init(customImage: Image) {
        image = customImage
    }
    
    public var body: some View {
        image
            .resizable()
            .modifier(CompoundIconStyle())
    }
}

/// A style that ensures the icon is rendered at the correct size, based upon
/// its font.
///
/// This is a modifier to get access to the font from the environment as it
/// doesn't appear to be available directly from the view as of iOS 16.4.
private struct CompoundIconStyle: ViewModifier {
    @Environment(\.font) private var font
    
    private var fontSize: FontSize {
        FontSize.reflecting(font ?? .body) ?? .style(.body)
    }
    
    func body(content: Content) -> some View {
        let fontSize = fontSize
        content
            .modifier(CompoundIconFrame(fontSize: fontSize.value, textStyle: fontSize.style))
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
                Label { Text("Heading Large") } icon: {
                    CompoundIcon(\.userProfile)
                }
            }
            .font(.compound.headingLG)
            .buttonStyle(.borderedProminent)
            
            Button { } label: {
                Label { Text("Body Large") } icon: {
                    CompoundIcon(\.userProfile)
                }
            }
            .buttonStyle(.borderedProminent)
            
            Button { } label: {
                Label { Text("Body Small") } icon: {
                    CompoundIcon(\.userProfile)
                }
            }
            .font(.compound.bodySM)
            .buttonStyle(.borderedProminent)
        }
    }
}
