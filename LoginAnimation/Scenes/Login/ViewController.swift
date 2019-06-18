//
//  ViewController.swift
//  LoginAnimation
//
//  Created by Michel Mazzoni on 18/06/19.
//  Copyright © 2019 Michel Mazzoni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var btnLoginCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var tfLogin: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    var login = "admin"
    var password = "admin"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewCenterConstraint.constant -= view.bounds.width
        btnLoginCenterConstraint.constant -= view.bounds.width
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut, animations: {
            self.viewCenterConstraint.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        
        UIView.animate(withDuration: 1.0, delay: 0.3, options: .curveEaseOut, animations: {
            self.btnLoginCenterConstraint.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
    }

    @IBAction func actionLoginTapped(_ sender: UIButton) {
        let theButton = sender
        let bounds = theButton.bounds
        
        if tfLogin.text?.isEmpty == true || !(tfLogin.text?.elementsEqual(login))! == true{
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
                theButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            }) { (success: Bool) in
                if success {
                    UIView.animate(withDuration: 0.3, animations: {
                        theButton.bounds = bounds
                        theButton.setTitle("Login incorrect", for: .normal)
                        self.btnLogin.backgroundColor = UIColor(red: 222/255.0, green: 3/255.0, blue: 52/255.0, alpha: 1.0)
                    })
                }
            }
            
        }else if tfLogin.text?.isEmpty == true || !(tfPassword.text?.elementsEqual(password))! == true {
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 10, options: .curveEaseOut, animations: {
                theButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            }) { (success: Bool) in
                if success {
                    UIView.animate(withDuration: 0.3, animations: {
                        theButton.bounds = bounds
                        theButton.setTitle("Password incorrect", for: .normal)
                        self.btnLogin.backgroundColor = UIColor(red: 222/255.0, green: 3/255.0, blue: 52/255.0, alpha: 1.0)
                    })
                }
            }
            
        }else {
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 10, options: .curveLinear, animations: {
                theButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            }) { (success: Bool) in
                if success {
                    UIView.animate(withDuration: 0.3, animations: {
                        theButton.bounds = bounds
                        theButton.setTitle("Login success", for: .normal)
                        self.btnLogin.backgroundColor = UIColor(red: 0/255.0, green: 140/255.0, blue: 80/255.0, alpha: 1.0)
                        self.performSegue(withIdentifier: "pushSuccessLogin", sender: nil)
                    })
                }
            }
            
        }
        
    }
}

