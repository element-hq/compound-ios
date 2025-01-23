//
// Copyright 2023, 2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only OR LicenseRef-Element-Commercial
// Please see LICENSE files in the repository root for full details.
//

import SwiftUI
import SwiftUIIntrospect

public extension PlatformViewVersionPredicate<NavigationStackType, UINavigationController> {
    static var supportedVersions: Self {
        .iOS(.v16, .v17, .v18)
    }
}

public extension PlatformViewVersionPredicate<WindowType, UIWindow> {
    static var supportedVersions: Self {
        .iOS(.v16, .v17, .v18)
    }
}
