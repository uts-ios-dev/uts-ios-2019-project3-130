//
//  location.swift
//  CarForRent
//
//  Created by Yuhui Liu on 28/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import Foundation
import MapKit

class Location: NSObject, MKAnnotation {

    let locationName: String
 
    let coordinate: CLLocationCoordinate2D
    
    init( locationName: String, coordinate: CLLocationCoordinate2D) {

        self.locationName = locationName

        self.coordinate = coordinate
        
        super.init()
    }
    
    var subtitle: String? {
        return locationName
    }
}
