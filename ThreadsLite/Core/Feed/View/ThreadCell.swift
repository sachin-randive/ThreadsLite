//
//  ThreadCell.swift
//  ThreadsLite
//
//  Created by Sachin Randive on 30/11/25.
//

import SwiftUI

struct ThreadCell: View {
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 12) {
                
                CircularImageProfileView()
                
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text("MaxVer_stappen1")
                            .font(.footnote)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("10m")
                            .font(.caption)
                            .foregroundStyle(Color(.systemGray3))
                        Button {
                            
                        }label: {
                            Image(systemName:"ellipsis")
                                .foregroundStyle(Color(.darkGray))
                        }
                    }
                    Text("Formula 1 Champion of the year")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                    
                    HStack(spacing: 16) {
                        Button {
                        
                        } label: {
                            Image(systemName: "heart")
                                
                        }
                        
                        Button {
                        
                        } label: {
                            Image(systemName: "bubble.right")
                                
                        }
                        
                        Button {
                        
                        } label: {
                            Image(systemName: "arrow.rectanglepath")
                                
                        }
                        
                        Button {
                        
                        } label: {
                            Image(systemName:"paperplane")
                                
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            Divider()
        }
        .foregroundStyle(Color(.black))
        .padding()
    }
}

#Preview {
    ThreadCell()
}
