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
    
    
    @IBOutlet weak var constrain: NSLayoutConstraint!
    @IBOutlet weak var blurview: UIVisualEffectView!
    @IBOutlet weak var menuview: UIView!
    
    var ishedden = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blurview.layer.cornerRadius = 10
        menuview.layer.shadowColor = UIColor.black.cgColor
       // constrain.constant = -247
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logout(_ sender: UIButton) {
        

        do {
            
            try Auth.auth().signOut()
            UserDefaults.standard.set(false, forKey: "isloggedin")
            let main = self.storyboard?.instantiateViewController(withIdentifier: "main") as! ViewController
            
            self.navigationController?.pushViewController(main, animated: true
            )
        } catch {
            ShowMessage(Message: "error while logging out")
        }
        
    }
    
    @IBAction func showmenun(_ sender: UIBarButtonItem) {
        
        if ishedden {

            UIView.animate(withDuration: 1, animations: {
                self.menuview.isHidden = false
            }, completion: nil)


        }else {
            UIView.animate(withDuration: 1, animations: {
                self.menuview.isHidden = true
            }, completion: nil)

        }
        ishedden = !ishedden
        

    }
    
    
    func ShowMessage(Message: String){
        
        let m = UIAlertController(title: "Message", message: Message, preferredStyle: .actionSheet)
        
        m.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(m, animated: true, completion: nil)
        
    }
    
}

