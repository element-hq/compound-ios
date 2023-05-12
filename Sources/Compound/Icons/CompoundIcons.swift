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

public extension Image {
    /// The icons used by Element as defined in Compound Design Tokens.
    static let compound = CompoundIcons()
}

/// A manually generated collection of all the icons in Compound. This allows the
/// `CompoundIcon` component to be created using a `KeyPath` until we can
/// drop the static keyword in the generated tokens.
public struct CompoundIcons {
    /// The raw compound tokens.
    private static let compound = CompoundLightDesignTokens.self
    
    public let webBrowser = compound.iconWebBrowser
    public let visibilityVisible = compound.iconVisibilityVisible
    public let visibilityInvisible = compound.iconVisibilityInvisible
    public let user = compound.iconUser
    public let thread = compound.iconThread
    public let mobile = compound.iconMobile
    public let lock = compound.iconLock
    public let info = compound.iconInfo
    public let error = compound.iconError
    public let delete = compound.iconDelete
    public let computer = compound.iconComputer
    public let close = compound.iconClose
    public let chevron = compound.iconChevron
    public let check = compound.iconCheck
    public let checkCircle = compound.iconCheckCircle
    public let chat = compound.iconChat
}
