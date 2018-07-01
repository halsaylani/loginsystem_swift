//
//  itemsViewController.swift
//  fbase
//
//  Created by x7x.sa on 2018-06-12.
//  Copyright © 2018 x7x.sa. All rights reserved.
//

import UIKit
import Firebase

class itemsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableview: UITableView!
    
    var accountSec = ["Name","Email","Password"]
    var accountActionsSec = ["Log Out" ,"Acount Report", "Delete Acount"]
    
    let user = User()
    let story = Storybords()
    let alerts = Alert()
    let indicator = ActivityIndicator()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch (section) {
            //if section at 0 item length = 3
        case 0:
            return accountSec.count
           
        default:
              //if section at 1 item length = 1
            
            return accountActionsSec.count
        }
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int{
        //number of sections
        return 2
}

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //getting cell property as itemstableviewcell
        let cell = tableView.dequeueReusableCell(withIdentifier: "accountsec") as! itemsTableViewCell
        
        switch (indexPath.section) {
        case 0:
          
            cell.label.text = accountSec[indexPath.row]
        default:
            
            cell.backgroundColor = UIColor.white
            cell.label.textColor = UIColor.red
            cell.label.text = accountActionsSec[indexPath.row]
        }
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //section index 0
        if indexPath.section == 0 {
        
        switch (indexPath.row) {
            // index = 0
        case 0:
           self.alerts.OkAlerts(title: "will be.", message: "provided soon", Controller: self)
           // index = 1
        case 1:
              self.alerts.OkAlerts(title: "will be.", message: "provided soon", Controller: self)
              //default index = 2
        default:
               self.alerts.OkAlerts(title: "will be.", message: "provided soon", Controller: self)
        }
            
        }
        // section index 1
        if indexPath.section == 1 {
            
            switch (indexPath.row) {
        //default index = 0
                
            case 0:
                
              self.alerts.YesNoAlerts(title: "are you sure", message: " to logout", handler: {(UIAlertAction)in
                
               self.user.SingOutUser(Controller: self)
                
              }, Controller: self)
                
               
            case 1:
                
               self.alerts.OkAlerts(title: "Report Of your Account", message: "Will be Provided soon", Controller: self)
            default:
                
                self.alerts.YesNoAlerts(title: "Are your sure", message: "You want to Delete Your Account", handler: {(UIAlertAction)in
                    self.user.DeleteUserAccount(Controller: self)
                }, Controller: self)
            }
        }
    }
}
