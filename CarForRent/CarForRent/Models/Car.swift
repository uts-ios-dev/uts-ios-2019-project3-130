//
//  Car.swift
//  CarForRent
//
//  Created by Yuhui Liu on 21/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import Foundation

class Car {
    var id : Int
    var carImages : [String]
    var name:String
    var brand:String
    var price:Int
    var location:String
    var isAvailable : Bool = true
//  TODO: creat date function
//    var availableDate:Date

    
    init(id : Int, name : String, brand: String,price:Int, location:String, carImages: [String]){
        self.carImages = ["frontPic","sidePic","backpic","insidePic"]
        self.id = id
        self.name = name
        self.brand = brand
        self.price = price
        self.location = location
        self.carImages = carImages
        self.isAvailable = true
//  TODO: creat date function
//        let formatter = DateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd"
//        self.availableDate = formatter.date(from: availableDate) ?? Date()
        
    }
    
    
}

