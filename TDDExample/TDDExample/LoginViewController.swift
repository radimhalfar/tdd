//
//  ViewController.swift
//  TDDExample
//
//  Created by Radim Halfar on 18.06.17.
//  Copyright © 2017 Inloop, s.r.o. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    
    var viewModel: LoginViewModel?
    
    var invalidInputClosure: InvalidInputClosure!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.isEnabled = false
        
        invalidInputClosure = { errors in
            
            guard let errors = errors as? [TDDError] else {
                self.cleanErrorStatus()
                return
            }
            
            for error in errors {
                debugPrint("Validation error \(error.localizedDescription)")
                self.updateUI(for: error)
            }
        }
        
        viewModel = LoginViewModel(invalidInputClosure: invalidInputClosure, controller: self)
    }
    
    func cleanErrorStatus() {
        userNameTextField.markValid()
        passwordTextField.markValid()
        loginButton.isEnabled = true
    }
    
    func updateUI(for error: TDDError) {
        
        loginButton.isEnabled = false
        
        switch error.code {
        case Errors.invalidEmail.code, Errors.invalidEmailLength.code:
            userNameTextField.markInvalid()
        case Errors.invalidPassword.code, Errors.invalidPasswordLength.code:
            passwordTextField.markInvalid()
        default:
            userNameTextField.markValid()
            passwordTextField.markValid()
        }
    }

    @IBAction func performLogin(_ sender: Any) {
        
        viewModel?.performLogin { [weak self] error in
            self?.showSafeAlert(with: "Login error", message: error.localizedDescription, cancelButtonText: "OK")
        }
    }
}

extension LoginViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        cleanErrorStatus()
        viewModel?.updateValuesFor(username: userNameTextField.text, password: passwordTextField.text)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        cleanErrorStatus()
        viewModel?.updateValuesFor(username: userNameTextField.text, password: passwordTextField.text)
    }
}


