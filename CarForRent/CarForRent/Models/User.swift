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
    var phone: String = ""
    var address: String = ""
    var rentingCars : [Car]
    var pastRentedCars : [Car]
    var carsForRent : [Car]
    
    init (id : Int){
        self.id = id
        rentingCars = []
        carsForRent = []
        pastRentedCars = []
    }
    
    static func getDefaultUser() -> User {
        let defaultUser = User(id: 001)
        defaultUser.name = "Steven001"
        defaultUser.email = "steven@gmail.com"
        defaultUser.phone = "0450111111"
        defaultUser.password = "1111111"
        defaultUser.address = "80/91 George Str"
        let rentingCar = Car(id: 771, name: "MazdaCX-5", brand: "MazdaCX-5", price: 199, location: "Ultimo", carImages: ["MazdaCX-5.png","Mada-CX5-side.png","Mazda-CX5-back.png","Mazda-CX5-inside.png"])
        let pastRentedCars1 = Car(id: 772, name: "InfinitiQ50", brand: "InfinitiQ50", price: 268, location: "Burwood", carImages: ["InfinitiQ50.png","Infiniti-q50-side","Infiniti-Q50-back","Infiniti-Q50-Inside"])
        let pastRentedCars2 = Car(id: 773, name: "Suzuki-Swift", brand: "Suzuki-Swift", price: 254, location: "Zetland", carImages: ["large.png","Suzuki-Swift-side.png","Suzuki-Swift-back.png","Suzuki-Swift-inside.png"])
        defaultUser.rentingCars = [rentingCar]
        let pastRentedCars3 = Car(id: 771, name: "MazdaCX-5", brand: "MazdaCX-5", price: 199, location: "Ultimo", carImages: ["MazdaCX-5.png","Mada-CX5-side.png","Mazda-CX5-back.png","Mazda-CX5-inside.png"])
        let pastRentedCars4 = Car(id: 774, name: "Suzuki-Swift", brand: "Suzuki-Swift", price: 254, location: "Zetland", carImages: ["large.png","Suzuki-Swift-side.png","Suzuki-Swift-back.png","Suzuki-Swift-inside.png"])
        defaultUser.rentingCars = [rentingCar]
        
        defaultUser.pastRentedCars = [pastRentedCars1,pastRentedCars2,pastRentedCars3,pastRentedCars4]
    
        return defaultUser
    }
}
