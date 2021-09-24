//
//  SignUpViewController.swift
//  DEViOS
//
//  Created by Kyle Franklin on 9/23/21.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
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
        LoginButton.styleTextField(firstNameTextField)
        LoginButton.styleTextField(lastNameTextField)
        LoginButton.styleTextField(emailTextField)
        LoginButton.styleTextField(passwordTextField)
        LoginButton.styleFilledButton(signUpButton)
    }
    
    func validateFields() -> String? {
        
        // CHECK THAT ALL FIELDS ARE FILLED IN
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        // CHECK IF THE PASSWORD IS SECURE
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if LoginButton.isPasswordValid(cleanedPassword) == false {
            //PASSWORD ISNT SECURE ENOUGH
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        return nil
    }

    @IBAction func signUpTapped(_ sender: Any) {
        
        // VALIDATE THE FIELDS
        let error = validateFields()
        
        if error != nil {
            
            // THERE'S SOMETHING WRONG WITH THE FIELD, SHOW ERROR MESSAGE
            showError(error!)
        }
        else {
            
            // CREATE CLEAN VERSIONS OF THE DATA
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // CREATE THE USER
            Auth.auth().createUser(withEmail: email , password: password) { (result, err) in
                
                // CHECK FOR ERROR
                if err != nil {
                    // THERE WAS AN ERROR CREATING THE USER
                    self.showError("Error creating user")
                }
                else {
                    
                    // USER WAS CREATED SUCCESSFULLY, NOW STORE TEH FIRST AND LAST NAME
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName, "uid": result!.user.uid ]) { error in
                        
                        if error != nil {
                            // SHOW ERROR MESSAGE
                            self.showError("Error saving user data")
                        }
                    }
                    //TRANSITION TO THE HOME SCREEN
                    self.transisitionToHome()
                    
                }
            }
            
            
        }
        
    }
    
    func showError(_ message:String) {
        
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transisitionToHome() {
        
        let homeViewController =
        storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }

}
