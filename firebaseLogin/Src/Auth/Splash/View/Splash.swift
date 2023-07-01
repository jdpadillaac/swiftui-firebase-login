//
//  Splahs.swift
//  firebaseLogin
//
//  Created by Jonatan Padilla on 18/06/23.
//

import SwiftUI

struct SplashView: View {
    
    @EnvironmentObject var splashViewModel: SplashViewModel
    
    var body: some View {
        
        if splashViewModel.goToLogin {
            LoginView()
        } else if splashViewModel.goToOnboarding {
            withAnimation {
                OnBoarding()
            }
        } else {
            withAnimation {
                SplashViewContent()
            }
        }
    }
}



struct SplashViewContent: View {
    
    var body: some View {
        ZStack {
            AppColors.veryLightBlue.ignoresSafeArea()
            VStack {
                
                HStack {
                    Spacer()
                        .frame(width: 60)
                    Image("globe-first")
                }
                
                
                HStack {
                    Text("Explora")
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 24))
                    
                    Image("waves-firts")
                }

            }
        }
    }
}

