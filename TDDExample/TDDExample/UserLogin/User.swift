//
//  User.swift
//  TDDExample
//
//  Created by Radim Halfar on 18.06.17.
//  Copyright © 2017 Inloop, s.r.o. All rights reserved.
//

import Foundation
import Alamofire
import Alamofire

final class User {
    
    let userName: String
    
    let password: String
    
    init(userName: String, password: String) {
        self.userName = userName
        self.password = password
    }
    
    func login(result: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        
        let parameters: Parameters = ["username": userName,
                                      "password": password]
        
        let loginURL = "\(baseURLString + loginEndpoint)"
        
        
        Alamofire.request(loginURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            
            // Parse JSON response 
            debugPrint("Response from login request is \(response)")
            
            switch response.result {
            case .success(let data):
            
                let responseDict = data as? [String: Bool]
                if let loginResult = responseDict?["logged_in"] {
                    result(loginResult, nil)
                } else {
                    result(false, NSError(domain: "User", code: 404, userInfo: [NSLocalizedDescriptionKey: "invalid response"]))
                }
                
            case .failure(let error):
                result(false, error)
            }
        }
    }
}
