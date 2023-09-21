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
        case inlinePicker(selection: Binding<SelectionValue>, items: [(title: String, tag: SelectionValue)])
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
            RowContent { details } label: { label }
        case .button(let action):
            Button(action: action) {
                RowContent { details } label: { label }
            }
        case .navigationLink(let action):
            Button(action: action) {
                RowContent(accessory: .navigationLink) { details } label: { label }
            }
        case .picker(let selection, let items):
            LabeledContent {
                // Note: VoiceOver label already provided.
                Picker("", selection: selection) {
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
                // Note: VoiceOver label already provided.
                Toggle("", isOn: binding)
                    .toggleStyle(.compound)
                    .labelsHidden()
                    .padding(.vertical, -10)
            } label: {
                label
            }
            .padding(.trailing, ListRowPadding.horizontal)
        case .inlinePicker(let selection, let items):
            ListInlinePicker(title: label.title ?? "",
                             selection: selection,
                             items: items)
        case .selection(let isSelected, let action):
            Button(action: action) {
                RowContent(accessory: isSelected ? .selected : nil) { details } label: { label }
            }
            // Add the following trait on iOS 17
            // .accessibilityAddTraits(.isToggle)
        case .textField(let text, let axis):
            TextField(text: text, axis: axis) {
                Text(label.title ?? "")
                    .font(.compound.bodyLG)
                    .foregroundColor(.compound.textPlaceholder)
            }
            .tint(.compound.iconAccentTertiary)
            .listRowInsets(EdgeInsets(top: 11,
                                      leading: ListRowPadding.horizontal,
                                      bottom: 11,
                                      trailing: ListRowPadding.horizontal))
        
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

/// The standard content for labels, and button based rows.
///
/// This doesn't use `LabeledContent` as that will happily build using an `EmptyView`
/// in the content. This creates an issue where the label ends up hidden to VoiceOver,
/// presumably because SwiftUI thinks that the row doesn't contain any content.
private struct RowContent<Label: View, Details: View>: View {
    var accessory: ListRowAccessory?
    let details: () -> Details?
    let label: () -> Label
    
    var body: some View {
        HStack(spacing: ListDetails.spacing) {
            label()
                .frame(maxWidth: .infinity)
            
            details()
            accessory
        }
        .frame(maxHeight: .infinity)
        .padding(.trailing, ListRowPadding.horizontal)
        .accessibilityElement(children: .combine)
    }
}

// MARK: - Previews

import Prefire

public struct ListRow_Previews: PreviewProvider, PrefireProvider {
    public static var previews: some View {
        Form {
            Section {
                labels
                buttons
                pickers
                toggles
                selection
                actionButtons
                plainButton
            }
            
            centeredActionButtonSections
            descriptionLabelSection
            othersSection
        }
        .compoundList()
    }
    
    static var labels: some View {
        ListRow(label: .default(title: "Label",
                                description: "Non-interactive item",
                                systemIcon: .squareDashed),
                details: .label(title: "Content",
                                systemIcon: .squareDashed,
                                isWaiting: true),
                kind: .label)
    }
    
    @ViewBuilder static var buttons: some View {
        ListRow(label: .default(title: "Title",
                                description: "Description…",
                                systemIcon: .squareDashed),
                kind: .button { print("I was tapped!") })
        ListRow(label: .default(title: "Title",
                                systemIcon: .squareDashed),
                kind: .button { print("I was tapped!") })
        ListRow(label: .default(title: "Destructive",
                                systemIcon: .squareDashed,
                                role: .destructive),
                kind: .button { print("I will delete things!") })
        ListRow(label: .default(title: "Title",
                                description: "Description…",
                                systemIcon: .squareDashed),
                details: .label(title: "Details", systemIcon: .squareDashed),
                kind: .navigationLink { print("Perform navigation!") })
        ListRow(label: .default(title: "Title",
                                systemIcon: .squareDashed),
                kind: .navigationLink { print("Perform navigation!") })
    }
    
    @ViewBuilder static var pickers: some View {
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
    
    @ViewBuilder static var toggles: some View {
        ListRow(label: .default(title: "Title",
                                description: "Description…",
                                systemIcon: .squareDashed),
                kind: .toggle(.constant(true)))
        ListRow(label: .default(title: "Title", systemIcon: .squareDashed),
                kind: .toggle(.constant(true)))
    }
    
    @ViewBuilder static var selection: some View {
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
        
        ListRow(label: .plain(title: "Title"),
                kind: .inlinePicker(selection: .constant("Item 1"),
                                    items: [(title: "Item 1", tag: "Item 1"),
                                            (title: "Item 2", tag: "Item 2"),
                                            (title: "Item 3", tag: "Item 3")]))
    }
    
    @ViewBuilder static var actionButtons: some View {
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
    
    static var plainButton: some View {
        ListRow(label: .plain(title: "Title"),
                kind: .button { print("I was tapped!") })
    }
    
    @ViewBuilder static var centeredActionButtonSections: some View {
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
    }
    
    static var descriptionLabelSection: some View {
        Section {
            ListRow(label: .description("This is a row in the list, with a multiline description but it doesn't have either an icon or a title, just this text here."),
                    kind: .label)
        }
    }
    
    @ViewBuilder static var othersSection: some View {
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
}
