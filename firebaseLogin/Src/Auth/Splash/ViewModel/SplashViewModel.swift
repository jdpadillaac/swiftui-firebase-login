//
//  SplashViewModel.swift
//  firebaseLogin
//
//  Created by Jonatan Padilla on 18/06/23.
//

import Foundation


class SplashViewModel: ObservableObject {
    
    @Published var goToOnboarding: Bool = false
    
    
    init() {
        fecthData()
    }
    
    func fecthData()  -> Void {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.goToOnboarding = true
            print("Now show navigate")
        }
    }
    
}
