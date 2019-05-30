//
//  Car.swift
//  CarForRent
//
//  Created by Yuhui Liu on 21/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import Foundation
import MapKit

class Car : Codable {
    var id : Int
    var name:String
    var brand:String
    var price:Int
    var longitude:String
    var latitude:String
    var street:String
    var city:String
    var carImages : [String]
    var isAvailable : Bool = true
//  TODO: creat date function
//    var availableDate:Date

    
    init(id : Int, name : String, brand: String,price:Int, longitude:String,latitude:String,street:String,city:String, carImages: [String]){
        self.id = id
        self.name = name
        self.brand = brand
        self.price = price
        self.longitude = longitude
        self.latitude = latitude
        self.street = street
        self.city = city
        self.isAvailable = true
        self.carImages = carImages
    }
    
    func initFromJson(){
    
    }
    
    static func GetDefaultCar() -> Car {
        return Car(id: 800, name: "MyCar", brand: "Mecedes", price: 90000, longitude:"", latitude : "", street:"", city:"", carImages: ["frontPic","sidePic","backpic","insidePic"])
    }
    
    func ToString() -> String{
        
        return "id = \(self.id), name = (\(self.name)), brand = (\(self.brand)), price = (\(self.price)), longitude = (\(self.longitude)), latitude = (\(self.latitude)), street = (\(self.street)), city = (\(self.city)), carImages = (\(self.carImages)) "
    }
    
    func ToJsonString() -> String {
        do {
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(self)
            let json = String(data: jsonData, encoding: String.Encoding.utf8)
            return json!
        }
        catch {
            return "[]"
        }
    }
    
    func ToJsonData() -> Data {
        let json: [String: Any] = ["fields": ["name":"\(self.name)", "brand":"\(self.brand)","price":"\(self.price)","longitude":"\(self.longitude)","latitude":"\(self.latitude)","street":"\(self.street)","city":"\(self.city)","carImages":"\(self.CarImagesToJsonString())","isAvailable":1]]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        return jsonData!
    }
    
    func CarImagesToJsonString() -> String {
        var result = "["
        for i in 0..<self.carImages.count {
            if(i == self.carImages.count-1) { // last index
                result += "\(self.carImages[i])"
            } else {
                result += "\(self.carImages[i]),"
            }
        }
        result += "]"
        return result
    }
}

