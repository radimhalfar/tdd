//
//  TDDExampleTestsQuick.swift
//  TDDExampleTestsQuick
//
//  Created by Radim Halfar on 18.06.17.
//  Copyright © 2017 Inloop, s.r.o. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import TDDExample

class UserLoginSpec: QuickSpec {

    override func spec() {
    
        /// Describe what are we going to test
        describe("An User") {
            
            /// What are the conditions to test 
            
            context("After requesting login with valid credentials") {
            
                // Setup the context in which is user acting
                
                let user = User(userName: "test_user@inloop.eu", password: "example_Password123*")
                
                var isLoggedIn = false
                var loginError: Error?
                
                /// define expected outcome
                it("should be logged in") {
                
                    UserService.login(user: user, result: { (status, error) in
                        isLoggedIn = status
                        loginError = error
                    })
                
                    expect(isLoggedIn).toEventually(beTrue(), timeout: 5.0)
                    expect(loginError).toEventually(beNil(), timeout: 5.0)
                }
            }
        }
    }
}
