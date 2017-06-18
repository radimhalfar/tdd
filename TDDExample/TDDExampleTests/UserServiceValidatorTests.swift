//
//  UserServiceValidatorTests.swift
//  TDDExample
//
//  Created by Radim Halfar on 18.06.17.
//  Copyright © 2017 Inloop, s.r.o. All rights reserved.
//

import Foundation
import XCTest
@testable import TDDExample

class UserServiceValidatorTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testThatNoErrorsReportedWithValidUser() {
    
        let validUser = User(userName: "test_user@inloop.eu", password: "ExamplePass1#")
        
        XCTAssertNil(UserServiceValidator.validateLogin(validUser))
    }
    
    func testThatErrorReportedWithInvalidUserEmail() {
        
        let invalidUser = User(userName: "test_user", password: "ExamplePass1#")
        let result = UserServiceValidator.validateLogin(invalidUser)
        
        let containsExpectedError = result?.filter {
            
            $0.localizedDescription == UserServiceValidator.invalidEmail.localizedDescription
        }
        
        XCTAssertNotNil(containsExpectedError)
    }
    
    func testThatErrorReportedWithEmptyUserEmail() {
        
        let invalidUser = User(userName: "", password: "ExamplePass1#")
        let result = UserServiceValidator.validateLogin(invalidUser)
        
        let containsExpectedError = result?.filter {
            
            $0.localizedDescription == UserServiceValidator.invalidEmailLength.localizedDescription
        }
        
        XCTAssertNotNil(containsExpectedError)
    }
    
    func testThatErrorReportedWithInvalidUserPassword() {
        
        let invalidUser = User(userName: "test_user@inloop.eu", password: "ExamplePass1")
        let result = UserServiceValidator.validateLogin(invalidUser)
        
        let containsExpectedError = result?.filter {
            
            $0.localizedDescription == UserServiceValidator.invalidPassword.localizedDescription
        }
        
        XCTAssertNotNil(containsExpectedError)
    }
    
    func testThatErrorReportedWithEmptyUserPassword() {
        
        let invalidUser = User(userName: "test_user@inloop.eu", password: "")
        let result = UserServiceValidator.validateLogin(invalidUser)
        
        let containsExpectedError = result?.filter {
            
            $0.localizedDescription == UserServiceValidator.invalidPassword.localizedDescription
        }
        
        XCTAssertNotNil(containsExpectedError)
    }
}
