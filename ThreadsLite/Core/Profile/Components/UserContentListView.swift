//
//  UserContentListView.swift
//  ThreadsLite
//
//  Created by Sachin Randive on 04/12/25.
//

import SwiftUI

struct UserContentListView: View {
    @State private var selectedFilter: ProfileThreadFilter = .threads
    @Namespace var animation
    private var filterBarWidth: CGFloat {
        let count = CGFloat(ProfileThreadFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 15
    }
    
    var body: some View {
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

#Preview {
    UserContentListView()
}
