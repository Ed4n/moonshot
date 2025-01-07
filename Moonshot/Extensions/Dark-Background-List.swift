//
//  Dark-Background-List.swift
//  Moonshot
//
//  Created by Edgardo Valencia on 7/1/25.
//

import SwiftUI

struct DarkBackgroundListModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listRowBackground(Color.darkBackground)
            .scrollContentBackground(.hidden)
            .background(Color.darkBackground)
    }
}

extension View {
    func applyDarkBackgroundList() -> some View {
        self.modifier(DarkBackgroundListModifier())
    }
}
