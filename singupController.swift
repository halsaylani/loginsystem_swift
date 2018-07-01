//
//  registerViewController.swift
//  fbase
//
//  Created by x7x.sa on 2018-06-04.
//  Copyright © 2018 x7x.sa. All rights reserved.
//

import UIKit
import Firebase


class registerViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    
    @IBOutlet weak var blur: UIVisualEffectView!
    @IBOutlet weak var nametext: UITextField!
    @IBOutlet weak var emailtext: UITextField!
    @IBOutlet weak var passwordtext: UITextField!
    @IBOutlet weak var imageview: UIImageView!
    
    let user = User()
    
    var error: String!
    let activityView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        blur.layer.cornerRadius = 10
        
        // allow user iteraction once imageview taped
        imageview.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSlectedImage)))
        imageview.isUserInteractionEnabled = true
        imageview.layer.cornerRadius = 20
    }
    
    @objc func handleSlectedImage(){
        
        // store image in imagepicker variable
        let imagepicker = UIImagePickerController()
        imagepicker.delegate = self
        imagepicker.allowsEditing = true
        
        
        // alert message
        let alert = UIAlertController(title: "Image Source", message: "Choose Source", preferredStyle: .actionSheet)
        
        // access to photo ;ibrary
        let photolibrary = UIAlertAction(title: "Photo Library", style: .default, handler: {(Action:UIAlertAction) in
            
            //library source
            imagepicker.sourceType = .photoLibrary
            self.present(imagepicker, animated: true
                , completion: nil)
            
        })
        
        // access to camera
        let camera = UIAlertAction(title: "Camera", style: .default, handler: {(UIAlertAction) in
            
            // is camera avalable then action
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                
                // camera source
                imagepicker.sourceType = .camera
                self.present(imagepicker, animated: true, completion: nil)
            }else{
                //else print
                print("camera not avalable")
            }
        })
        
        // cancel action
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        // add properties of actions
        alert.addAction(photolibrary)
        alert.addAction(camera)
        alert.addAction(cancel)
        self.present(alert, animated: true
            , completion: nil
        )
        
    }
    
    
    // implement image picker controller for photo library
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        // store images in image variable from info array
        let image = info[UIImagePickerControllerEditedImage] as? UIImage
        // save selected image in image view
        imageview.image = image
        picker.dismiss(animated: true, completion: nil)
    }
    
    // image picker cancelation
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    // save data in firbase
    @IBAction func submit(_ sender: Any) {
        
        guard let name = nametext.text , let email = emailtext.text , let password = passwordtext.text else{
            print("form not complited")
            return
        }
        
        
        user.CreateUserAuth(name: name, email: email, password: password , Controller: self)
            
    }
    // hidde keyboard when touched began
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

//                        // store image in storage
//                        let imageid = UUID().uuidString
//
//                        let stRef = Storage.storage().reference().child("UsersImages").child("\(imageid).png")
//
//                        if let dataimages = UIImagePNGRepresentation(self.imageview.image!){
//
//                            stRef.putData(dataimages, metadata: nil, completion: {(metadata, error)in
//
//
//                                if error != nil{
//                                   self.ShowMessage(Message: "error loading the image")
//                                    return
//                                }
//
//                                    print(metadata)
//
//
//                            })
//
//                        }

