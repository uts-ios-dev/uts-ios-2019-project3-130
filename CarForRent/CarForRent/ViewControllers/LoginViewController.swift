//
//  LoginViewController.swift
//  CarForRent
//
//  Created by Yuanxi Zeng on 23/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var bgd: UIImageView!
    @IBOutlet var logo: UIImageView!
    @IBOutlet weak var Signup: UIButton!
    @IBOutlet weak var Login: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.bgd.image = UIImage(named: "gtr-lighter.jpg")?.alpha(0.5)
        self.logo.image = UIImage(named: "car-for-rent-logo.png")
        customizeButton(Login)
        customizeButton(Signup)
    }
    
    func customizeButton(_ button: UIButton) {
        button.backgroundColor = UIColor.black
        button.titleLabel?.font = UIFont(name: "AvenirNext-DemiBole",size: 20)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 3.0
    }
}
