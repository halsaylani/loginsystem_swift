//
//  ViewController.swift
//  fbase
//
//  Created by x7x.sa on 2018-06-03.
//  Copyright © 2018 x7x.sa. All rights reserved.
//

import UIKit
import Firebase
import SystemConfiguration

class ViewController: UIViewController {
    
    @IBOutlet weak var v: UIView!
    @IBOutlet weak var blur: UIVisualEffectView!
    @IBOutlet weak var emailtext: UITextField!
    @IBOutlet weak var passwordtext: UITextField!
    @IBOutlet weak var bt: UIButton!
    var textfield: UITextField!
    
    let user = User()
    let story = Storybords()
    let indicator = ActivityIndicator()
    
    
    let activityView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        blur.layer.cornerRadius = 10
        v.layer.cornerRadius = 10
        
        emailtext.layer.borderColor = UIColor.red.cgColor
        passwordtext.layer.cornerRadius = 10
        
        bt.layer.cornerRadius = 10
        
        // check if the user is alrady loggedin if so then to home page
        
        if UserDefaults.standard.bool(forKey: "isloggedin") == true {
            
            story.tohomepaage(Controller: self)
        }
    } 
    
    @IBAction func auth(_ sender: Any) {
       
        user.auth(email: emailtext.text!, pass: passwordtext.text! ,Controller: self)
    }
    
    
    @IBAction func ResetPassword(_ sender: Any) {
        
         let alert = UIAlertController(title: "Reset Password", message: "Enter your email", preferredStyle: .alert)
        
        
        alert.addTextField(configurationHandler: {(textfield)-> Void in
            
            
          textfield.placeholder = "your email"
            
        })
       
        let send = UIAlertAction(title: "Send", style: .default, handler:{ (action)in
            
            let email = alert.textFields?.first?.text
            
            // reset password by Email
            self.user.SendPasswordReset(email: email! , Controller: self)
            
        })
            
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(send)
        alert.addAction(cancel)
        self.present(alert,animated: true)
    }
    
    // hidde keyboard when touch began
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
