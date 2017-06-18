//
//  UserServiceValidatorSpec.swift
//  TDDExample
//
//  Created by Radim Halfar on 18.06.17.
//  Copyright © 2017 Inloop, s.r.o. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import TDDExample

class UserServiceValidatorSpec: QuickSpec {

    override func spec() {
        
        describe("A UserServiceValidator") {
            
            context("After validating user login with valid user") {
                
                let user = User(userName: "testUser@inloop.eu", password: "Example1#")
                
                it("should report no errors") {
                
                    expect(UserServiceValidator.validateLogin(user)).to(beNil())
                }
            }
            
            context("After validating user login with invalid email") {
                
                let user = User(userName: "testUser@", password: "Example1#")
                
                it("should invalid email error") {
                    
                    guard let result = UserServiceValidator.validateLogin(user) else {
                        fail("Invalid validation")
                        return
                    }
                    
                    let containsExpectedError = result.filter {
                    
                        $0.localizedDescription == UserServiceValidator.invalidEmail.localizedDescription
                    }
                    
                    expect(containsExpectedError).toNot(beNil())
                }
            }
            
            context("After validating user login with empty email") {
                
                let user = User(userName: "", password: "Example1#")
                
                it("should invalid email error") {
                    
                    guard let result = UserServiceValidator.validateLogin(user) else {
                        fail("Invalid validation")
                        return
                    }
                    
                    let containsExpectedError = result.filter {
                        
                        $0.localizedDescription == UserServiceValidator.invalidEmailLength.localizedDescription
                    }
                    
                    expect(containsExpectedError).toNot(beNil())
                }
            }
            
            context("After validating user login with invalid password") {
                
                let user = User(userName: "testUser@inloop.eu", password: "Example1")
                
                it("should invalid email error") {
                    
                    guard let result = UserServiceValidator.validateLogin(user) else {
                        fail("Invalid validation")
                        return
                    }
                    
                    let containsExpectedError = result.filter {
                        
                        $0.localizedDescription == UserServiceValidator.invalidPassword.localizedDescription
                    }
                    
                    expect(containsExpectedError).toNot(beNil())
                }
            }

            context("After validating user login with invalid password langth") {
                
                let user = User(userName: "testUser@inloop.eu", password: "")
                
                it("should invalid email error") {
                    
                    guard let result = UserServiceValidator.validateLogin(user) else {
                        fail("Invalid validation")
                        return
                    }
                    
                    let containsExpectedError = result.filter {
                        
                        $0.localizedDescription == UserServiceValidator.invalidPasswordLength.localizedDescription
                    }
                    
                    expect(containsExpectedError).toNot(beNil())
                }
            }
        }
    }
}
