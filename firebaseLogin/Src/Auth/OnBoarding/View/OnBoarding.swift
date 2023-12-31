//
//  OnBoarding.swift
//  firebaseLogin
//
//  Created by Jonatan Padilla on 17/06/23.
//

import SwiftUI

struct OnBoarding: View {
    
    @State var pageSelected: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                TabView(selection: $pageSelected) {
                    PageOfPageView(
                        title : "Explore the world easily",
                        subtitle: "To your desire",
                        image: "man-girl-moto"
                    ).tag(0)
                    
                    PageOfPageView(
                        title : "Reach the unknown spot",
                        subtitle: "To your destination",
                        image: "women-park"
                    ).tag(1)
                    
                    PageOfPageView(
                        title : "Make connects with explora",
                        subtitle: "To your desire",
                        image: "women-travel"
                    ).tag(2)
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .ignoresSafeArea()
                
                BottomWithIndicators(pageSelected: $pageSelected)
            }
        }

    }
}



struct BottomWithIndicators: View {
    
    @Binding var pageSelected: Int
    @State var navToLogin: Bool = false
    
    var body: some View {
        HStack {
            DotInidicator(pageSelected: $pageSelected)
            
            Spacer()
            
            if pageSelected < 2 {
                Button(action: {
                    pageSelected += 1
                }) {
                 ButtonCircle()
                }
            } else if pageSelected == 2{
                NavigationLink {
                    LoginView()
                } label: {
                    ButtonCircle()
                }
            }
            

            
        }
        .background(Color.white)
        .padding(.top, 36)
        .padding(.bottom, 16)
        .padding(.horizontal, 28)
    }
}

struct DotInidicator: View {
    
    @Binding var pageSelected: Int
    
    var body: some View {
        HStack {
            RoundedRectangle(cornerRadius:  10)
                .frame(width: 13, height: 6)
                .foregroundColor(pageSelected == 0 ? AppColors.gunMetal : AppColors.veryLightBlue)
            
            Spacer()
                .frame(width: 2)
            
            RoundedRectangle(cornerRadius:  10)
                .frame(width: 13, height: 6)
                .foregroundColor(pageSelected == 1 ? AppColors.gunMetal : AppColors.veryLightBlue)
            
            Spacer()
                .frame(width: 2)
            
            RoundedRectangle(cornerRadius:  10)
                .frame(width: 13, height: 6)
                .foregroundColor(pageSelected == 2 ? AppColors.gunMetal : AppColors.veryLightBlue)
        }

    }
}


struct PageOfPageView: View {
    
    let title: String
    let subtitle: String
    let image: String
    
    var body: some View {
        VStack {
            Spacer()
                .frame(maxWidth: .infinity)
                .frame(height: 0)
    
            
            Image(image)
            
            Spacer()
                .frame(height: 95)
            
            HStack {
                Text(title)
                    .fontWeight(.heavy)
                    .font(.system(size: 36))
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            
            Spacer()
                .frame(height: 8)
            
            HStack(alignment: .firstTextBaseline) {
                HStack {
                    Text(subtitle)
                        .font(.system(size: 24))
                        .multilineTextAlignment(.leading)
                }
                Spacer()
            }
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 16)
        .ignoresSafeArea()
    }
}



struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}

struct OnBoarding_Previews2: PreviewProvider {
    static var previews: some View {
        PageOfPageView(
            title : "Make connects with explora",
            subtitle: "To your desire",
            image: "women-travel"
        ).tag(1)
    }
}


struct ButtonCircle: View {
    
    var body: some View {
        Circle()
            .frame(width: 50, height: 50)
            .foregroundColor(AppColors.gunMetal)
            .overlay(
                Image(systemName: "chevron.right")
                    .foregroundColor(.white)
            )
    }
}

