//
//  RegisterView.swift
//  firebaseLogin
//
//  Created by Jonatan Padilla on 18/06/23.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        RegisterViewContent()
            .environmentObject(
                RegisterViewModel(
                    repo: FirebaseUserRepository()
                )
            )
            .navigationBarBackButtonHidden()
    }
}

struct RegisterViewContent: View {
    
    @EnvironmentObject var registerVm: RegisterViewModel
    
    var body: some View {
        
        if registerVm.isVerificationCodeEnabled {
            VStack {
                
            }
        } else {
            ScrollView {
                VStack {
                    Header()
                    Form()
                }
            }
        }
    }
}

struct Form: View {
    
    @EnvironmentObject var registerVm: RegisterViewModel;
    
    @State var email: String = ""
    @State var name: String = ""
    @State var phoneNumber: String = ""
    @State var pass: String = ""
    @State var formError = ""
    
    func validateForm() -> Bool {
        formError = validationError();
        return formError.isEmpty
    }
    
    func validationError() -> String {
        if name.isEmpty {
            return "Name should not be empty"
        } else if email.isEmpty {
            return "Email should not be empty"
        } else if !email.isEmail {
            return "Email is not valid"
        } else if phoneNumber.isEmpty {
            return "Phone number should not be empty"
        } else if pass.isEmpty {
            return "Password should be not empty"
        } else {
            return ""
        }
    }
    
    var body: some View {
        VStack {
            Text(formError)
                .foregroundColor(.red)
            Text(registerVm.errorMessage)
                .foregroundColor(.red)
            VStack {
                AppTextField(
                    text: $name,
                    title: "Full name",
                    iconName: "person"
                )
                AppTextField(
                    text: $email,
                    title: "Valid email",
                    iconName: "envelope",
                    keyboardType: .emailAddress
                )
                AppTextField(
                    text: $phoneNumber,
                    title: "Phone number",
                    iconName: "phone",
                    keyboardType: .numberPad
                )
                AppTextField(
                    text: $pass,
                    title: "Strong password",
                    iconName: "lock",
                    isPassword: true
                )
            }
            
            TermsAndConditions()
            Spacer()
                .frame(height: 116)
            
            NextButton("Next", icon: "chevron.right", action: {
                let isFormValid = validateForm()
                
                if !isFormValid {
                    return
                }
                
                let newUser = NewUserModel(name: name, LastName: name, email: email, password: pass)
                
                registerVm.saveNewUser(newUser: newUser)
            })
            
            HStack {
                Text("Already a member?")
                    .font(.system(size: 13))
                NavigationLink {
                    LoginView()
                } label: {
                    Text("Log in")
                        .foregroundColor(AppColors.veryLightBlue)
                        .font(.system(size: 13))
                        
                }
            }

        }
        .padding(.horizontal, 30)
    }
}

struct TermsAndConditions: View {
    
    var body: some View {
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
            
            NavigationLink {
                TermsAndCOnditionsView()
            } label: {
                Text("By checking the box you agree to our Terms and Conditions")
                    .font(.system(size: 9))
                    .foregroundColor(.black)
            }
            
        }
        .padding(.top, 10)
    }
}



struct Header: View {
    
    var body: some View {
        Spacer()
            .frame(height: 42)
        ImageAndTitleHeader(
            title: "Get Started",
            subtitle: "by creating a free account.",
            paddingBottom: 2
        )
    }
}



struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}


struct TermsAndCOnditionsView: View {
    
    var body: some View {
        Text("Vew view")
    }
}

