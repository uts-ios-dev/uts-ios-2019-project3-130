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
                print("Success! Got the weather data")
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
//                        self.uploadCarToServer(car: newCar)
                        print(newCar)
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
        if(!type.isEmpty) {
            params = ["filterByFormula" : "AND(brand=\"Toyota\")"]
        }
        
        Alamofire.request(URL, method: .get, parameters: params, headers:headers).responseJSON{
            response in
            if response.result.isSuccess{
//                print(response)
                var myCars : [Car] = []
                let carJSON : JSON = JSON(response.result.value!)
                if let carList = carJSON["records"].array {
                    for car in carList {
                        let name = car["fields"]["name"].string ?? "Unknown"
                        let brand = car["fields"]["brand"].string ?? "Unknown"
                        let price = Int(car["fields"]["price"].string ?? "0")!
                        let longitude = Double(car["fields"]["longitude"].string ?? "0.0")!
                        let latitude = Double(car["fields"]["latitude"].string ?? "0.0")!
                        let street = car["fields"]["street"].string ?? "Unknown"
                        
                        let city = car["fields"]["city"].string ?? "Unknown"
                        let isAvailable = Int(car["fields"]["isAvailable"].int ?? 1) == 1 ? true : false
                        
                        let carImagesString = car["fields"]["carImages"].string ?? ""
//                        carImagesString.replacingCharacters()
                        let carImages = car["fields"]["carImages"].string?.components(separatedBy:",")
                        
//                        var tempCarImages:[String] = []
//                        if let carImages = car["media"]["photo_links"].array {
//                            for image in carImages {
//                                tempCarImages.append(image.string!)
//                            }
//                        }
//                        let newCar = Car(id: 1, name: name, brand: brand, price: price, longitude: longitude, latitude: latitude, street: street, city:city, carImages: tempCarImages)
//                        self.uploadCarToServer(car: newCar)
//                        print(newCar)
//                        let record =
                    }
                }
            }
            else{
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
}


//extension String: ParameterEncoding {
//
//    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
//        var request = try urlRequest.asURLRequest()
//        request.httpBody = Data(using: .utf8, allowLossyConversion: false)
//        return request
//    }
//}
