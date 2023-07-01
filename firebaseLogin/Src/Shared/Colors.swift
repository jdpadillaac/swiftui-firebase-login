//
//  Colors.swift
//  firebaseLogin
//
//  Created by Jonatan Padilla on 17/06/23.
//

import Foundation
import SwiftUI


struct AppColors {
    static let veryLightBlue = Color(hex: "#6C63FF")
    static let gunMetal = Color(hex: "#2F2E41")
    static let silverSand = Color(hex: "#C4C4C4")
    static let antiFlashWhite = Color(hex: "#f1f1f1")
    static let raisinBlack = Color(hex: "#252525")
}


extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var rgbValue: UInt64 = 0

        if scanner.scanHexInt64(&rgbValue) {
            let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
            let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
            let blue = Double(rgbValue & 0x0000FF) / 255.0

            self.init(
                .sRGB,
                red: red,
                green: green,
                blue: blue,
                opacity: 1.0
            )
            return
        }

        self.init(
            .sRGB,
            red: 0.0,
            green: 0.0,
            blue: 0.0,
            opacity: 1.0
        )
    }
}
