//
//  LoginView.swift
//  firebaseLogin
//
//  Created by Jonatan Padilla on 17/06/23.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var loginVM = LoginViewModel()
    
    var body: some View {
        
        switch loginVM.loginState {
        case .unAutehnticated:
            LoginPageContent()
        case .successLoggin:
            EmptyView()
        case .invalidCredentials:
            EmptyView()
        }
    }
}

struct LoginPageContent: View {
    
    var body: some View {
        NavigationStack  {
            VStack {
                Spacer()
                    .frame(height: 42)
                ImageAndTitleHeader(
                    title: "Welcome back",
                    subtitle: "sign in to access your account"
                )
                LoginForm()
                RememberAndForgotPass()
                Spacer()
                PageBottom()
            }
            .navigationBarBackButtonHidden()
        }
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
    
    let title: String
    let subtitle: String
    var paddingBottom: CGFloat?
    
    
    var body: some View {
        ZStack {
            Image("walk-tree-mountain")
                .padding(.leading, 100)
            
            VStack {
                Text(title)
                    .font(.system(size: 24))
                    .bold()
                
                Spacer()
                    .frame(height: 8)
                
                Text(subtitle)
                    .font(.system(size: 14))
            }
            .padding(.top, 65)

        }
        .padding(.bottom, paddingBottom)
    }
}



struct AppTextField: View {
    
    @Binding var text: String
    let title: String
    let iconName: String
    var isPassword: Bool = false
    var keyboardType: UIKeyboardType?
    
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
                    .keyboardType(keyboardType ?? .default)
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



struct RememberAndForgotPass: View {
    
    var body: some View {
        HStack {
            HStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 12, height: 12)
                    .cornerRadius(3)
                    .overlay(
                        RoundedRectangle(cornerRadius: 3)
                        .inset(by: 0.5)
                        .stroke(Color(red: 0.8, green: 0.8, blue: 0.8), lineWidth: 1)
                    )
                Text("Remember me")
                    .font(.system(size: 12))
                    .foregroundColor(AppColors.raisinBlack)
                
            }
            Spacer()
            Text("Forget password ?")
                .font(.system(size: 12))
                .foregroundColor(AppColors.veryLightBlue)
        }
        .padding(.horizontal, 31)
        .padding(.top, 16)
    }
}



struct PageBottom: View {
    
    var body: some View {
        VStack {
            NextButton("Next", icon: "chevron.right") {
                
            }
            Spacer()
                .frame(height: 24)
            HStack {
                Text("New Member?")
                    .fontWeight(.medium)
                    .font(.system(size: 13))
                
                NavigationLink(destination: RegisterView() , label: {
                    Text("Register now")
                        .fontWeight(.medium)
                        .font(.system(size: 13))
                        .foregroundColor(AppColors.veryLightBlue)
                })
            }
            
        }
    }
}




