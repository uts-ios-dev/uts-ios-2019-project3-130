//
//  User.swift
//  CarForRent
//
//  Created by Quang Binh Dang on 23/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import Foundation


//class Users: Decodable {
//    
//    var users: [User]?
//    
//    init(fileName : String){
//        // url, data and jsonData should not be nil
//        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else { return }
//        guard let data = try? Data(contentsOf: url) else { return }
//        guard let jsonData = try? JSONDecoder().decode(Users.self, from: data) else { return }
//        
//        // assigns the value to [person]
//        users = jsonData.users
//        
//        //Usage
//        //let users = Users(fileName: "people")
//        //let userArray = users.users
//    }
//    
//}


class User {
    var id : Int = 0
    var name : String = ""
    var email : String = ""
    var password : String = ""
    var phone: String = ""
    var address: String = ""
    var rentingCars : [Int]
    var pastRentedCars : [Int]
    var carsForRent : [Int]
    
    init(id: Int, name: String, email: String, password: String, phone: String, address: String, rentingCars: [Int], pastRentedCars: [Int], carsForRent: [Int]) {
        self.id = id
        self.name = name
        self.email = email
        self.password = password
        self.rentingCars = rentingCars
        self.pastRentedCars = pastRentedCars
        self.carsForRent = carsForRent
    }
    
    static func getDefaultUser() -> User {
//        let rentingCar = Car(id: 771, name: "MazdaCX-5", brand: "MazdaCX-5", price: 199, location: "Ultimo", carImages: ["MazdaCX-5.png","Mada-CX5-side.png","Mazda-CX5-back.png","Mazda-CX5-inside.png"])
//        let pastRentedCars1 = Car(id: 772, name: "InfinitiQ50", brand: "InfinitiQ50", price: 268, location: "Burwood", carImages: ["InfinitiQ50.png","Infiniti-q50-side","Infiniti-Q50-back","Infiniti-Q50-Inside"])
//        let pastRentedCars2 = Car(id: 773, name: "Suzuki-Swift", brand: "Suzuki-Swift", price: 254, location: "Zetland", carImages: ["large.png","Suzuki-Swift-side.png","Suzuki-Swift-back.png","Suzuki-Swift-inside.png"])
//        let pastRentedCars4 = Car(id: 774, name: "Suzuki-Swift", brand: "Suzuki-Swift", price: 254, location: "Zetland", carImages: ["large.png","Suzuki-Swift-side.png","Suzuki-Swift-back.png","Suzuki-Swift-inside.png"])
        let defaultUser = User(id: 0, name: "Steven001", email: "steven@gmail.com", password: "0450111111", phone: "1111111", address: "80/91 George Str", rentingCars: [771], pastRentedCars: [772,773], carsForRent: [774])
        
        defaultUser.name = "Steven001"
        defaultUser.email = "steven@gmail.com"
        defaultUser.phone = "0450111111"
        defaultUser.password = "1111111"
        defaultUser.address = "80/91 George Str"
    
        return defaultUser
    }
}
