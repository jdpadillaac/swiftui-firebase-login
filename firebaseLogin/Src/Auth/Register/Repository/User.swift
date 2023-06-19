//
//  User.swift
//  firebaseLogin
//
//  Created by Jonatan Padilla on 18/06/23.
//


import Foundation
import FirebaseFirestore


class FirebaseUserRepository: UserRepository {
    
    private let store = Firestore.firestore()
    private let storePath = "Users"
    
    func newUser(_ user: NewUserModel, completion: @escaping (Result<Bool, Error>) -> Void) {
           let _ =  store.collection(storePath).addDocument(data: user.toDic())
            completion(.success(true))
    }
    
}
