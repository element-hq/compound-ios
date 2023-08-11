//
//  ListScreen.swift
//  Compound Inspector
//
//  Created by Doug on 06/05/2022.
//

import SwiftUI
import Compound
import HyperionCore

struct ListScreen: View {
    var body: some View {
        ListRow_Previews.previews
            .navigationTitle("Forms")
    }
}

struct ListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ListScreen()
        }
        .previewLayout(.fixed(width: 375, height: 700))
    }
}
