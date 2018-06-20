//
//  ViewController.swift
// fbase
//  Created by x7x.sa on 2018-06-03.
//  Copyright © 2018 x7x.sa. All rights reserved.
//

import UIKit
import Firebase
class ViewController: UIViewController {
    
    @IBOutlet weak var v: UIView!
    @IBOutlet weak var blur: UIVisualEffectView!
    
    
    @IBOutlet weak var emailtext: UITextField!
    
    @IBOutlet weak var passwordtext: UITextField!
    
    @IBOutlet weak var bt: UIButton!
    let activityView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blur.layer.cornerRadius = 10
        v.layer.cornerRadius = 10
        
        emailtext.layer.borderColor = UIColor.red.cgColor
        passwordtext.layer.cornerRadius = 10
        
        bt.layer.cornerRadius = 10
        
        
        
    
        // Do any additional setup after loading the view, typically from a nib.
        
        // check if the user is alrady loggedin if so then to home page
        if UserDefaults.standard.bool(forKey: "isloggedin") == true {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let secondViewController = storyboard.instantiateViewController(withIdentifier: "tohomepage") as UIViewController
            self.present(secondViewController, animated: false, completion: nil)
        }
    }
    
    @IBAction func auth(_ sender: Any) {
        // sign in authentication
        StartIndicator()
        Auth.auth().signIn(withEmail: emailtext.text!, password: passwordtext.text!, completion: {(user,error) in
            if error != nil{
                
                // if user not found error message show
                self.activityView.stopAnimating()
                self.ShowMessage(Message:"Can not find Email/Password")
                
            }else{
                // if auth go to home page
                
                self.activityView.stopAnimating()
                // set value to the user logged in
                UserDefaults.standard.set(true, forKey: "isloggedin")
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let secondViewController = storyboard.instantiateViewController(withIdentifier: "tohomepage") as UIViewController
                self.present(secondViewController, animated: true, completion: nil)
            }
        })
    }
    func StartIndicator(){
        activityView.center = self.view.center
        activityView.startAnimating()
        self.view.addSubview(activityView)
    }
    func ShowMessage(Message: String){
        
        let m = UIAlertController(title: "Message", message: Message, preferredStyle: .actionSheet)
        
        m.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(m, animated: true, completion: nil)
        
    }
    
}
