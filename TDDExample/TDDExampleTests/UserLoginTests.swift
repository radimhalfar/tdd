//
//  TDDExampleTests.swift
//  TDDExampleTests
//
//  Created by Radim Halfar on 18.06.17.
//  Copyright © 2017 Inloop, s.r.o. All rights reserved.
//

import XCTest
@testable import TDDExample

class UserLoginTests: XCTestCase {
    
    // MARK: Environment
    
    var user: User?
    
    override func setUp() {
        super.setUp()
        /// Setup your environment in here
        /*
         What is the environment needed to accomplish the test ?
         Are there any preconditions ?
         */
        
        user = User(userName: "test_user@inloop.eu", password: "example_Password123*")
    }
    
    override func tearDown() {
        super.tearDown()
        
        /// This part requires you to cleanup
    }
    
    // MARK: Tests
    
    func testThatUserLoggedInWithValidCrendetials() {
        // What are you going to test ?
        /*
         - A user that is not logged in
         - valid credentials are provided
         -
         */
        let loginExpectation = expectation(description: "User is logged in")
        
        user?.login(result: { (status, error) in
            
            XCTAssert(status == true)
            XCTAssert(error == nil)
            
            loginExpectation.fulfill()
        })
        
        waitForExpectations(timeout: 5.0, handler: nil)
    }
}
