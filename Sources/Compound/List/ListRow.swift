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

public enum ListRowPadding {
    public static let horizontal: CGFloat = 16
    public static let vertical: CGFloat = 13
}

public struct ListRow<Icon: View, DetailsIcon: View, CustomContent: View, SelectionValue: Hashable>: View {
    let label: ListLabel<Icon>
    let details: ListDetailsLabel<DetailsIcon>?
    
    public enum Kind<CustomContent: View, SelectionValue: Hashable> {
        case label
        case button(action: () -> Void)
        case navigationLink(action: () -> Void)
        case picker(selection: Binding<SelectionValue>, items: [(title: String, tag: SelectionValue)])
        case toggle(Binding<Bool>)
        case selection(isSelected: Bool, action: () -> Void)
        case textField(text: Binding<String>, axis: Axis)
        
        case custom(() -> CustomContent)
        
        public static func textField(text: Binding<String>) -> Self {
            .textField(text: text, axis: .vertical)
        }
    }
    
    let kind: Kind<CustomContent, SelectionValue>
    
    public var body: some View {
        rowContent
            .buttonStyle(ListRowButtonStyle())
            .listRowInsets(EdgeInsets())
            .listRowBackground(Color.compound.bgCanvasDefaultLevel1)
            .listRowSeparatorTint(.compound._borderInteractiveSecondaryAlpha)
    }
    
