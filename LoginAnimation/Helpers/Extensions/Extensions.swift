//
//  Extensions.swift
//  RickAndMortyAPI
//
//  Created by Michel Mazzoni on 14/11/18.
//  Copyright © 2018 Michel Mazzoni. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

extension UIView {
    
    func requiredAnimation() {
        self.alpha = 0
        UIView.animate(withDuration: 0.3, delay: 0.0, options: [.repeat, .autoreverse], animations: {
            UIView.setAnimationRepeatCount(3)
            self.alpha = 1
        }, completion: nil)
    }
    
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    @IBInspectable var cornerRadius: Double {
        get {
            return Double(self.layer.cornerRadius)
        }
        set {
            self.layer.cornerRadius = CGFloat(newValue)
        }
    }
    
    
    @IBInspectable var borderWidth: Double {
        get {
            return Double(self.layer.borderWidth)
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    func rotate(angle: CGFloat) {
        let radians = angle / 180.0 * CGFloat.pi
        let rotation = self.transform.rotated(by: radians)
        self.transform = rotation
    }
}

extension UITextField {
    func isEmpty(animate: Bool = false) -> Bool {
        let empty = self.text?.count == 0
        if animate == true && empty == true {
            self.requiredAnimation()
        }
        return empty
    }
    
    @IBInspectable var placeholderColor: UIColor? {
        get {
            return self.placeholderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(
                string: self.placeholder != nil ? (self.placeholder)! : "",
                attributes: [NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}
