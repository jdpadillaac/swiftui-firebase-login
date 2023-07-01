//
//  RegisterViewModel.swift
//  firebaseLogin
//
//  Created by Jonatan Padilla on 18/06/23.
//

import Foundation


final class RegisterViewModel: ObservableObject {
    
    let repository: UserRepository
    @Published var errorMessage = "";
    @Published var isVerificationCodeEnabled = false
    
    init(repo: UserRepository) {
        self.repository = repo
    }
    
    func saveNewUser(newUser: NewUserModel)  -> Void {
        repository.newUser(newUser, completion: { result in
            print("ok")
            
            switch result {
            case .success(_):
                self.isVerificationCodeEnabled = true;
            
            case .failure(var err):
                print(err)
            }
        })
    }
    
    
}
