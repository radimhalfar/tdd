//
//  UserServiceValidator.swift
//  TDDExample
//
//  Created by Radim Halfar on 18.06.17.
//  Copyright © 2017 Inloop, s.r.o. All rights reserved.
//

import Foundation

final class UserServiceValidator {
    
    static let invalidEmail = NSError.userError(with: "Invalid email")
    static let invalidEmailLength = NSError.userError(with: "Invalid email length")
    static let invalidPassword = NSError.userError(with: "Invalid password")
    static let invalidPasswordLength = NSError.userError(with: "Invalid password length")
    
    static func validateLogin(_ user: User) -> [Error]? {
        // user.username cannot be empty
        
        var errors = [Error]()
        
        let username = user.userName
        let password = user.password
        
        /// Check for lenght
        if username.trimmingCharacters(in: .whitespaces).characters.count == 0 {
            errors.append(invalidEmailLength)
        }
        
        /// Check for valid email
        if username.isValidEmail == false {
            errors.append(invalidEmail)
        }
        
        /// check for password length
        if password.trimmingCharacters(in: .whitespaces).characters.count == 0 {
            errors.append(invalidPasswordLength)
        }
        
        /// check for password validity
        if password.isValidPassword == false {
            errors.append(invalidPassword)
        }
        
        return errors.count > 0 ? errors : nil
    }
}
