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
                        .autocapitalization(.none)
                        .modifier(ThreadsTextFieldModifier())
                    
                    SecureField("Enter your password", text: $password)
                        .modifier(ThreadsTextFieldModifier())
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
                Button {
                    //action
                } label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 350, height: 44)
                        .background(.black)
                        .cornerRadius(8)
                }
                Spacer()
                Divider()
                NavigationLink() {
                    RegistrationView()
                } label: {
                    HStack(spacing: 5) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.black)
                    .font(.footnote)
                }
                .padding(.vertical, 15)
            }
        }
    }
}

#Preview {
    LoginView()
}