    @ViewBuilder
    var rowContent: some View {
        switch kind {
        case .label:
            LabeledContent { details } label: { label }
                .padding(.trailing, ListRowPadding.horizontal)
        case .button(let action):
            Button(action: action) {
                LabeledContent { details } label: { label }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding(.trailing, ListRowPadding.horizontal)
            }
        case .navigationLink(let action):
            Button(action: action) {
                LabeledContent {
                    HStack(spacing: 8) {
                        details
                        FormRowAccessory.navigationLink
                    }
                } label: {
                    label
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                .padding(.trailing, ListRowPadding.horizontal)
            }
        case .picker(let selection, let items):
            LabeledContent {
                Picker(label.title ?? "", selection: selection) {
                    ForEach(items, id: \.tag) { item in
                        Text(item.title)
                            .tag(item.tag)
                    }
                }
                .labelsHidden()
                .padding(.vertical, -10)
                .padding(.trailing, ListRowPadding.horizontal)
            } label: {
                label
            }
        case .toggle(let binding):
            LabeledContent {
                Toggle(label.title ?? "", isOn: binding)
                    .toggleStyle(.compound)
                    .labelsHidden()
                    .padding(.vertical, -10)
            } label: {
                label
            }
            .padding(.trailing, ListRowPadding.horizontal)
        case .selection(let isSelected, let action):
            Button(action: action) {
                LabeledContent {
                    HStack(spacing: 8) {
                        details
                        
                        if isSelected {
                            CompoundIcon(\.check)
                                .font(.system(size: 24))
                                .foregroundColor(.compound.iconPrimary)
                                .accessibilityAddTraits(.isSelected)
                                .padding(.vertical, -4)
                        }
                    }
                } label: {
                    label
                }
                .padding(.trailing, ListRowPadding.horizontal)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
        case .textField(let text, let axis):
            TextField(text: text, axis: axis) {
                Text(label.title ?? "")
                    .font(.compound.bodyLG)
                    .foregroundColor(.compound.textPlaceholder)
            }
            .tint(.compound.iconAccentTertiary)
            .listRowInsets(EdgeInsets(top: 11, leading: 16, bottom: 11, trailing: 16))
        
        case .custom(let content):
            content()
        }
    }
}

// MARK: - Initialisers

// Normal row with a details icon
public extension ListRow where CustomContent == EmptyView {
    init(label: ListLabel<Icon>,
         details: ListDetailsLabel<DetailsIcon>? = nil,
         kind: Kind<CustomContent, SelectionValue>) {
        self.label = label
        self.details = details
        self.kind = kind
    }
    
    init(label: ListLabel<Icon>,
         details: ListDetailsLabel<DetailsIcon>? = nil,
         kind: Kind<CustomContent, SelectionValue>) where SelectionValue == String {
        self.label = label
        self.details = details
        self.kind = kind
    }
}

// Normal row without a details icon.
public extension ListRow where DetailsIcon == EmptyView, CustomContent == EmptyView {
    init(label: ListLabel<Icon>,
         details: ListDetailsLabel<DetailsIcon>? = nil,
         kind: Kind<CustomContent, SelectionValue>) {
        self.label = label
        self.details = details
        self.kind = kind
    }
    
    init(label: ListLabel<Icon>,
         details: ListDetailsLabel<DetailsIcon>? = nil,
         kind: Kind<CustomContent, SelectionValue>) where SelectionValue == String {
        self.label = label
        self.details = details
        self.kind = kind
    }
}

// Custom row without a label or details label.
public extension ListRow where Icon == EmptyView, DetailsIcon == EmptyView {
    init(kind: Kind<CustomContent, SelectionValue>) {
        self.label = ListLabel()
        self.details = nil
        self.kind = kind
    }
    
    init(kind: Kind<CustomContent, SelectionValue>) where SelectionValue == String {
        self.label = ListLabel()
        self.details = nil
        self.kind = kind
    }
}

// MARK: - Previews

struct ListRow_Previews: PreviewProvider {
    static var previews: some View {
        Form {
            Section {
                Group {
                    ListRow(label: .default(title: "Label",
                                            description: "Non-interactive item",
                                            systemIcon: .squareDashed),
                            details: .label(title: "Content",
                                            systemIcon: .squareDashed,
                                            isWaiting: true),
                            kind: .label)
                }
                
                Group {
                    ListRow(label: .default(title: "Title",
                                            description: "Description…",
                                            systemIcon: .squareDashed),
                            kind: .button { print("I was tapped!") })
                    ListRow(label: .default(title: "Title",
                                            systemIcon: .squareDashed),
                            kind: .button { print("I was tapped!") })
                    ListRow(label: .default(title: "Title",
                                            description: "Description…",
                                            systemIcon: .squareDashed),
                            details: .label(title: "Details", systemIcon: .squareDashed),
                            kind: .navigationLink { print("Perform navigation!") })
                    ListRow(label: .default(title: "Title",
                                            systemIcon: .squareDashed),
                            details: .label(title: "Details", systemIcon: .squareDashed),
                            kind: .navigationLink { print("Perform navigation!") })
                }
                
                Group {
                    ListRow(label: .default(title: "Title",
                                            description: "Description…",
                                            systemIcon: .squareDashed),
                            kind: .picker(selection: .constant(0),
                                          items: [(title: "Item 1", tag: 0),
                                                  (title: "Item 2", tag: 1),
                                                  (title: "Item 3", tag: 2)]))
                    ListRow(label: .default(title: "Title", systemIcon: .squareDashed),
                            kind: .picker(selection: .constant("Item 1"),
                                          items: [(title: "Item 1", tag: "Item 1"),
                                                  (title: "Item 2", tag: "Item 2"),
                                                  (title: "Item 3", tag: "Item 3")]))
                }
                
                Group {
                    ListRow(label: .default(title: "Title",
                                            description: "Description…",
                                            systemIcon: .squareDashed),
                            kind: .toggle(.constant(true)))
                    ListRow(label: .default(title: "Title", systemIcon: .squareDashed),
                            kind: .toggle(.constant(true)))
                }
                
                Group {
                    ListRow(label: .default(title: "Title",
                                            description: "Description…",
                                            systemIcon: .squareDashed),
                            details: .title("Content"),
                            kind: .selection(isSelected: true) {
                        print("I was tapped!")
                    })
                    ListRow(label: .default(title: "Title",
                                            systemIcon: .squareDashed),
                            details: .title("Content"),
                            kind: .selection(isSelected: true) {
                        print("I was tapped!")
                    })
                }
                
                Group {
                    ListRow(label: .action(title: "Title",
                                           systemIcon: .squareDashed),
                            kind: .button { print("I was tapped!") })
                    ListRow(label: .action(title: "Title",
                                           systemIcon: .squareDashed,
                                           role: .destructive),
                            kind: .button { print("I was tapped!") })
                    ListRow(label: .action(title: "Title",
                                           systemIcon: .squareDashed),
                            kind: .button { print("I was tapped!") })
                    .disabled(true)
                }
                
                Group {
                    ListRow(label: .plain(title: "Title"),
                            kind: .button { print("I was tapped!") })
                }
            }
            
            Section {
                ListRow(label: .centeredAction(title: "Title",
                                               systemIcon: .squareDashed),
                        kind: .button { print("I was tapped!") })
            }
            
            Section {
                ListRow(label: .centeredAction(title: "Title",
                                               systemIcon: .squareDashed,
                                               role: .destructive),
                        kind: .button { print("I was tapped!") })
            }
            
            Section {
                ListRow(label: .centeredAction(title: "Title",
                                               systemIcon: .squareDashed),
                        kind: .button { print("I was tapped!") })
                .disabled(true)
            }
            
            Section {
                ListRow(label: .description("This is a row in the list, with a multiline description but it doesn't have either an icon or a title, just this text here."),
                        kind: .label)
            }
            
            Section {
                ListRow(kind: .custom {
                    Text("This is a custom row")
                        .padding(.horizontal, 16)
                        .padding(.vertical, 20)
                })
                ListRow(label: .plain(title: "Placeholder"),
                        kind: .textField(text: .constant("")))
                .lineLimit(4...)
            }
        }
        .environment(\.defaultMinListRowHeight, 48)
    }
}
