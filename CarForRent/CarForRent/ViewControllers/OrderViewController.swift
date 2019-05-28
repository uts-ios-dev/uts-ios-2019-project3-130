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
        //user = User.getDefaultUser()
        populateData()
        //let rentingCarImage: String = (user?.rentingCars[0].carImages[0])!
        //rentingCar.image = UIImage(named: rentingCarImage)
        //brand.text = user?.rentingCars[0].brand
        //carName.text = user?.rentingCars[0].name
        //if let carPrice = user?.rentingCars[0].price {
        //    price.text = "\(carPrice)"        }
        //price.text = "\(String(describing: user?.rentingCars[0].price))"
        //location.text = user?.rentingCars[0].location
        //date.text = "12/05/2019"
        //print(scrollView.frame)
        
    }
    
    func populateData() {
        print("populateData populateData")
        scrollView.myDelegate = self
        scrollView.reload()
    }
    
    func numberOfScrollViewElements() -> Int {
        return (user?.pastRentedCars.count)!
    }
    
    func elementAtScrollViewIndex(index: Int) -> Car? {
        return Car.GetDefaultCar()
//        return user?.pastRentedCars[index]
        
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
