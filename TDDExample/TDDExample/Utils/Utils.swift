//
//  Utils.swift
//  TDDExample
//
//  Created by Radim Halfar on 18.06.17.
//  Copyright © 2017 Inloop, s.r.o. All rights reserved.
//

import UIKit

extension String {

    var isValidEmail:  Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    
    var isValidPassword: Bool {
        let passwordRegex = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$"
        
        let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
        return passwordTest.evaluate(with: self)
    }
}

extension UITextField {
    
    func markInvalid() {
    
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 2.0
    }
    
    func markValid() {
        self.layer.borderWidth = 0.0
        self.layer.borderColor = UIColor.clear.cgColor
    }
}

extension UIViewController {
    
    func showSafeAlert(with title: String, message: String, cancelButtonText: String) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: cancelButtonText, style: .cancel, handler: nil))
        
        DispatchQueue.main.async {
            self.present(controller, animated: true, completion: nil)
        }
    }
}
