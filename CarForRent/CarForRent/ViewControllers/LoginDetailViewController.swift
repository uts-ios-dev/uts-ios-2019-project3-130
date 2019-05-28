//
//  LoginDetailViewController.swift
//  CarForRent
//
//  Created by Yuanxi Zeng on 23/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import UIKit

class LoginDetailViewController: UIViewController, UITextFieldDelegate {
    
    // Input text of username
    @IBOutlet weak var username: UITextField!
    // Input text of password
    @IBOutlet weak var password: UITextField!
    // Labels & buttons
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var passLabel: UILabel!
    @IBOutlet weak var Login: UIButton!
    @IBOutlet weak var GoBack: UIButton!
    // Background image
    @IBOutlet var Bgd: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        username.delegate = self
        password.delegate = self
        Bgd.image = UIImage(named: "log-in.jpg")?.alpha(0.5)
        customizeLabel(userLabel)
        customizeLabel(passLabel)
        customizeButton(Login)
        customizeButton(GoBack)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // Hide keyboard when user touches outside the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func usernameReturn(_ textField: UITextField) -> Bool {
        username.resignFirstResponder()
        return true
    }
    
    func passwordReturn(_ textField: UITextField) -> Bool {
        password.resignFirstResponder()
        return true
    }
    
    @IBAction func GoBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        // Check in prepare segue func
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "GoToMainFromLogin") {
            let userText = username.text
            let passText = password.text
            
            if(userText!.isEmpty || passText!.isEmpty) {
                alertMessage("Password and Username cannot be emtpy.")
                return
            }
        }
    }
    
    func alertMessage(_ message: String) {
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAction)
        self.present(alert, animated: true, completion: nil)
    }
 
    func customizeLabel(_ label: UILabel) {
        label.font = UIFont(name: "AmericanTypewriter-Bold", size: 24)
        label.backgroundColor = UIColor.darkGray
        label.textColor = UIColor.white
        label.layer.cornerRadius = 20
    }
    
    func customizeButton(_ button: UIButton) {
        button.backgroundColor = UIColor.black
        button.titleLabel?.font = UIFont(name: "AvenirNext-DemiBole",size: 20)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 3.0
    }
}
