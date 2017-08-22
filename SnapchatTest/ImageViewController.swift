//
//  ImageViewController.swift
//  SnapchatTest
//
//  Created by Michael Ruddy on 8/21/17.
//  Copyright © 2017 Michael Ruddy. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
class ImageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
  
    @IBOutlet weak var nextButton: UIButton!
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imagePicker.delegate = self
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        
        imageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)
    }

    @IBAction func cameraTapped(_ sender: Any) {
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.allowsEditing = false
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        nextButton.isEnabled = false
        
        
        NSUUID().uuidString
        let imagesFolder = Storage.storage().reference().child("images")
        let imageData = UIImageJPEGRepresentation(imageView.image!, 0.1)!
        imagesFolder.child("\(NSUUID().uuidString).jpg").putData(imageData, metadata: nil, completion: {(metadata,error) in
            print("we tried to upload")
            if error != nil {
                print("we have an error:\(error)")
            } else {
                print(metadata?.downloadURLs)
                self.performSegue(withIdentifier: "selectuserSegue", sender: nil)
            }
        })

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           }
}
