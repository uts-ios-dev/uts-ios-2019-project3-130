//
//  ProfileViewController.swift
//  CarForRent
//
//  Created by Quang Binh Dang on 20/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {


    @IBOutlet weak var userWelcome: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    //@IBOutlet weak var payment: UILabel!
    @IBOutlet weak var address: UILabel!
    
    
    var user = User.getDefaultUser()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userWelcome.text = "Hi! \(user.name)"
        email.text = user.email
        phone.text = user.phone
        address.text = user.address
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
