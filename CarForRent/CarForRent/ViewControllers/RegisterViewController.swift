//
//  RegisterViewController.swift
//  CarForRent
//
//  Created by Yuanxi Zeng on 23/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import UIKit

class registerViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var addressText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var repPassText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        firstName.delegate = self
        lastName.delegate = self
        emailText.delegate = self
        addressText.delegate = self
        phoneText.delegate = self
        passText.delegate = self
        repPassText.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func GoBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        // Check in prepare for segue func
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "GoToMainViewFromRegister"){
            let fName = firstName.text
            let lName = lastName.text
            let eText = emailText.text
            let aText = addressText.text
            let pText = phoneText.text
            let pasText = passText.text
            let repPasT = repPassText.text
            
            if(fName!.isEmpty || lName!.isEmpty || eText!.isEmpty || aText!.isEmpty || pText!.isEmpty || pasText!.isEmpty || repPasT!.isEmpty) {
                alertMessage("All fields with * must be filled")
                return
            }
            
            if(pasText != repPasT) {
                alertMessage("Passwords do not match")
                return
            }
        }
    }
    
    func alertMessage(_ message: String) {
        let alert = UIAlertController(title: "Warning", message: message, preferredStyle: .alert)
        let alertAct = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(alertAct)
        self.present(alert, animated: true, completion: nil)
    }
}
