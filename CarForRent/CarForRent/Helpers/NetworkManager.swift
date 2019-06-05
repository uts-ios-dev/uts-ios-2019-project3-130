//
//  NetworkManager.swift
//  CarForRent
//
//  Created by Quang Binh Dang on 29/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import Foundation
import Alamofire

let url = "https://marketcheck-prod.apigee.net/v1/search?api_key=d9rbH0vzEVtDG6kzZ3zqO7gupvRmR6Ug&car_type=new&seller_type=dealer&make=Toyota"

class NetworkManager {
    static let shared = NetworkManager()
    
    func getCars(type : String) {
        let URL = "\(ConstantDefinition.NetworkKeys.CarBaseUrl.stringValue)/search"
        let params : [String : String] = ["api_key" : ConstantDefinition.NetworkKeys.CarApiKey.stringValue, "car_type" : "new", "make" : "Gumpert"]
        Alamofire.request(URL, method: .get, parameters: params).responseJSON{
            response in
            if response.result.isSuccess{
//                print(response)
                let carJSON : JSON = JSON(response.result.value!)
                if let carList = carJSON["listings"].array {
                    for car in carList {
                        let name = car["build"]["model"].string ?? "Unknown"
                        let brand = car["build"]["make"].string ?? "Unknown"
                        let price = Int.random(in: 100 ..< 1000)
                        let longitude = car["dealer"]["longitude"].string ?? "Unknown"
                        let latitude = car["dealer"]["latitude"].string ?? "Unknown"
                        let street = car["dealer"]["street"].string ?? "Unknown"
                        let city = car["dealer"]["city"].string ?? "Unknown"
                        var tempCarImages:[String] = []
                        if let carImages = car["media"]["photo_links"].array {
                            for image in carImages {
                                tempCarImages.append(image.string!)
                            }
                        }
                        let newCar = Car(id: 1, name: name, brand: brand, price: price, longitude: longitude, latitude: latitude, street: street, city:city, carImages: tempCarImages)
                    }
                }
            }
            else{
                print("Error: \(String(describing: response.result.error))")
            }
        }
    }
    
    func retrieveCars(type : String) {
        let URL = "\(ConstantDefinition.NetworkKeys.AirTableBaseUrl.stringValue)/cars"
        
        let headers: HTTPHeaders = [
            "Authorization": ConstantDefinition.NetworkKeys.AirTableApiKey.stringValue,
            "Content-Type": "application/json"
        ]
        var params : [String: String] = [:]
//        if(!type.isEmpty) {
//            params = ["filterByFormula" : "AND(brand=\"Toyota\")"]
//        }
        
        Alamofire.request(URL, method: .get, parameters: params, headers:headers).responseJSON{
            response in
            if response.result.isSuccess{
//                print(response)
                var myCars : [Car] = []
                let carJSON : JSON = JSON(response.result.value!)
                if let carList = carJSON["records"].array {
                    for car in carList {
                        let id = car["fields"]["id"].int ?? 0
                        let name = car["fields"]["name"].string ?? "Unknown"
                        let brand = car["fields"]["brand"].string ?? "Unknown"
                        let price = Int(car["fields"]["price"].string ?? "0")!
                        let longitude = Double(car["fields"]["longitude"].string ?? "0.0")!
                        let latitude = Double(car["fields"]["latitude"].string ?? "0.0")!
                        let street = car["fields"]["street"].string ?? "Unknown"
                        
                        let city = car["fields"]["city"].string ?? "Unknown"
                        let isAvailable = Int(car["fields"]["isAvailable"].int ?? 1) == 1 ? true : false
                        var carImagesString = car["fields"]["carImages"].string ?? ""
                        carImagesString = String(carImagesString.dropFirst())
                        carImagesString = String(carImagesString.dropLast())
                        let carImages = carImagesString.components(separatedBy:",")
                        let newCar = Car(id :id, name: name, brand: brand, price: price, longitude: String(longitude), latitude: String(latitude), street: street, city:city, carImages: carImages)
                        myCars.append(newCar)
                        
                    }
                    DataManager.shared.allCars = myCars
                    NotificationCenter.default.post(name: Notification.Name(ConstantDefinition.NotificationMessage.FinishedRetrieveCarData.stringValue), object: nil)
                }
            }
            else{
                print("Error: \(String(describing: response.result.error))")
            }
        }
    }
    
    func retrieveUser() {
        let URL = "\(ConstantDefinition.NetworkKeys.AirTableBaseUrl.stringValue)/users"
        
        let headers: HTTPHeaders = [
            "Authorization": ConstantDefinition.NetworkKeys.AirTableApiKey.stringValue,
            "Content-Type": "application/json"
        ]
        let params : [String: String] = [:]
        Alamofire.request(URL, method: .get, parameters: params, headers:headers).responseJSON {
            response in
            if response.result.isSuccess{
                print("Success! Got the USER data")
                print(response)
                var myUsers : [User] = []
                let usersJSON : JSON = JSON(response.result.value!)
                if let usersList = usersJSON["records"].array {
                    for user in usersList {
                        let id = user["fields"]["Id"].string ?? "1"
                        let name = user["fields"]["name"].string ?? ""
                        let email = user["fields"]["email"].string ?? ""
                        let pass = user["fields"]["password"].string ?? ""
                        let favouriteCars = user["fields"]["favouriteCars"].string ?? ""
                        let address = user["fields"]["address"].string ?? ""
                        let pastedRentedCars = user["fields"]["pastedRentedCars"].string ?? ""
                        let phone = user["fields"]["phone"].string ?? ""
                        let rentingCars = user["fields"]["rentingCars"].string ?? ""
                        
                        let favouriteCarsArray = self.getArrayIdFromString(string: favouriteCars)
                        let pastedRentedCarsArray = self.getArrayIdFromString(string: pastedRentedCars)
                        let rentingCarsArray = self.getArrayIdFromString(string: rentingCars)
                        let newUser = User(id: Int(id)!, name: name, email: email, password: pass, phone: phone, address: address, rentingCars: rentingCarsArray[0], pastRentedCars: pastedRentedCarsArray, carsForRent: [], favouriteCars: favouriteCarsArray)
                        print("data mail = \(user["fields"]["address"].string)")
                        print("User mail= \(newUser.address)")
                        myUsers.append(newUser)
                    }
                    DataManager.shared.users = myUsers
                    NotificationCenter.default.post(name: Notification.Name(ConstantDefinition.NotificationMessage.FinishedRetrieveUserData.stringValue), object: nil)
                }
            }
            else
            {
                print("Error: \(String(describing: response.result.error))")
            }
        }
    }

    func uploadUserToServer(user : User){
        let URL = "\(ConstantDefinition.NetworkKeys.AirTableBaseUrl.stringValue)/cars"
        
        var request = URLRequest(url: NSURL(string: URL)! as URL)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(ConstantDefinition.NetworkKeys.AirTableApiKey.stringValue, forHTTPHeaderField: "Authorization")
//        request.httpBody = user.ToJsonData()
        Alamofire.request(request).responseJSON {
            response in
            switch response.result {
            case .success:
//                print(response)
                break
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    func getArrayIdFromString(string: String) -> [Int] {
        let idArray = string.components(separatedBy: ",").map { Int($0)!}
        print("getArrayIdFromString = \(idArray)")
        return idArray
    }
}

