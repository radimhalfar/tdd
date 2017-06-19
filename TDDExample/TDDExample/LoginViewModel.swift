//
//  LoginViewModel.swift
//  TDDExample
//
//  Created by Radim Halfar on 18.06.17.
//  Copyright © 2017 Inloop, s.r.o. All rights reserved.
//

import UIKit

typealias InvalidInputClosure = (_ errors: [Error]?) -> ()

/// Uses UserService and UserServiceValidator
class LoginViewModel {
    
    private var username: String? {
        didSet {
            generateValidatedUser()
        }
    }
    
    private var password: String? {
        didSet {
            generateValidatedUser()
        }
    }
    
    private weak var controller: UIViewController?
    
    private var invalidInputClosure: InvalidInputClosure
    
    init(invalidInputClosure: @escaping InvalidInputClosure, controller: UIViewController) {
        self.invalidInputClosure = invalidInputClosure
        self.controller = controller
    }
    
    func updateValuesFor(username: String?, password: String?) {
        self.username = username
        self.password = password
    }
    
    func performLogin(_ errorClosure: @escaping (_ error: Error) -> ()) {
        
        guard let user = generateValidatedUser() else {
            return
        }
    
        UserService.login(user: user) { [weak self] (status, error) in
            if let error = error {
                errorClosure(error)
            } else {
                /// Success - navigate to next view
                DispatchQueue.main.async {
                    self?.controller?.performSegue(withIdentifier: "GoToMainMenu", sender: self?.controller)
                }
            }
        }
    }
    
    @discardableResult
    func generateValidatedUser() -> User? {
        guard let filledUserName = username, let filledPassword = password else {
            invalidInputClosure([NSError(domain: "User login", code: 401, userInfo: [NSLocalizedDescriptionKey: "Fill all the inputs"])])
            return nil
        }
        
        let user = User(userName: filledUserName, password: filledPassword)
        
        if let errors = UserServiceValidator.validateLogin(user) {
            invalidInputClosure(errors)
            return nil
        }
        
        return user
    }
}
