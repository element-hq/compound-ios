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

import SFSafeSymbols
import SwiftUI

struct ListRowLabelStyle: LabelStyle {
    let iconAlignment: VerticalAlignment
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: iconAlignment, spacing: 16) {
            configuration.icon
            configuration.title
        }
    }
}

struct ListRowCenteredLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .center, spacing: 8) {
            configuration.icon
            configuration.title
        }
    }
}

public struct ListRowLabel<Icon: View>: View {
    @Environment(\.isEnabled) private var isEnabled
    @ScaledMetric private var iconSize = 30.0
    
    var title: String?
    var description: String?
    var icon: Icon?
    
    var role: ButtonRole?
    var iconAlignment: VerticalAlignment = .center
    var hideIconBackground: Bool = false
    
    enum Layout { case `default`, centered }
    var layout: Layout = .default
    
    var titleColor: Color {
        guard isEnabled else { return .compound.textDisabled }
        return role == .destructive ? .compound.textCriticalPrimary : .compound.textPrimary
    }
    
    var descriptionColor: Color {
        isEnabled ? .compound.textSecondary : .compound.textDisabled
    }
    
    var iconForegroundColor: Color {
        guard isEnabled else { return .compound.iconTertiaryAlpha }
        if role == .destructive { return .compound.textCriticalPrimary }
        return hideIconBackground ? .compound.iconPrimary : .compound.iconTertiaryAlpha
    }
    
    var iconBackgroundColor: Color {
        if hideIconBackground { return .clear }
        guard isEnabled else { return .compound._bgSubtleSecondaryAlpha }
        return role == .destructive ? .compound._bgCriticalSubtleAlpha : .compound._bgSubtleSecondaryAlpha
    }
    
    public var body: some View {
        Group {
            switch layout {
            case .default:
                defaultBody
            case .centered:
                centeredBody
            }
        }
        .padding(.leading, ListRowPadding.horizontal)
        .padding(.vertical, ListRowPadding.vertical)
    }
    
