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

        
        // creat location instance,
        let location1 = Location(locationName: "Swift", coordinate: CLLocationCoordinate2DMake(-33.882142,  151.195291) )
        let location2 = Location(locationName: "CX-5 SUV", coordinate: CLLocationCoordinate2DMake(-33.894878, 150.914204) )
         let location3 = Location(locationName: "Q50 Sedan", coordinate: CLLocationCoordinate2DMake(-33.905200, 151.163675) )
        locationArray = [location1,location2,location3]
        scroll.frame = view.frame
        scroll.contentSize = CGSize(width: self.view.frame.size.width, height: 700)
        CarDetailDescription.sizeToFit()
        CarDetailDescription.numberOfLines = 0
        elementAtCarDetailsScrollViewIndex(car: car!)
        addPin(car: car!) // add the annotation to the map

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print(imageScrollView.frame)
        imageScrollView.myDelegate = self
        imageScrollView?.reload()
    }
    
    func populateData(){
//        imageScrollView.contentSize
//        imageScrollView?.reload()
    }
    
    func numberOfScrollViewElements() -> Int {
        return (car?.carImages.count)!
    }
    
    func elementAtScrollViewIndex(index: Int) -> UIImageView {
        return UIImageView(image: UIImage(named: car?.carImages[index] ?? "defaultCarImage"))
    }
    func elementAtCarDetailsScrollViewIndex(car:Car) {
        CarDetailDescription.text = " Name: \(car.name) \n Brand: \(car.brand) \n Location: \(car.location) \n Price: \(car.price)"
        
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
        let pin = returnTheLocation(carName: car.name)  // get the name of the car and retrieve in location array based on the matched name
        mapVie.addAnnotation(pin)
        centerMapOnLocation(location:pin.coordinate)
    }
    @IBAction func Goback(_ sender: UIButton) {

            dismiss(animated: true, completion: nil)
      
    }

        
    
// retrieve the car name in location, once matched, then return the coodinate of the location
    func returnTheLocation(carName:String)-> Location{
        var annotation = Location(locationName: "initialLocation", coordinate:CLLocationCoordinate2DMake(-33.8688,151.2093))
        for item in locationArray! {
            if carName == item.locationName{
                annotation = item
            }
        }
        return annotation
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
