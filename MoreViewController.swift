//
//  TableViewController.swift
//  FirebaseAuth
//
//  Created by x7x.sa on 2018-06-08.
//

import UIKit

class TableViewController: UITableViewController {
    
    
    
    
    let list = ["cat","monky"]
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
   
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
     
        return list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        // Configure the cell...
        //set the text on the row by the array list
        
            cell.textLabel?.text = list[indexPath.row]
        
        
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

/*
 
 //
 //  SettingTableViewController.swift
 //  fbase
 //
 //  Created by x7x.sa on 2018-06-11.
 //  Copyright © 2018 x7x.sa. All rights reserved.
 //
 
 import UIKit
 
 class SettingTableViewController: UITableViewController {
 
 var profile = "Profile"
 let version = "Version"
 let logout = "Logout"
 
 let list = ["Profile","Version"]
 
 
 
 
 override func viewDidLoad() {
 super.viewDidLoad()
 
 // Uncomment the following line to preserve selection between presentations
 // self.clearsSelectionOnViewWillAppear = false
 
 // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
 // self.navigationItem.rightBarButtonItem = self.editButtonItem
 }
 
 override func didReceiveMemoryWarning() {
 super.didReceiveMemoryWarning()
 // Dispose of any resources that can be recreated.
 }
 
 // MARK: - Table view data source
 
 override func numberOfSections(in tableView: UITableView) -> Int {
 // #warning Incomplete implementation, return the number of sections
 return 2
 }
 
 override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 // #warning Incomplete implementation, return the number of rows
 return 1
 }
 
 
 override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 
 let cell = tableView.dequeueReusableCell(withIdentifier: "items", for: indexPath)
 
 // Configure the cell...
 
 if indexPath.section == 0 {
 cell.textLabel?.text = profile
 }
 if indexPath.section == 1{
 cell.textLabel?.text = version
 
 }
 
 return cell
 }
 
 //        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 //
 //            if indexPath.row == 0{
 //
 //                 ShowMessage(Message: profile)
 //            }
 //
 //            if indexPath.row == 1{
 //
 //                ShowMessage(Message: version)
 //            }
 //    }
 
 
 func ShowMessage(Message: String){
 
 let alert = UIAlertController(title: "pressed", message: Message, preferredStyle: .actionSheet)
 
 alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
 
 self.present(alert, animated: true, completion: nil)
 
 
 }
 
 
 /*
 // Override to support conditional editing of the table view.
 override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the specified item to be editable.
 return true
 }
 */
 
 /*
 // Override to support editing the table view.
 override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
 if editingStyle == .delete {
 // Delete the row from the data source
 tableView.deleteRows(at: [indexPath], with: .fade)
 } else if editingStyle == .insert {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */
 
 /*
 // Override to support rearranging the table view.
 override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
 
 }
 */
 
 /*
 // Override to support conditional rearranging of the table view.
 override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
 // Return false if you do not want the item to be re-orderable.
 return true
 }
 */
 
 /*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */
 
 }

 
 */
