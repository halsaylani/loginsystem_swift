//
//  ViewController.swift
//  fbase
//
//  Created by x7x.sa on 2018-06-03.
//  Copyright © 2018 x7x.sa. All rights reserved.
//

import UIKit
import Firebase
import UserNotifications
import GoogleSignIn
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController  , GIDSignInUIDelegate , FBSDKLoginButtonDelegate  {
    
//    //sing in with facebook
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {

        if error != nil{
            print("error login fscebook")
        }
        //sing in with facebook
        print("login with facebook")

        //auth with database
        //let accessToken = FBSDKAccessToken.current().tokenString
        let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)

        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if  let error = error {
               print(error)
                return
            }
            print("auth saved")
           // ...
        }
    }

    //singout with facebook
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("login canceld")
    }
    
   
    
    @IBOutlet weak var emailtext: UITextField!
    @IBOutlet weak var passwordtext: UITextField!
    @IBOutlet weak var googlesingin: GIDSignInButton!
   
    //@IBOutlet weak var facebooklogin: FBSDKLoginButton!
    
    var textfield: UITextField!
    let user = User()
    let story = Storybords()
    let indicator = ActivityIndicator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // set up facebook buttom
        CustomFacebookButton()
        
        //google uiDelegate
        GIDSignIn.sharedInstance().uiDelegate = self
        
        // check if the user is alrady loggedin if so then to home page
        if UserDefaults.standard.bool(forKey: "isloggedin") == true {
            story.tohomepaage(Controller: self)
        }
        
        // Notification
        let content = UNMutableNotificationContent()
        content.title = "fbase"
        content.body = " new update need to be installed"
        
        let ex = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let req = UNNotificationRequest(identifier: "update", content: content, trigger: ex)
        
        UNUserNotificationCenter.current().add(req, withCompletionHandler: nil)
        
    } 
    
    @IBAction func GoogleSingin(_ sender: Any) {
        //making sure user sign out
        GIDSignIn.sharedInstance().signOut()
        //sign user in
        GIDSignIn.sharedInstance().signIn()
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
    
    func CustomFacebookButton(){
        
        let facebook = FBSDKLoginButton()
        // Optional: Place the button in the center of your view.
        facebook.delegate = self
        facebook.backgroundColor = UIColor.lightGray
        facebook.frame = CGRect(x: 60.0, y: 250.0, width: 139.0 , height: 46.0)
        //myLoginButton.center = view.center
        facebook.setTitle("Facebook", for: .normal)
        facebook.setImage(UIImage(named: "facebook"), for: .normal)
        facebook.setTitleColor(UIColor.black, for: .normal)
        // Add the button to the view
        view.addSubview(facebook)
    }

    
    
    // hidde keyboard when touch began
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
