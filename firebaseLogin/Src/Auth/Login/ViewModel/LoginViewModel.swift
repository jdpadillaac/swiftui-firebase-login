//
//  LoginViewModel.swift
//  firebaseLogin
//
//  Created by Jonatan Padilla on 18/06/23.
//

import Foundation

enum Loginstate {
    case invalidCredentials
    case successLoggin
    case unAutehnticated
}

final class  LoginViewModel: ObservableObject {
    
    @Published var loginState: Loginstate = .unAutehnticated
}
