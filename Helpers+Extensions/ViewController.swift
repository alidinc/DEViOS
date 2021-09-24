//
//  ViewController.swift
//  DEViOS
//
//  Created by Kyle Franklin on 9/23/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpLabel: UILabel!
    @IBOutlet weak var defLabel: UILabel!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpElements()
    }

    func setUpElements() {
        
        LoginButton.styleFilledButton(signUpButton)
        LoginButton.styleHollowButton(loginButton)
    }
}
