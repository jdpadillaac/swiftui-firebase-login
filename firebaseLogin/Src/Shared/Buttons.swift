//
//  Buttons.swift
//  firebaseLogin
//
//  Created by Jonatan Padilla on 30/06/23.
//

import Foundation
import SwiftUI


struct NextButton: View {
    
    let label: String
    let icon: String
    let action: () -> Void
    
    
    init(_ label: String, icon: String,  action: @escaping () -> Void) {
        self.label = label
        self.icon = icon
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text("Next")
                    .foregroundColor(Color.white)
                    .font(.system(size: 24))
                    .fontWeight(.semibold)
                
                Image(systemName: icon)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
            .padding(.vertical, 14)
        }
        .frame(maxWidth: .infinity)
        .foregroundColor(.clear)
        .background(AppColors.veryLightBlue)
        .cornerRadius(10)
        .padding(.horizontal, 30)
  
    }
}
