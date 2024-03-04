//
//  PlatformSpecificVersion.swift
//  Compound Inspector
//
//  Created by Mauro Romito on 02/10/23.
//

import UIKit

import SwiftUIIntrospect

extension PlatformViewVersionPredicate<WindowType, UIWindow> {
    static var supportedVersions: Self {
        .iOS(.v16, .v17)
    }
}
