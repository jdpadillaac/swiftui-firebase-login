//
//  RegisterView.swift
//  firebaseLogin
//
//  Created by Jonatan Padilla on 18/06/23.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        RegisterViewContent()
            .environmentObject(
                RegisterViewModel(
                    repo: FirebaseUserRepository()
                )
            )
    }
}

struct RegisterViewContent: View {
    
    @EnvironmentObject var registerVm: RegisterViewModel
    
    var body: some View {
        Text("Vew view")
            .onAppear{
                registerVm.saveNewUser()
            }
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
