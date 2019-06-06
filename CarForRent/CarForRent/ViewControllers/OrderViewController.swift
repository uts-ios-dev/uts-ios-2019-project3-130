//
//  OrderViewController.swift
//  CarForRent
//
//  Created by Quang Binh Dang on 20/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import UIKit
import MapKit

class OrderViewController: UIViewController, HorizontalScrollDelegate {
    
    @IBOutlet weak var scrollView: HorizontalScroll!

    //@IBOutlet weak var rentingCar: UIImageView!
    
    @IBOutlet var rentingCar: UIImageView!
    @IBOutlet weak var brand: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var location: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    //var imageNames = ["Explore-Icon", "Favourite-Icon", "Profile-Icon", "Order-Icon"]
    var user : User?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        user = DataManager.shared.currentUser
        populateData()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        rentingCar.isUserInteractionEnabled = true
        rentingCar.addGestureRecognizer(tapGestureRecognizer)
        
        NotificationCenter.default.addObserver(self, selector: #selector(goToCarDetail(_:)), name: Notification.Name(ConstantDefinition.NotificationMessage.ShowCarDetail.stringValue), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(finishRetrieveCars(_:)), name: Notification.Name(ConstantDefinition.NotificationMessage.FinishedRetrieveCarData.stringValue), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(reloadData(_:)), name: Notification.Name(ConstantDefinition.NotificationMessage.ShouldReloadOrderData.stringValue), object: nil)
        
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
    
    @objc func finishRetrieveCars(_ notification:Notification) {
        // Do something now
        populateData()
    }
    
    @objc func reloadData(_ notification:Notification) {
        // Do something now
        populateData()
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let nodeDict:[String: Any] = ["car": DataManager.shared.GetCarById(id: (user?.rentingCars)!)]
        NotificationCenter.default.post(name: Notification.Name(ConstantDefinition.NotificationMessage.ShowCarDetail.stringValue), object: nil, userInfo: nodeDict)
    }
    
    func populateData() {
        user = DataManager.shared.currentUser
        scrollView.myDelegate = self
        scrollView.reload()
        let rentingCar = DataManager.shared.GetCarById(id: (user?.rentingCars)!)
        displayImage(imageLink: rentingCar.carImages[0])
        
        brand.text = "\(rentingCar.brand) - \(rentingCar.name)"
        price.text = "Price: $\(rentingCar.price)"
        
        convertLatLongToAddress(latitude: Double(rentingCar.latitude)!, longitude: Double(rentingCar.longitude)!)
        
    }
    
    func numberOfScrollViewElements() -> Int {
        return user!.pastRentedCars.count
    }
    
    func elementAtScrollViewIndex(index: Int) -> Car? {
        return DataManager.shared.GetCarById(id: user!.pastRentedCars[index])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func displayImage(imageLink : String){
        let catPictureURL = URL(string: imageLink)!
        
        // Creating a session object with the default configuration.
        // You can read more about it here https://developer.apple.com/reference/foundation/urlsessionconfiguration
        let session = URLSession(configuration: .default)
        
        // Define a download task. The download task will download the contents of the URL as a Data object and then you can do what you wish with that data.
        let downloadPicTask = session.dataTask(with: catPictureURL) { (data, response, error) in
            // The download has finished.
            if let e = error {
                print("Error downloading cat picture: \(e)")
            } else {
                // No errors found.
                // It would be weird if we didn't have a response, so check for that too.
                if let res = response as? HTTPURLResponse {
                    print("Downloaded cat picture with response code \(res.statusCode)")
                    if let imageData = data {
                        // Finally convert that Data into an image and do what you wish with it.
                        
                        DispatchQueue.main.async {
                            let image = UIImage(data: imageData)
                            // Do something with your image.
                            self.rentingCar.image = image
                        }
                        
                    } else {
                        print("Couldn't get image: Image is nil")
                    }
                } else {
                    print("Couldn't get response code for some reason")
                }
            }
            
        }
        
        downloadPicTask.resume()
    }
    
    // location

    func convertLatLongToAddress(latitude:Double,longitude:Double){
        var address = ""
        let geoCoder = CLGeocoder()
        let location = CLLocation(latitude: latitude, longitude: longitude)
        
        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
            
            // Place details
            var placeMark: CLPlacemark!
            placeMark = placemarks?[0]
            
            // Street address
            if let street = placeMark.thoroughfare {
                address.append(street)
            }
            // City
            if let city = placeMark.subAdministrativeArea {
                address.append(" - \(city)")
            }
            self.location.text = "Location: \(address)"
        })
        
    }
}
