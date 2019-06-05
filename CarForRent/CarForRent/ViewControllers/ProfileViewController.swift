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
    @IBOutlet weak var address: UILabel!
    
    
    //var user = User.getDefaultUser()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let user = DataManager.shared.currentUser
        userWelcome.text = "Hi! \(user.name)"
        email.text = "Email: \(user.email)"
        phone.text = "Phone no.: \(user.phone)"
        address.text = "Address: \(user.address)"
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
