//
//  TDDExampleTestsQuick.swift
//  TDDExampleTestsQuick
//
//  Created by Radim Halfar on 18.06.17.
//  Copyright © 2017 Inloop, s.r.o. All rights reserved.
//

import XCTest
import Quick
import Nimble

class UserLoginSpec: QuickSpec {

    override func spec() {
    
        /// Describe what are we going to test 
        
        describe("An user") {
            
            /// What are the conditions to test 
            
            context("After requesting login with valid credentials") {
            
                let isLoggedIn = false
            
                /// define expected outcome
                it("should be logged in") {
                
                    expect(isLoggedIn).to(beTrue())
                }
            }
        }
    }
}
