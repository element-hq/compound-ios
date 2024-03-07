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

public extension View {
    /// Styles a list using the Compound design tokens.
    func compoundList() -> some View {
        environment(\.defaultMinListRowHeight, 48)
            .scrollContentBackground(.hidden)
            .background(Color.compound.bgSubtleSecondaryLevel0.ignoresSafeArea())
    }
    
    /// Styles a list section header using the Compound design tokens.
    func compoundListSectionHeader() -> some View {
        font(.compound.bodySM)
            .foregroundColor(.compound.textSecondary)
            .listRowInsets(EdgeInsets(top: 15,
                                      leading: ListRowPadding.horizontal,
                                      bottom: 8,
                                      trailing: ListRowPadding.horizontal))
    }
    
    /// Styles a list section footer using the Compound design tokens.
    func compoundListSectionFooter() -> some View {
        font(.compound.bodySM)
            .foregroundColor(.compound.textSecondary)
            .listRowInsets(EdgeInsets(top: 8,
                                      leading: ListRowPadding.horizontal,
                                      bottom: 10,
                                      trailing: ListRowPadding.horizontal))
    }
}

import Prefire

struct ListTextStyles_Previews: PreviewProvider, PrefireProvider {
    static var previews: some View {
        Form {
            Section {
                ListRow(label: .plain(title: "Hi!"), kind: .label)
            } footer: {
                Text("This is a footer down ere")
                    .compoundListSectionFooter()
            }
            
            Section {
                ListRow(label: .plain(title: "Second!"), kind: .label)
            } header: {
                Text("Section Title")
                    .compoundListSectionHeader()
            }
            
            Section {
                ListRow(label: .plain(title: "Third!"), kind: .label)
            } header: {
                Text("Section Title")
                    .compoundListSectionHeader()
            }
            
            Section {
                ListRow(label: .plain(title: "I was slow, I'm last."), kind: .label)
            } footer: {
                Text("This is a footer down ere")
                    .compoundListSectionFooter()
            }
        }
        .compoundList()
        .previewDisplayName("Form")
        .snapshotWithDefaultPrecision()
        
        List {
            Section {
                ListRow(label: .plain(title: "Hello"), kind: .label)
                ListRow(label: .plain(title: "World!"), kind: .label)
            } header: {
                Text("Section Title")
                    .compoundListSectionHeader()
            } footer: {
                Text("Section footer")
                    .compoundListSectionFooter()
            }
        }
        .compoundList()
        .previewDisplayName("List")
        .snapshotWithDefaultPrecision()
    }
}
