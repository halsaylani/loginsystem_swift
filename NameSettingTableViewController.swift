//
//  SettingTableViewController.swift
//  fbase
//
//  Created by x7x.sa on 2018-07-02.
//  Copyright © 2018 x7x.sa. All rights reserved.
//

import UIKit
import Firebase
class NameSettingTableViewController: UIViewController {
    
    
    @IBOutlet weak var currentname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    
    let user = User()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //set the user current name in the textfiled
        user.CurrentUserName(textfield: self.currentname)
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // save info after changes
    @IBAction func save(_ sender: Any) {
        
    }
        
    
    
}
