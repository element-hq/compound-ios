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

// TODO: Check if the primitive style is actually needed now the insets are part of ListRow.
// It might still be useful for ListRow(kind: .custom) usage?

/// Default button styling for list rows.
///
/// The primitive style is needed to set the list row insets to `0`. The inner style is then needed
/// to change the background colour depending on whether the button is currently pressed or not.
public struct ListRowButtonStyle: PrimitiveButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        Button(role: configuration.role, action: configuration.trigger) {
            configuration.label
        }
        .buttonStyle(Style())
    }
    
    /// Inner style used to set the pressed background colour.
    struct Style: ButtonStyle {
        func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .contentShape(Rectangle())
                .background(configuration.isPressed ? Color.compound.bgSubtlePrimary : .compound.bgCanvasDefaultLevel1)
        }
    }
}

// MARK: - Previews

import Prefire

// TODO: Fix the previews, either the style should expand the label to fill or
// the previews need to do this manually for demonstration purposes.

public struct ListRowButtonStyle_Previews: PreviewProvider, PrefireProvider {
    public static var previews: some View {
        Form {
            Section {
                Button("Title") { }
                    .buttonStyle(ListRowButtonStyle.Style())
            }
            .listRowInsets(EdgeInsets())
            
            Section {
                Button("Title") { }
                Button("Title") { }
                Button("Title") { }
            }
            .buttonStyle(ListRowButtonStyle())
            .listRowInsets(EdgeInsets())
            
            Section {
                ShareLink(item: "test")
                    .buttonStyle(ListRowButtonStyle())
            }
            .listRowInsets(EdgeInsets())
        }
        .compoundList()
    }
}
