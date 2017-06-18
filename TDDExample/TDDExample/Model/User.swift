//
//  User.swift
//  TDDExample
//
//  Created by Radim Halfar on 18.06.17.
//  Copyright © 2017 Inloop, s.r.o. All rights reserved.
//

import Foundation
import Alamofire

final class User {
    
    let userName: String
    
    let password: String
    
    init(userName: String, password: String) {
        self.userName = userName
        self.password = password
    }
}
