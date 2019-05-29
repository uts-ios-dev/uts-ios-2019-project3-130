//
//  DataManager.swift
//  CarForRent
//
//  Created by Yuhui Liu on 29/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import Foundation

class DataManager {
    
    var allCars : [Car] = []
    var users : [User] = []
    
    static let shared = DataManager()
    
    func CreateFakeData(){
        createCarsData()
        createUsersData()
    }
    
    func createCarsData() {
        for i in 1...100 {
            let car = Car(id: i,name: "MyCar", brand: "Mecedes", price: 90000, longitude:"", latitude : "", street:"", city:"", carImages: ["frontPic","sidePic","backpic","insidePic"])
            allCars.append(car)
        }
    }
    
    func createUsersData() {
        for i in 1...10 {
            
            var rentingCar: Int
            var pastedRentedCars: [Int] = []
            var carsForRent : [Int] = []
            
            rentingCar = Int.random(in: 1 ... 100)
            
            for _ in 1...Int.random(in: 2 ... 5) {
                let carId = Int.random(in: 1 ... 100)
                pastedRentedCars.append(carId)
            }
            for _ in 1...Int.random(in: 2 ... 5) {
                let carId = Int.random(in: 1 ... 100)
                carsForRent.append(carId)
            }
            //let randomCar = allCars.randomElement()
            
            let user = User(id: i, name: "Steven", email: "Steven@gmail.com", password: "", phone: "", address: "", rentingCars: rentingCar, pastRentedCars: pastedRentedCars, carsForRent: carsForRent)
            
            users.append(user)
        }
    }
    
    func  getCars() -> [Car]{
        CreateFakeData()
        return allCars
    }
    func getUsers() -> [User] {
        CreateFakeData()
        return users
    }
}
