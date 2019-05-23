//
//  User.swift
//  CarForRent
//
//  Created by Quang Binh Dang on 23/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import Foundation

class User {
    var id : Int
    var name : String = ""
    var email : String = ""
    var password : String = ""
    
    var rentingCars : [String]
    var carsForRent : [Car]
    
    init (id : Int){
        self.id = id
        rentingCars = []
        carsForRent = []
    }
}
