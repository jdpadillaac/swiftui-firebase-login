//
//  ContentView.swift
//  firebaseLogin
//
//  Created by Jonatan Padilla on 16/06/23.
//

import SwiftUI

struct ContentView: View {

    
    var body: some View {
        SplashView()
            .environmentObject(SplashViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


