//
//  NavigationBarScreen.swift
//  Compound Inspector
//
//  Created by Doug on 27/07/2023.
//

import SwiftUI
import Compound

struct NavigationBarScreen: View {
    enum TitleMode {
        case large
        case inline
        case hidden
    }
    
    enum BackButtonMode {
        case navigation
        case cancellationAction
        case hidden
    }
    
    @State private var titleMode = TitleMode.inline
    @State private var backButtonMode = BackButtonMode.navigation
    @State private var hasConfirmationAction = true
    @State private var hasPrimaryAction = false
    
    var body: some View {
        Form {
            Section {
                Text("This component may be rendered differently when running on macOS.")
                    .font(.compound.bodySM)
                    .foregroundColor(.compound.textSecondary)
                    .multilineTextAlignment(.center)
                    .listRowBackground(Color.clear)
            }
            .compoundFormSection()
            
            Section {
                Picker("Title", selection: $titleMode) {
                    Text("Large").tag(TitleMode.large)
                    Text("Inline").tag(TitleMode.inline)
                    Text("Hidden").tag(TitleMode.hidden)
                }
                .foregroundColor(.compound.textPrimary)
                
                Picker("Back Button", selection: $backButtonMode) {
                    Text("Navigation").tag(BackButtonMode.navigation)
                    Text("Cancelation Action").tag(BackButtonMode.cancellationAction)
                    Text("Hidden").tag(BackButtonMode.hidden)
                }
                .foregroundColor(.compound.textPrimary)
                
                Toggle("Confirmation Action", isOn: $hasConfirmationAction)
                    .toggleStyle(.compoundForm)
                Toggle("Primary Action", isOn: $hasPrimaryAction)
                    .toggleStyle(.compoundForm)
            } header: {
                Text("Configuration")
                    .compoundFormSectionHeader()
            }
            .compoundFormSection()
            
            Section {
                VStack {
                    Text("Empty section to make the form scrollable")
                        .font(.compound.bodySM)
                        .foregroundColor(.compound.textSecondary)
                        .padding(.top, 12)
                    Spacer(minLength: 500)
                }
            }
            .compoundFormSection()
        }
        .compoundForm()
        .navigationTitle(titleMode == .hidden ? "" : "Navigation Bar")
        .navigationBarTitleDisplayMode(titleMode == .large ? .large : .inline)
        .navigationBarBackButtonHidden(backButtonMode != .navigation)
        .toolbar {
            if hasConfirmationAction {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Confirm") { }
                }
            }
            
            if hasPrimaryAction {
                ToolbarItem(placement: .primaryAction) {
                    Button("Primary") { }
                }
            }
            
            if backButtonMode == .cancellationAction {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { }
                }
            }
        }
    }
}

struct NavigationBarScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NavigationBarScreen()
        }
        .previewLayout(.fixed(width: 375, height: 750))
    }
}
