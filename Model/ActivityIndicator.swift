//
//  ActivityIndicator.swift
//  fbase
//
//  Created by x7x.sa on 2018-06-30.
//  Copyright © 2018 x7x.sa. All rights reserved.
//

import UIKit

class ActivityIndicator: UIActivityIndicatorView {

     let activityView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    let view: UIView = UIView()
    
    func StartIndicator(Controller: UIViewController){
      
        activityView.center = Controller.view.center
        activityView.color = UIColor.blue
        
        activityView.startAnimating()
        Controller.view.addSubview(activityView)
    }
    
    func StopIndicator(Controller: UIViewController){
       
        activityView.stopAnimating()
      
    }
    
}
