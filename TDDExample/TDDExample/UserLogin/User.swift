//
//  User.swift
//  TDDExample
//
//  Created by Radim Halfar on 18.06.17.
//  Copyright © 2017 Inloop, s.r.o. All rights reserved.
//

import Foundation

final class User {
    
    let userName: String
    
    let password: String
    
    init(userName: String, password: String) {
        self.userName = userName
        self.password = password
    }
    
    func login(result: (_ status: Bool, _ error: Error?) -> ()) {
        
        
        result(false, NSError(domain: "UserDomain", code: 400, userInfo: [NSLocalizedDescriptionKey: "Login failure"]))
    }
}
