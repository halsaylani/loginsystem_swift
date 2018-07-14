//
//  VlogViewController.swift
//  fbase
//
//  Created by x7x.sa on 2018-07-04.
//  Copyright © 2018 x7x.sa. All rights reserved.
//

import UIKit

class VlogViewController: UIViewController , UIImagePickerControllerDelegate , UINavigationControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        let addbutton = UIButton(type: .system)
        addbutton.setImage(UIImage(named: "google"), for: .normal )
        addbutton.addTarget(self, action: #selector(OpenCamera), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addbutton)

        // Do any additional setup after loading the view.
    }

     @objc func OpenCamera (){
        let imagepicker = UIImagePickerController()
        imagepicker.delegate = self
        imagepicker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            // camera source
            imagepicker.sourceType = .camera
            self.present(imagepicker, animated: true, completion: nil)
        }else{
            //else print
            print("camera not avalable")
        }
    }
    
    // implement image picker controller for photo library
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // store images in image variable from info array
     //   let image = info[UIImagePickerControllerOriginalImage] as? UIImage
        // save selected image in image view
       // imageview.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    // image picker cancelation
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
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
