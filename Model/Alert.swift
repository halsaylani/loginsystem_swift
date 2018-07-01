//
//  Alert.swift
//  fbase
//
//  Created by x7x.sa on 2018-06-30.
//  Copyright © 2018 x7x.sa. All rights reserved.
//

import UIKit

class Alert: UIAlertController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // Defult alerts with ok action
    func OkAlerts (title: String , message: String , Controller: UIViewController){
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(ok)
        Controller.present(alert, animated: true, completion: nil)
    }
    
    func YesNoAlerts(title: String , message: String , handler: ((UIAlertAction) -> Swift.Void)? = nil , Controller: UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        let yes = UIAlertAction(title: "yes", style: .default, handler: handler)
        
        let no = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        alert.addAction(yes)
        alert.addAction(no)
        Controller.present(alert, animated: true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
