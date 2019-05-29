//
//  User.swift
//  CarForRent
//
//  Created by Quang Binh Dang on 23/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import Foundation

class User {
    var id : Int = 0
    var name : String = ""
    var email : String = ""
    var password : String = ""
    var phone: String = ""
    var address: String = ""
    var rentingCars : Int
    var pastRentedCars : [Int]
    var carsForRent : [Int]
    
    init(id: Int, name: String, email: String, password: String, phone: String, address: String, rentingCars: Int, pastRentedCars: [Int], carsForRent: [Int]) {
        self.id = id
        self.name = name
        self.email = email
        self.password = password
        self.rentingCars = rentingCars
        self.pastRentedCars = pastRentedCars
        self.carsForRent = carsForRent
    }
    
    static func getRandomUser() -> User {
        let users = DataManager.shared.getUsers()
        let user = users.randomElement()
        return user!
    }
    
    static func getDefaultUser() -> User {
        let defaultUser = User(id: 0, name: "Steven001", email: "steven@gmail.com", password: "0450111111", phone: "1111111", address: "80/91 George Str", rentingCars: 771, pastRentedCars: [772,773], carsForRent: [774])
       defaultUser.name = "Steven001"
       defaultUser.email = "steven@gmail.com"
       defaultUser.phone = "0450111111"
       defaultUser.password = "1111111"
       defaultUser.address = "80/91 George Str"
       return defaultUser
    }
}
