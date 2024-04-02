//
//  CardBottom.swift
//  GronkTVApp
//
//  Created by Steven Hübner on 01.04.24.
//

import Foundation
import SwiftUI

struct TagCard: ViewModifier {
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
                .foregroundStyle(Color("White"))
                .padding(6)
                .background(Color("GreyPurple"))
                .clipShape(.rect(topLeadingRadius: 6, bottomLeadingRadius: 6, bottomTrailingRadius: 6, topTrailingRadius: 6))
        }
    }
}

extension View {
    func tagCard() -> some View {
        modifier(TagCard())
    }
}
