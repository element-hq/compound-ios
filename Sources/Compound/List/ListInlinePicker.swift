//
// Copyright 2023, 2024 New Vector Ltd.
//
// SPDX-License-Identifier: AGPL-3.0-only
// Please see LICENSE in the repository root for full details.
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
