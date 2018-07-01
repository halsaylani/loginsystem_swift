//
//  homeViewController.swift
//  fbase
//
//  Created by x7x.sa on 2018-06-05.
//  Copyright © 2018 x7x.sa. All rights reserved.
//

import UIKit
import Firebase
class homeViewController: UIViewController {
    
    @IBOutlet weak var welcome: UILabel!
    
    @IBOutlet weak var constrain: NSLayoutConstraint!

    @IBOutlet weak var clear: UIButton!
    
    @IBOutlet weak var manuview: UIView!
    
    
    var users = [User]()
    
    
    
//    @IBOutlet weak var blurview: UIVisualEffectView!
//    @IBOutlet weak var menuview: UIView!
    
    var ishedden = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // hide view
       constrain.constant = -170
        
      
         //currentuser()
        
    }
   
    @IBAction func clear(_ sender: Any) {
        
        if ishedden  {
         
            
            
            UIView.animate(withDuration: 0.3, animations: {
                self.constrain.constant = -170
                self.view.layoutIfNeeded()
            })
        }else {
            
           
            UIView.animate(withDuration: 0.3, animations: {
                self.constrain.constant = 0
                
                self.view.layoutIfNeeded()
            })
        }
    }
    @IBOutlet weak var n: UINavigationItem!
    
    @IBAction func showmenun(_ sender: UIBarButtonItem) {
        
        if ishedden  {
           
            UIView.animate(withDuration: 0.3, animations: {
                 self.constrain.constant = 0
                
                 self.view.layoutIfNeeded()
                })
          
        }else {
           
            UIView.animate(withDuration: 0.3, animations: {
                self.constrain.constant = -170
                 self.view.layoutIfNeeded()
                })
        }
        ishedden = !ishedden
    
    }
    
//    @IBAction func allnames(_ sender: Any) {
//
//        let rf = Database.database().reference().child("Users")
//
//        rf.observe(.childAdded, with: {(snapshot)in
//            if  let  values = snapshot.value as? [String: AnyObject]{
//
//                let user = Users()
//
//
//                
//                user.Name = values["Name"] as! String
//                user.Email = values["Email"] as! String
//                user.Password = values["Password"] as! String
//
//
//                print(user.Password as Any , user.Name as Any, user.Email as Any )
//            }
//
//
//
//        })
//
//
//
//
//    }
//    func currentuser() {
//        let userid = Auth.auth().currentUser?.uid
//
//        let rf = Database.database().reference().child("Users").child(userid!)
//        rf.observeSingleEvent(of: .value, with: {(snapshot)in
//
//            let value = snapshot.value as? [String: AnyObject]
//            let name = value!["Name"] as? String
//           self.welcome.text = name
//
//        })
//
//
//    }
    
    func ShowMessage(Message: String){
        
        let m = UIAlertController(title: "Message", message: Message, preferredStyle: .actionSheet)
        
        m.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(m, animated: true, completion: nil)
    }
}
