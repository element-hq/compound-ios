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

struct ListInlinePicker<SelectedValue: Hashable>: View {
    let title: String?
    @Binding var selection: SelectedValue
    let items: [(title: String, tag: SelectedValue)]
    
    var body: some View {
        ForEach(items, id: \.tag) { item in
            ListRow(label: .plain(title: item.title),
                    kind: .selection(isSelected: selection == item.tag) {
                var transaction = Transaction()
                transaction.disablesAnimations = true

                withTransaction(transaction) {
                    selection = item.tag
                }
            })
        }
    }
}

// MARK: - Previews

import Prefire

struct ListInlinePicker_Previews: PreviewProvider, PrefireProvider {
    static var previews: some View { Preview() }
    
    struct Preview: View {
        @State var selection = "Item 1"
        
        let items = ["Item 1", "Item 2", "Item 3"]
        var body: some View {
            Form {
                Section("Compound") {
                    ListInlinePicker(title: "Title",
                                     selection: $selection,
                                     items: items.map { (title: $0, tag: $0) })
                }
                
                Section("Native") {
                    Picker("", selection: $selection) {
                        ForEach(items, id: \.self) { item in
                            Text(item)
                                .tag(item)
                        }
                    }
                    .pickerStyle(.inline)
                    .labelsHidden()
                }
            }
        }
    }
}
