//
//  Storybords.swift
//  fbase
//
//  Created by x7x.sa on 2018-06-30.
//  Copyright © 2018 x7x.sa. All rights reserved.
//

import UIKit

class Storybords: UIStoryboard {
    
   
    func tohomepaage(Controller: UIViewController){
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(withIdentifier: "tohomepage") as UIViewController
        
        Controller.present(secondViewController, animated: true, completion: nil)
    }
    
    func tomainpage(Controller: UIViewController){
        
        let main = Controller.storyboard?.instantiateViewController(withIdentifier: "main") as! ViewController
        
        Controller.navigationController?.pushViewController(main, animated: true)
    }

}
