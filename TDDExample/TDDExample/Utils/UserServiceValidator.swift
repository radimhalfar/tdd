//
//  UserServiceValidator.swift
//  TDDExample
//
//  Created by Radim Halfar on 18.06.17.
//  Copyright © 2017 Inloop, s.r.o. All rights reserved.
//

import Foundation

final class UserServiceValidator {
    
    static func validateLogin(_ user: User) -> [TDDError]? {
        // user.username cannot be empty
        
        var errors = [TDDError]()
        
        let username = user.userName
        let password = user.password
        
        /// Check for lenght
        if username.trimmingCharacters(in: .whitespaces).characters.count == 0 {
            errors.append(Errors.invalidEmailLength)
        }
        
        /// Check for valid email
        if username.isValidEmail == false {
            errors.append(Errors.invalidEmail)
        }
        
        /// check for password length
        if password.trimmingCharacters(in: .whitespaces).characters.count == 0 {
            errors.append(Errors.invalidPasswordLength)
        }
        
        /// check for password validity
        if password.isValidPassword == false {
            errors.append(Errors.invalidPassword)
        }
        
        return errors.count > 0 ? errors : nil
    }
}
