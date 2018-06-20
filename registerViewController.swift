//
//  registerViewController.swift
//  fbase
//
//  Created by x7x.sa on 2018-06-04.
//  Copyright © 2018 x7x.sa. All rights reserved.
//

import UIKit
import Firebase
class registerViewController: UIViewController {

    @IBOutlet weak var v: UIView!
    @IBOutlet weak var nametext: UITextField!
    @IBOutlet weak var emailtext: UITextField!
    @IBOutlet weak var passwordtext: UITextField!
    
    var error: String!
    
      let activityView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submit(_ sender: Any) {
    
        // registeration rules
        StartIndicator()
        if (nametext.text == "" || emailtext.text == "" || passwordtext.text == "") {
            activityView.stopAnimating()
            ShowMessage(Message: "املئ جميع الحقول")
        
        }else{
            
            let user = Database.database().reference().child("Users")
            //inserting data
            let userinfo: NSDictionary = ["Name": nametext.text! , "Email": emailtext.text! , "Password": passwordtext.text! ]
            
            //insert data
            user.childByAutoId().setValue(userinfo){
                //if error
              
                (error,user) in
                if error != nil{
                    self.activityView.stopAnimating()
                    self.ShowMessage(Message: "email alrady in database")
                    
                }else{
                
                    //creat authintcation for login
                    Auth.auth().createUser(withEmail: self.emailtext.text!, password: self.passwordtext.text!, completion: {
                        
                        (error ,user) in
                        if error != nil{
                            // message should print
                              self.activityView.stopAnimating()
                            self.ShowMessage(Message: "تم التسجيل بنجاح")
                            
                        }else{
                            self.activityView.stopAnimating()
                             self.ShowMessage(Message: "تم التسجيل بنجاح")
                            
                        }
                    }
                    )
                }
                
            }
        }
        
    }
    
    // ShowMessage for error handlling
    func ShowMessage(Message: String){
        
        let m = UIAlertController(title: "Message", message: Message, preferredStyle: .actionSheet)
        
        m.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(m, animated: true, completion: nil)
    
    }
    // show indecater animation
    func StartIndicator(){
        
        activityView.center = self.view.center
        
       UIView.animate(withDuration: 1, animations: {
        
       }
        , completion: nil)
       
        activityView.startAnimating()
        self.view.addSubview(activityView)
    }
}
