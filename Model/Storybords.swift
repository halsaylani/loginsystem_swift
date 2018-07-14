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
    
    
    func googlehomepage(window: UIWindow){
        let  board = UIStoryboard(name: "Main", bundle: nil)
        window.rootViewController = board.instantiateViewController(withIdentifier: "tohomepage")
    }
    
    func tomainpage(Controller: UIViewController){
        
        
        let main = Controller.storyboard?.instantiateViewController(withIdentifier: "main") as! ViewController
        
        Controller.navigationController?.pushViewController(main, animated: true)
    }
    
    func tonamesetting(Controller: UIViewController){
        
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let namesetting = storyboard.instantiateViewController(withIdentifier: "namesetting") as UIViewController
        Controller.navigationController?.pushViewController(namesetting, animated: true)
        
    }
    func toemailsetting(Controller: UIViewController){
        
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let emailsetting = storyboard.instantiateViewController(withIdentifier: "emailsetting") as UIViewController
        Controller.navigationController?.pushViewController(emailsetting, animated: true)
        
    }
    func topasswordsetting(Controller: UIViewController){
        
         let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let passwordsetting = storyboard.instantiateViewController(withIdentifier: "passwordsetting") as UIViewController
        Controller.navigationController?.pushViewController(passwordsetting, animated: true)
        
    }

}
