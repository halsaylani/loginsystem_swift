//
//  EmailSettingTableViewController.swift
//  fbase
//
//  Created by x7x.sa on 2018-07-02.
//  Copyright © 2018 x7x.sa. All rights reserved.
//

import UIKit

class EmailSettingTableViewController: UIViewController {

    @IBOutlet weak var currentemail: UILabel!
    @IBOutlet weak var newemail: UITextField!
    
    let user = User()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        user.CurrentUserEmail(label: currentemail)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func save(_ sender: Any) {
    }
    

}
