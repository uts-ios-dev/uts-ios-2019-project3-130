//
//  MainTabBarController.swift
//  CarForRent
//
//  Created by Quang Binh Dang on 20/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
 //       DataManager.shared.CreateFakeData()
        NetworkManager.shared.retrieveCars(type : "Toyota")
        NetworkManager.shared.retrieveUser()
        NotificationCenter.default.addObserver(self, selector: #selector(finishRetrieveUsers(_:)), name: Notification.Name(ConstantDefinition.NotificationMessage.FinishedRetrieveUserData.stringValue), object: nil)
    }
    
    @objc func finishRetrieveUsers(_ notification:Notification){
        DataManager.shared.UpdateCurrentUser()
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
