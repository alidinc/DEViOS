//
//  LoginViewController.swift
//  DEViOS
//
//  Created by Kyle Franklin on 9/23/21.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
    }
    
    func setUpElements() {
        
        // HIDE THE ERROR LABEL
        errorLabel.alpha = 0
        
        // STYLE THE ELEMENTS
        
        LoginButton.styleTextField(emailTextField)
        LoginButton.styleTextField(passwordTextField)
        LoginButton.styleFilledButton(loginButton)
        
    }
    
   
    @IBAction func loginButtonTapped(_ sender: Any) {

        // VALIDATE TEXT FIELDS
        
        //CREATE CLEANED VERSION OF THE TEXT FIELD
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // SIGNING IN THE USER
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // COULDNT SIGN IN
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else {
                
                let homeViewController =
                self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
                
            }
        }
    }
}
