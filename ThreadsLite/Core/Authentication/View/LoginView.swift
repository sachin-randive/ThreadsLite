//
//  LoginView.swift
//  ThreadsLite
//
//  Created by Sachin Randive on 29/11/25.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    var body: some View {
       NavigationStack {
           VStack {
               Spacer()
               // logo image
               Image("threads-app-icon")
                   .resizable()
                   .scaledToFit()
                   .frame(width: 120, height: 120)
                   .padding()
               
               VStack(spacing: 15) {
                   TextField("Enter your email", text: $email)
                       .font(.subheadline)
                       .padding(12)
                       .background(Color(.systemGray6))
                       .cornerRadius(10)
                       .padding(.horizontal, 24)
                   
                   SecureField("Enter your password", text: $password)
                       .font(.subheadline)
                       .padding(12)
                       .background(Color(.systemGray6))
                       .cornerRadius(10)
                       .padding(.horizontal, 24)
               }
               // forgot password
               NavigationLink() {
                   Text("Forgot Password")
               } label: {
                   Text("Forgot Password ?")
                       .font(.footnote)
                       .fontWeight(.semibold)
                       .padding(.top)
                       .foregroundColor(.black)
                       .frame(maxWidth: .infinity, alignment: .trailing)
                       .padding(.trailing, 28)
                       .padding(.bottom)
               }
               NavigationLink() {
                   Text("Login")
               } label: {
                   Text("Login")
                       .font(.subheadline)
                       .fontWeight(.semibold)
                       .foregroundColor(.white)
                       .frame(width: 350, height: 44)
                       .background(Color.black)
                       .cornerRadius(8)
               }
               Spacer()
               Divider()
               NavigationLink() {
                   Text("sign up")
               } label: {
                   Text("Don't have an account ? Sign Up")
                       .font(.footnote)
                       .fontWeight(.semibold)
                       .padding(.top)
                       .foregroundColor(.black)
                       .frame(maxWidth: .infinity, alignment: .init(horizontal: .center, vertical: .top))
               }
               
           }
        }
    }
}

#Preview {
    LoginView()
}
