//
//  ThreadsTextFieldModifier.swift
//  ThreadsLite
//
//  Created by Sachin Randive on 29/11/25.
//

import SwiftUI

struct ThreadsTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
