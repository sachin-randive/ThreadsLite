//
//  UserCell.swift
//  ThreadsLite
//
//  Created by Sachin Randive on 30/11/25.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            CircularImageProfileView()
            VStack(alignment: .leading, spacing: 5) {
                Text("MaxVer_stappen1")
                    .fontWeight(.semibold)
                Text("Max Verstanpeen")
            }
            .font(.footnote)
            
            Spacer()
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 30)
                .overlay(content: {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(style:  StrokeStyle(lineWidth: 1))
                })
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell()
}
