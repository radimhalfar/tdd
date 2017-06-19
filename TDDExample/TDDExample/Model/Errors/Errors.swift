//
//  Errors.swift
//  TDDExample
//
//  Created by Radim Halfar on 19.06.17.
//  Copyright © 2017 Inloop, s.r.o. All rights reserved.
//

import Foundation

struct TDDError: Error {
    
    let code: Int
    
    let errorDescription: String
    
    init(code: Int, errorDescription: String) {
    
        self.code = code
        self.errorDescription = errorDescription
    }
    
    var localizedDescription: String {
        return errorDescription
    }
}

extension TDDError: Equatable { }

func ==(lhs: TDDError, rhs: TDDError) -> Bool {
    return lhs.code == rhs.code && lhs.errorDescription == rhs.errorDescription
}

class Errors {
    
    static let invalidEmail = TDDError(code: 1001, errorDescription: "Invalid email")
    
    static let invalidEmailLength = TDDError(code: 1002, errorDescription: "Invalid email length")
    
    static let invalidPassword = TDDError(code: 1003, errorDescription: "Invalid password")
    
    static let invalidPasswordLength = TDDError(code: 1004, errorDescription: "Invalid password length")
}
