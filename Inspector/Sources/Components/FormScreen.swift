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
            Section("Buttons") {
                FormButtonStyle_Previews.states
            }
            .compoundFormSection()
            
            Section("Toggles") {
                FormToggleStyle_Previews.states
            }
            .compoundFormSection()
            
            Section("Labels") {
                FormRowLabelStyle_Previews.states
            }
            .compoundFormSection()
            
            Section("Other") {
                otherComponents
            }
            .compoundFormSection()
        }
        .compoundForm()
        .navigationTitle("Forms")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            Button(action: HyperionManager.sharedInstance().togglePluginDrawer) {
                Image(systemName: "ruler")
            }
        }
    }
    
    @ViewBuilder
    var otherComponents: some View {
        Picker(selection: .constant(0)) {
            Text("Bubbles").tag(0)
            Text("Modern").tag(1)
        } label: {
            Label("Message layout", systemImage: "message")
        }
        .labelStyle(.compoundFormRow())
        
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
