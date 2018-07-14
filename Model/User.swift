//
//  User.swift
//  fbase
//
//  Created by x7x.sa on 2018-06-30.
//  Copyright © 2018 x7x.sa. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn

class User: NSObject {
    
    var Name: String = ""
    var Email: String = ""
    var Password: String = ""
    
   
    let story = Storybords()
    let alerts = Alert()
    let indicator = ActivityIndicator()
    
    // User auth function (sign in)
    func auth(email: String, pass: String, Controller: UIViewController) {
        
         //Activity indicator start
         self.indicator.StartIndicator(Controller: Controller)
        // sign in authentication
        Auth.auth().signIn(withEmail: email, password: pass, completion: {(user,error) in
            if error != nil{
                
                self.indicator.StopIndicator(Controller: Controller)
                // if user not found error message show
              self.alerts.OkAlerts(title: "Error", message: "Email/Password Do not match", Controller: Controller)
                
            }else{
                
                self.indicator.StopIndicator(Controller: Controller)
                // set value to the user logged in
                UserDefaults.standard.set(true, forKey: "isloggedin")
                // to home page
               self.story.tohomepaage(Controller: Controller)
            }
        })
    }
    
    // User send reset password
    func SendPasswordReset(email: String , Controller: UIViewController){
        //Activity indicator start
        self.indicator.StartIndicator(Controller: Controller)
        
        Auth.auth().sendPasswordReset(withEmail: email, completion: {
            error in
            if error != nil{
                //Activity indicator stop
                self.indicator.StopIndicator(Controller: Controller)
                //Show message
                self.alerts.OkAlerts(title: "Reset faild", message: "Email does not match", Controller: Controller)
            }else{
                //Activity indicator stop
                self.indicator.StopIndicator(Controller: Controller)
                 //Show message
                 self.alerts.OkAlerts(title: "email sent", message: "Check your Email", Controller: Controller)
            }
            
        })
    }
    
    //Creat User Auth (sign up)
    func CreateUserAuth(name: String, email: String, password: String , Controller: UIViewController){
        
        //Activity indicator start
        self.indicator.StartIndicator(Controller: Controller)
        Auth.auth().createUser(withEmail: email, password: password, completion: {
            
            (user , error) in
            if error != nil{
                //Activity indicator stop
                self.indicator.StopIndicator(Controller: Controller)
                // Show error message
               self.alerts.OkAlerts(title: "error", message: "error while regestring", Controller: Controller)
                
            }else{
                
                //Create User in database
                self.CreateUserDB(name: name, email: email, password: password)
                //Activity indicator stop
                self.indicator.StopIndicator(Controller: Controller)
                // go to Main page
                self.story.tomainpage(Controller: Controller)
                //Show succssfullu register
                self.alerts.OkAlerts(title: "Register", message: "succssfully registered", Controller: Controller)
                
            }
            
        })
        
    }
    
    //Create User Database
    func CreateUserDB(name: String, email: String, password: String){
        
        let user2 = Auth.auth().currentUser
        
        guard let uid = user2?.uid else {
            return
        }
        //insert user information into Users db
        let user = Database.database().reference().child("Users").child(uid)
        //inserting data
        let userinfo: NSDictionary = ["Name": name , "Email": email , "Password": password]
        
        //insert data
        user.setValue(userinfo)
    }
    
    //Sing User Out
    func SingOutUser(Controller: UIViewController){
        
        // try To sing user out
        do {
            //sign out with google
            GIDSignIn.sharedInstance().signOut()
            try Auth.auth().signOut()
            // userdefult to false
            UserDefaults.standard.set(false, forKey: "isloggedin")
            // to main page
           self.story.tomainpage(Controller: Controller)
            
        } catch {
            //Show error message
            self.alerts.OkAlerts(title: "Can not logout", message: "Refresh your Account", Controller: Controller)
        }
    }
    
    //Delete User account
    func DeleteUserAccount(Controller: UIViewController){
        
        //Activity indicator start
        self.indicator.StartIndicator(Controller: Controller)
        
          let CurrentUser = Auth.auth().currentUser
        CurrentUser?.delete(completion: {(error)in
            
            if error != nil {
                //Activity indicator stop
                self.indicator.StopIndicator(Controller: Controller)
                
                self.alerts.OkAlerts(title: "error", message: "while deletting your account", Controller: Controller)
            }
            
            UserDefaults.standard.set(false, forKey: "isloggedin")
            //Activity indicator stop
            self.indicator.StopIndicator(Controller: Controller)
            
            self.story.tomainpage(Controller: Controller)
            self.alerts.OkAlerts(title: "Account", message: "has been deleted", Controller: Controller)
        })
        
    }
    
    // auth with google
    func SocialAuth( Credential: AuthCredential , window: UIWindow){
        
       
        
        
        Auth.auth().signInAndRetrieveData(with: Credential) { (authResult, error) in
            if let error = error {
                // ...
                print(error)
                return
            }
            // to home page after user auth in firbase
           print("home")
            self.story.googlehomepage(window: window)
        }
        
        
    }
    
    //get current user name by passing a textfield
    func CurrentUserName(textfield: UITextField){
                let userid = Auth.auth().currentUser?.uid
        
               let rf = Database.database().reference().child("Users").child(userid!)
               rf.observeSingleEvent(of: .value, with: {(snapshot)in
       
                    let value = snapshot.value as? [String: AnyObject]
                 let name = value!["Name"] as! String
                textfield.text = name
              })
           }
    
    //get current user email
    func CurrentUserEmail(label: UILabel){
                    let user = Auth.auth().currentUser
            if let user = user {
                    let email = user.email
                    label.text = email
                }
        
            }
    
}

