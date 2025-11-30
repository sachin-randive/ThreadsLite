//
//  CircularImageProfileView.swift
//  ThreadsLite
//
//  Created by Sachin Randive on 30/11/25.
//

import SwiftUI

struct CircularImageProfileView: View {
    var body: some View {
        Image("profile_image")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

#Preview {
    CircularImageProfileView()
}
