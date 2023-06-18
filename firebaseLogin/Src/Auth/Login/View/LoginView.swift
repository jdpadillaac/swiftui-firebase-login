//
//  LoginView.swift
//  firebaseLogin
//
//  Created by Jonatan Padilla on 17/06/23.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            ImageAndTitleHeader()
            LoginForm()
        }
        .navigationBarBackButtonHidden()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


struct LoginForm: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack  {

           AppTextField(
                text: $email,
                title: "Enter your email",
                iconName: "envelope"
           )
            
            Spacer()
                .frame(height: 24)
            
            AppTextField(
                 text: $password,
                 title: "Password",
                 iconName: "lock",
                 isPassword: true
            )

        }
        .padding(.horizontal, 31)
    }
}



struct ImageAndTitleHeader: View {
    
    var body: some View {
        ZStack {
            Image("walk-tree-mountain")
                .padding(.leading, 100)
            
            VStack {
                Text("Welcome back")
                    .font(.system(size: 24))
                    .bold()
                
                Spacer()
                    .frame(height: 8)
                
                Text("Sign in to access you account")
                    .font(.system(size: 14))
            }
            .padding(.top, 65)

        }
        .padding(.bottom, 32)
    }
}



struct AppTextField: View {
    
    @Binding var text: String
    let title: String
    let iconName: String
    var isPassword: Bool = false
    
    var body: some View {
        HStack(spacing: 0) {
            
            if isPassword {
                SecureField(title, text: $text)
                    .padding(.leading)
                    .font(.system(size: 14))
            } else {
                TextField(title, text: $text)
                    .padding(.leading)
                    .font(.system(size: 14))
                    .keyboardType(.emailAddress)
            }
               
            
            Image(systemName: iconName)
                .foregroundColor(.gray)
                .padding(30)
                .frame(width: 20, height: 24)
                .padding(.all, 13)

        }
        .background(AppColors.antiFlashWhite)
        .cornerRadius(10)
    }
}

