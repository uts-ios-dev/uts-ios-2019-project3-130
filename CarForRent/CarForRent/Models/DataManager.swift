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
//        createCarsData()
        createUsersData()
    }
    
    func createCarsData() {
        for i in 1...100 {
            var car: Car?
            let j = Int.random(in: 1...3)
            switch j {
            case 1:
                car = Car(id: i,name: "MyCar", brand: "Mecedes", price: 90000, longitude:"", latitude : "", street:"", city:"", carImages: ["MazdaCX-5","Mada-CX5-side","Mazda-CX5-back","Mazda-CX5-inside"])
            case 2:
                car = Car(id: i,name: "MyCar", brand: "Mecedes", price: 90000, longitude:"", latitude : "", street:"", city:"", carImages: ["InfinitiQ50","Infiniti-q50-side","Infiniti-Q50-back","Infiniti-Q50-Inside"])
            case 3:
                car = Car(id: i,name: "MyCar", brand: "Mecedes", price: 90000, longitude:"", latitude : "", street:"", city:"", carImages: ["large","Suzuki-Swift-side","Suzuki-Swift-back","Suzuki-Swift-inside"])
            default:
                return
            }
            //let car = Car(id: i,name: "MyCar", brand: "Mecedes", price: 90000, longitude:"", latitude : "", street:"", city:"", carImages: ["MazdaCX-5","Mada-CX5-side","Mazda-CX5-back","Mazda-CX5-inside"])
            allCars.append(car!)
        }
    }
    
    func createUsersData() {
        for i in 1...10 {
            var rentingCar: Int
            var pastedRentedCars: [Int] = []
            var carsForRent : [Int] = []
            
            let cars = DataManager.shared.allCars
            if(cars.count > 0){
                rentingCar = (cars.randomElement()?.id)!
                
                for _ in 1...Int.random(in: 2 ... 5) {
                    let carId = (cars.randomElement()?.id)!
                    pastedRentedCars.append(carId)
                }
                for _ in 1...Int.random(in: 2 ... 5) {
                    let carId = (cars.randomElement()?.id)!
                    carsForRent.append(carId)
                }
                
                let user = User(id: i, name: "Steven", email: "Steven@gmail.com", password: "", phone: "", address: "", rentingCars: rentingCar, pastRentedCars: pastedRentedCars, carsForRent: carsForRent)
                
                users.append(user)
            }
            
        }
    }
    
    func  getCars() -> [Car]{
        return allCars
    }
    func getUsers() -> [User] {
        return users
    }
    
    func GetCarById(id: Int) -> Car{
        var car = Car.GetDefaultCar()
        for i in 0...(allCars.count-1) {
            if (allCars[i].id == id) {
                car = allCars[i]
            }
        }
        return car
    }
}
