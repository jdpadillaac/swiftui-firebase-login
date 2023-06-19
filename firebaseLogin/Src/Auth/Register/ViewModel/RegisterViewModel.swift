//
//  RegisterViewModel.swift
//  firebaseLogin
//
//  Created by Jonatan Padilla on 18/06/23.
//

import Foundation


final class RegisterViewModel: ObservableObject {
    
    let repository: UserRepository
    
    init(repo: UserRepository) {
        self.repository = repo
    }
    
    
    func saveNewUser()  -> Void {
        let newUser = NewUserModel(name: "Jonatan Padilla", LastName: "Padilla", email: "email@email.com", password: "12345")
        repository.newUser(newUser, completion: { result in
            print("ok")
        })
    }
    
    
}
