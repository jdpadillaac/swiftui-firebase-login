//
//  Extentions .swift
//  firebaseLogin
//
//  Created by Jonatan Padilla on 1/07/23.
//

import Foundation

extension String {
    
    var isEmail: Bool {
        guard let emailRegex = try? Regex("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        else { return false }
        return self.firstMatch(of: emailRegex) != nil
    }
}
