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
    
    @IBOutlet weak var signorregister: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func signInTapped(_ sender: UIButton)
        
    { if signorregister.selectedSegmentIndex == 0  {
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text! , completion: { (user, error) in
            
            print("hey we tried to sign in")
            if user == nil
            { print("user not found boi")
            }
            
            if error != nil {
                print("Hey we have an error: \(error!)")
            }
            else {
                self.performSegue(withIdentifier: "signinsegue", sender: nil)
            }
        }
        )
    } else {
        
        
        Auth.auth().createUser(withEmail: self.emailTextField.text!, password: self.passwordTextField.text!, completion: { (user, error) in
            
            print("We tried to create a user")
            
            if error != nil {
                print("yo we have an error: \(error!)")
            } else {
                print("created User succesfully")
                self.performSegue(withIdentifier: "signinsegue", sender: nil)
            }
        })
        
        }//hhhh
        
        
    }
    
    
}
