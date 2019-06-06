//
//  CarDetailsViewController.swift
//  CarForRent
//
//  Created by Yuhui Liu on 21/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import UIKit
import MapKit

class CarDetailsViewController: UIViewController, HorizontalScrollDelegate {
    var location:Location?
    
    @IBOutlet weak var imageScrollView: HorizontalScroll!
    
    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var CarDetailDescription: UILabel!
    @IBOutlet weak var mapVie: MKMapView!
    var locationArray : [Location]?=[]
    var car : Car?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let latitude = car?.latitude, let longitude = car?.longitude {
            convertLatLongToAddress(latitude: Double(latitude)!, longitude: Double(longitude)!)
        }
        
        scroll.frame = view.frame
        scroll.contentSize = CGSize(width: self.view.frame.size.width, height: 700)
        CarDetailDescription.sizeToFit()
        CarDetailDescription.numberOfLines = 0
        elementAtCarDetailsScrollViewIndex(car: car!)
        addPin(car: car!) // add the annotation to the map
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        imageScrollView.myDelegate = self
        imageScrollView?.reload(car: car!)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func populateData(){
        //        imageScrollView.contentSize
        //        imageScrollView?.reload()
    }
    
   
    
    func numberOfScrollViewElements() -> Int {
        //print("car?.carImages.count == \(car?.carImages.count)")
        return (car?.carImages.count)!
    }
    
    func elementAtScrollViewIndex(index: Int) -> Car? {
        return car
    }
    func elementAtCarDetailsScrollViewIndex(car:Car?) {
        if let car = car {
            CarDetailDescription.text = " Name: \(car.name) \n Brand: \(car.brand) \n Location: \(car.city) \n Price: $\(car.price)"
        } else {
            CarDetailDescription.text = " Name: DefaultName \n Brand: DefaultBrand \n Location: DefaultLocation \n Price: DefaultPrice"
        }
        
    }
    // set initial location and centrelized by the location of the car
    func centerMapOnLocation(location: CLLocationCoordinate2D) {
        let regionRadius: CLLocationDistance = 5000
        let coordinateRegion = MKCoordinateRegion(center: location,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapVie.setRegion(coordinateRegion, animated: true)
        
        
    }
    // add the annotation to the map
    func addPin(car:Car){
        let pin = Location(locationName: car.street ?? "unknow", coordinate:CLLocationCoordinate2DMake(Double(car.latitude) ?? 0, Double(car.longitude) ?? 0))
        let coordinate = CLLocationCoordinate2DMake(Double(car.latitude) ?? 0, Double(car.longitude) ?? 0)
        
        centerMapOnLocation(location: coordinate)
        mapVie.addAnnotation(pin)
        centerMapOnLocation(location:pin.coordinate)
    }
    @IBAction func Goback(_ sender: UIButton) {
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }

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
            if let car = self.car {
                self.CarDetailDescription.text = " Name: \(car.name) \n Brand: \(car.brand) \n Location: \(address) \n Price: $\(car.price)"
            }
        })
    }
    
    @IBAction func BookButtonTapped(_ sender: Any) {
        
        let alert = UIAlertController(title: "Confirm", message: "You are about to book this car for rent", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                DataManager.shared.currentUser.pastRentedCars.append(DataManager.shared.currentUser.rentingCars)
                DataManager.shared.currentUser.rentingCars = (self.car?.id)!
                
                NotificationCenter.default.post(name: Notification.Name(ConstantDefinition.NotificationMessage.ShouldReloadOrderData.stringValue), object: nil)
                break
            case .cancel:
                print("cancel")
                break
            case .destructive:
                print("destructive")
                break
            }}))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { action in
            switch action.style{
            case .default:
                break
            case .cancel:
                print("cancel")
                break
            case .destructive:
                print("destructive")
                break
            }}))
        self.present(alert, animated: true, completion: nil)
    }
    
}

