//
//  UIViewController+.swift
//  EasyMath
//
//  Created by Federico Miguel Huguet Mack on 11/16/17.
//  Copyright © 2017 Federico Miguel Huguet Mack. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
