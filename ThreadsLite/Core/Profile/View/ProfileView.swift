//
//  ProfileView.swift
//  ThreadsLite
//
//  Created by Sachin Randive on 30/11/25.
//

import SwiftUI

struct ProfileView: View {
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 15
    }
    var body: some View {
        ScrollView( showsIndicators: false) {
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 15) {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Charles Leclrc")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("Charlec_leclrc")
                                .font(.subheadline)
                        }
                        Text("formula 1 driver for student ferrari")
                            .font(.footnote)
                        
                        Text("2 followers")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                    CircularImageProfileView()
                }
                //outer vstack
                Button(action: {
                    
                }) {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 352, height: 32)
                        .background(Color.black)
                        .cornerRadius(10)
                }
                VStack {
                    HStack {
                        ForEach(ProfileThreadFilter.allCases) { filter in
                            VStack {
                                Text(filter.title)
                                    .font(.subheadline)
                                    .fontWeight(selectedFilter == filter ? .semibold : .regular)
                                
                                if selectedFilter == filter {
                                    Rectangle()
                                        .frame(width: filterBarWidth, height: 2)
                                        .foregroundColor(Color.black)
                                        .matchedGeometryEffect(id: "ite", in: animation)
                                } else {
                                    Rectangle()
                                        .frame(width: filterBarWidth, height: 1)
                                        .foregroundColor(.clear)
                                }
                            }
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    selectedFilter = filter
                                }
                            }
                            
                        }
                    }
                    LazyVStack {
                        ForEach(0..<10, id: \.self) { thread in
                          ThreadCell()
                        }
                    }
                }
                .padding(.vertical, 10)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    ProfileView()
}
