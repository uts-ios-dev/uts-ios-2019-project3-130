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
        NetworkManager.shared.retrieveCars(type : "Toyota")
        
//        NetworkManager.shared.getCars(type: "Toyota")
//        Car.GetDefaultCar().ToJsonString()
//        NetworkManager.shared.uploadCarToServer(car: Car.GetDefaultCar())
        // Do any additional setup after loading the view.
//        if let count = self.tabBar.items?.count {
//            for i in 0...(count-1) {
////                let imageNameForSelectedState   = arrayOfImageNameForSelectedState[i]
////                let imageNameForUnselectedState = arrayOfImageNameForUnselectedState[i]
//                
//                self.tabBar.items?[i].selectedImage = UIImage(named: "Expore-Icon")?.withRenderingMode(.alwaysOriginal)
////                self.tabBar.items?[i].selectedImage?
//                self.tabBar.items?[i].image = UIImage(named: "Expore-Icon")?.withRenderingMode(.alwaysOriginal)
//            }
//        }
        
//        let selectedColor   = UIColor(red: 246.0/255.0, green: 155.0/255.0, blue: 13.0/255.0, alpha: 1.0)
//        let unselectedColor = UIColor(red: 16.0/255.0, green: 224.0/255.0, blue: 223.0/255.0, alpha: 1.0)
//        
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
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
