//
//  SplashViewModel.swift
//  firebaseLogin
//
//  Created by Jonatan Padilla on 18/06/23.
//

import Foundation


class SplashViewModel: ObservableObject {
    
    @Published var goToOnboarding: Bool = false
    @Published var goToLogin: Bool = false;
    
    
    init() {
        fecthData()
    }
    
    func fecthData()  -> Void {
        let alreadyOpened = UserDefaults.standard.bool(forKey: "first_time")
        
        if alreadyOpened {
            goToLogin = true;
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.goToOnboarding = true
            UserDefaults.standard.setValue(true, forKey: "first_time")
            print("Now show navigate")
        }
    }
    
}
