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
    
    override func setUp() {
        super.setUp()
        /// Setup your environment in here
        /*
         What is the environment needed to accomplish the test ?
         Are there any preconditions ?
         */
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
        let isLoggedIn = false
        
        /// Make the test fail at first
        XCTAssert(isLoggedIn == true)
    }
}
