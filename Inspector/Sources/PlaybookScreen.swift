//
//  PlaybookScreen.swift
//  Compound Inspector
//
//  Created by Mauro Romito on 21/09/23.
//

import SwiftUI

import Compound
import Prefire

struct PlaybookScreen: View {
    var body: some View {
        NavigationStack {
            PlaybookView(isComponent: true, previewModels: PreviewModels.models)
        }
        .navigationTitle("Playbook")
    }
}

struct PlaybookScreen_Previews: PreviewProvider {
    static var previews: some View {
        PlaybookScreen()
    }
}
