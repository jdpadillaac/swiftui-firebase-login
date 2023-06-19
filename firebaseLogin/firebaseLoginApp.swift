//
//  firebaseLoginApp.swift
//  firebaseLogin
//
//  Created by Jonatan Padilla on 16/06/23.
//

import SwiftUI
import Firebase

@main
struct firebaseLoginApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
