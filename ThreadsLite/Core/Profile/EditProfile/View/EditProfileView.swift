//
//  EditProfileView.swift
//  ThreadsLite
//
//  Created by Sachin Randive on 01/12/25.
//

import SwiftUI

struct EditProfileView: View {
    
   @State private var bio = ""
   @State private var link = ""
    @State private var isPrivateProfile: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGroupedBackground)
                VStack {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Name")
                                .fontWeight(.semibold)
                            Text("charles Lectus")
                        }
                        
                        Spacer()
                        CircularImageProfileView()
                    }
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("Bio")
                            .fontWeight(.semibold)
                        TextField("Enter your bio ...", text: $bio)
                    }
                    Divider()
                    
                    VStack(alignment: .leading) {
                        Text("Link")
                            .fontWeight(.semibold)
                        TextField("Add link ...", text: $link)
                    }
                    Divider()
                        Toggle("Private profile", isOn: $isPrivateProfile)
                }
                .font(.footnote)
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
                .padding()
            }
            .navigationTitle(Text("Edit Profile"))
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        
                    }
                    .font(.subheadline)
                    .foregroundStyle(.black)
                    
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    
                }
            }
        }
    }
}

#Preview {
    EditProfileView()
}
