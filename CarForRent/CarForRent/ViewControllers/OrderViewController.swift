//
//  OrderViewController.swift
//  CarForRent
//
//  Created by Quang Binh Dang on 20/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController, HorizontalScrollDelegate {
    
    @IBOutlet weak var scrollView: HorizontalScroll!

    //@IBOutlet weak var rentingCar: UIImageView!
    
    @IBOutlet var rentingCar: UIImageView!
    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var carName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    //var imageNames = ["Explore-Icon", "Favourite-Icon", "Profile-Icon", "Order-Icon"]
    var user : User?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        populateData()
        NotificationCenter.default.addObserver(self, selector: #selector(goToCarDetail(_:)), name: Notification.Name(ConstantDefinition.NotificationMessage.ShowCarDetail.stringValue), object: nil)
        
    }
    
    @objc func goToCarDetail(_ notification:Notification) {
        // Do something now
        if let dict = notification.userInfo as NSDictionary? {
            if let car = dict["car"] as? Car {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let detailsViewController = storyboard.instantiateViewController(withIdentifier: "CarDetailsViewController") as! CarDetailsViewController
                detailsViewController.car = car
                show(detailsViewController, sender: nil)
                
            }
        }
    }
    
    func populateData() {
        
        scrollView.myDelegate = self
        scrollView.reload()
    }
    
    func numberOfScrollViewElements() -> Int {
        //print("numberOfScrollViewElements == \(User.getRandomUser().pastRentedCars.count)")
        return User.getRandomUser().pastRentedCars.count
    }
    
    func elementAtScrollViewIndex(index: Int) -> Car? {
        let user = User.getRandomUser()
        let cars = DataManager.shared.getCars()
        var car: Car?
        for i in 0...(cars.count-1) {
            for j in 0..<user.pastRentedCars.count {
                if (cars[i].id == user.pastRentedCars[j]) {
                    car = cars[i]
                }
            }
        }
        return car
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
