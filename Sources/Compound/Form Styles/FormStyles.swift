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

enum FormRow {
    /// Element specific insets that are used for all our Form rows.
    static let insets = EdgeInsets(top: 7, leading: 16, bottom: 7, trailing: 16)
}

public extension View {
    /// Styles a form using the Compound design tokens.
    func compoundForm() -> some View {
        scrollContentBackground(.hidden)
            .background(Color.compound.bgSubtleSecondary.ignoresSafeArea()) // FIXME: Use elevation tokens.
    }
    
    /// Styles a form section using the Compound design tokens.
    func compoundFormSection() -> some View {
        listRowInsets(FormRow.insets)
            .listRowBackground(Color.compound.bgCanvas) // FIXME: Use elevation tokens.
    }
    
    /// Styles a form section footer using the Compound design tokens.
    func compoundFormSectionFooter() -> some View {
        font(.compound.bodySM)
            .foregroundColor(Color.compound.textSecondary)
    }
}
