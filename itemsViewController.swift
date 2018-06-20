//
//  itemsViewController.swift
//  fbase
//
//  Created by x7x.sa on 2018-06-12.
//  Copyright © 2018 x7x.sa. All rights reserved.
//

import UIKit

class itemsViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var list = ["Profile","Version","logout"]
    
    @IBOutlet weak var tableview: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int{
        
        return 3
}

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "items") as! itemsTableViewCell
        
        if indexPath.section == 0{
            cell.label.text = list[0]
        }
        
        if indexPath.section == 1{
            cell.label.text = list[1]
        }
        
        if indexPath.section == 2{
          
           cell.label2.text = list[2]
        }
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
            print("you prssed \(list[indexPath.row]) " )
        
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
