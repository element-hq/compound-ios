//
//  ButtonsScreen.swift
//  Compound Inspector
//
//  Created by Doug on 06/05/2022.
//

import SwiftUI
import Compound
import HyperionCore

struct FormScreen: View {
    var body: some View {
        Form {
            Section {
                FormButtonStyle_Previews.states
            } header: {
                Text("Buttons")
                    .compoundFormSectionHeader()
            } footer: {
                Text("Supporting text explaining the section. [Learn more](https://element.io)")
                    .compoundFormSectionFooter()
            }
            .compoundFormSection()
            
            Section {
                FormButtonStyle_Previews.centeredButton
            }
            .compoundFormSection()
            
            Section {
                FormButtonStyle_Previews.destructiveCenteredButton
            }
            .compoundFormSection()
            
            Section {
                FormButtonStyle_Previews.disabledCenteredButton
            }
            .compoundFormSection()
            
            Section {
                FormToggleStyle_Previews.states
            } header: {
                Text("Toggles")
                    .compoundFormSectionHeader()
            }
            .compoundFormSection()
            
            Section {
                FormLabeledContentStyle_Previews.states
            } header: {
                Text("Labeled Content")
                    .compoundFormSectionHeader()
            }
            .compoundFormSection()
            
            Section {
                otherComponents
            } header: {
                Text("Other")
                    .compoundFormSectionHeader()
            }
            .compoundFormSection()
        }
        .compoundForm()
        .navigationTitle("Forms (deprecated")
    }
    
    @ViewBuilder
    var otherComponents: some View {
        Picker(selection: .constant(0)) {
            Text("Item 1").tag(0)
            Text("Item 2").tag(1)
            Text("Item 3").tag(2)
        } label: {
            Label("Picker", systemImage: "square.dashed")
        }
        .labelStyle(.compoundFormRow(secondaryText: "Picker description"))
        
        Picker(selection: .constant(0)) {
            Text("Bubbles").tag(0)
            Text("Modern").tag(1)
        } label: {
            Label("Message layout", systemImage: "message")
        }
        .labelStyle(.compoundFormRow())
        
        Text("This is a row in the form, with a multiline description but it doesn't have either an icon or a title, just this text here.")
            .compoundFormSecondaryTextRow()
        
        TextField("Let us know",
                  text: .constant(""),
                  prompt: Text("Let us know"),
                  axis: .vertical)
        .textFieldStyle(.compoundForm)
        .lineLimit(4, reservesSpace: true)
    }
}

struct FormScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            FormScreen()
        }
        .previewLayout(.fixed(width: 375, height: 700))
    }
}
