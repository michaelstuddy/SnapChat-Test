//
//  SignInViewController.swift
//  SnapchatTest
//
//  Created by Michael Ruddy on 8/17/17.
//  Copyright © 2017 Michael Ruddy. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class SignInViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func signInTapped(_ sender: UIButton)
        
    {
        if (emailTextField.text != nil) && passwordTextField != nil {
            
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                
                print("hey we tried to sign in")
                
                if error != nil {
                    print("Hey we have an error: \(error)")
                    
                } else {
                    print("sign in succesfully")
                }
            }}
        
    }
}


