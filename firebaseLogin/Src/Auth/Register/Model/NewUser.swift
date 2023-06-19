//
//  NewUser.swift
//  firebaseLogin
//
//  Created by Jonatan Padilla on 18/06/23.
//

import Foundation

protocol UserRepository {
    func newUser(_ user: NewUserModel, completion: @escaping(Result<Bool, Error>) -> Void) -> Void
}


struct NewUserModel: Encodable {
    let name: String
    let LastName: String
    let email: String
    let password: String
    
    func toDic() -> [String: Any] {
        return [
            "name": name,
            "last_name": LastName,
            "email": email,
            "password": password
        ]
    }
}