    var defaultBody: some View {
        Label {
            VStack(alignment: .leading, spacing: 2) {
                if let title {
                    Text(title)
                        .font(.compound.bodyLG)
                        .foregroundColor(titleColor)
                }
                
                if let description {
                    Text(description)
                        .font(.compound.bodySM)
                        .foregroundColor(descriptionColor)
                }
            }
            .accessibilityElement(children: .combine)
        } icon: {
            icon
                .foregroundColor(iconForegroundColor)
                .frame(width: iconSize, height: iconSize)
                .background(iconBackgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.vertical, -4) // Don't allow the background to size the row.
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .labelStyle(ListRowLabelStyle(iconAlignment: iconAlignment))
    }
    
    var centeredBody: some View {
        Label {
            if let title {
                Text(title)
                    .font(.compound.bodyLG)
                    .foregroundColor(titleColor)
            }
        } icon: {
            icon
                .foregroundColor(iconForegroundColor)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .labelStyle(ListRowCenteredLabelStyle())
        .alignmentGuide(.listRowSeparatorLeading) { _ in 0 }
    }
    
    // MARK: - Initialisers
    
    public static func `default`(title: String,
                                 description: String? = nil,
                                 icon: Icon,
                                 role: ButtonRole? = nil,
                                 iconAlignment: VerticalAlignment = .center) -> ListRowLabel {
        ListRowLabel(title: title,
                  description: description,
                  icon: icon,
                  role: role,
                  iconAlignment: iconAlignment)
    }
    
    public static func `default`(title: String,
                                 description: String? = nil,
                                 icon: KeyPath<CompoundIcons, Image>,
                                 role: ButtonRole? = nil,
                                 iconAlignment: VerticalAlignment = .center) -> ListRowLabel where Icon == CompoundIcon {
        .default(title: title,
                 description: description,
                 icon: CompoundIcon(icon),
                 role: role,
                 iconAlignment: iconAlignment)
    }
    
    public static func `default`(title: String,
                                 description: String? = nil,
                                 systemIcon: SFSymbol,
                                 role: ButtonRole? = nil,
                                 iconAlignment: VerticalAlignment = .center) -> ListRowLabel where Icon == Image {
        .default(title: title,
                 description: description,
                 icon: Image(systemSymbol: systemIcon),
                 role: role,
                 iconAlignment: iconAlignment)
    }
    
    public static func action(title: String,
                              icon: Icon,
                              role: ButtonRole? = nil) -> ListRowLabel {
        ListRowLabel(title: title,
                  icon: icon,
                  role: role,
                  hideIconBackground: true)
    }
    
    public static func action(title: String,
                              icon: KeyPath<CompoundIcons, Image>,
                              role: ButtonRole? = nil) -> ListRowLabel where Icon == CompoundIcon {
        .action(title: title, icon: CompoundIcon(icon), role: role)
    }
    
    public static func action(title: String,
                              systemIcon: SFSymbol,
                              role: ButtonRole? = nil) -> ListRowLabel where Icon == Image {
        .action(title: title, icon: Image(systemSymbol: systemIcon), role: role)
    }
    
    public static func centeredAction(title: String,
                                      icon: Icon,
                                      role: ButtonRole? = nil) -> ListRowLabel {
        ListRowLabel(title: title,
                  icon: icon,
                  role: role,
                  hideIconBackground: true,
                  layout: .centered)
    }
    
    public static func centeredAction(title: String,
                                      icon: KeyPath<CompoundIcons, Image>,
                                      role: ButtonRole? = nil) -> ListRowLabel where Icon == CompoundIcon {
        .centeredAction(title: title, icon: CompoundIcon(icon), role: role)
    }
    
    public static func centeredAction(title: String,
                                      systemIcon: SFSymbol,
                                      role: ButtonRole? = nil) -> ListRowLabel where Icon == Image {
        .centeredAction(title: title, icon: Image(systemSymbol: systemIcon), role: role)
    }
    
    public static func plain(title: String,
                             description: String? = nil,
                             role: ButtonRole? = nil) -> ListRowLabel where Icon == EmptyView {
        ListRowLabel(title: title, description: description, role: role, hideIconBackground: true)
    }
    
    public static func description(_ description: String) -> ListRowLabel where Icon == EmptyView {
        ListRowLabel(description: description)
    }
}

// MARK: - Previews

import Prefire

struct ListRowLabel_Previews: PreviewProvider, PrefireProvider {
    static var previews: some View {
        Form {
            Section {
                Group {
                    ListRowLabel.default(title: "Person", icon: Image(systemName: "person"))
                    
                    ListRowLabel.default(title: "Help",
                                      description: "Supporting text",
                                      systemIcon: .questionmarkCircle)
                    
                    ListRowLabel.default(title: "Trash",
                                      icon: Image(systemName: "trash"),
                                      role: .destructive)
                }
                
                Group {
                    ListRowLabel.action(title: "Camera",
                                     icon: Image(systemName: "camera"))
                    
                    ListRowLabel.action(title: "Remove",
                                     icon: Image(systemName: "person.badge.minus"),
                                     role: .destructive)
                    
                    ListRowLabel.centeredAction(title: "Person",
                                             icon: Image(systemName: "person"))
                    ListRowLabel.centeredAction(title: "Remove",
                                             systemIcon: .personBadgeMinus,
                                             role: .destructive)
                }
                
                Group {
                    ListRowLabel.plain(title: "Person")
                    ListRowLabel.plain(title: "Remove",
                                    role: .destructive)
                    ListRowLabel.plain(title: "Plain", description: "Description")
                }
                
                ListRowLabel.description("This is a row in the list, that only contains a description and doesn't have either an icon or a title.")
            }
            .listRowInsets(EdgeInsets())
            
            Section {
                ListRow(label: .description("This is a row in the list, with a multiline description but it doesn't have either an icon or a title, just this text here."),
                        kind: .label)
            }
        }
        .compoundList()
    }
}
