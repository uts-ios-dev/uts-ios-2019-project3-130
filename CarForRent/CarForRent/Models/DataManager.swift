//
//  dataManager.swift
//  CarForRent
//
//  Created by Xinxin Ai on 28/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import Foundation

struct DataManager {
    
    public func saveUsers() {
        let user = User.getDefaultUser()
        
        let jsonEncoder = JSONEncoder()
        do{
//            let jsonData = try jsonEncoder.encode(user)
//            let jsonString = try JSONDecoder.decode(jsonDa
//            user.ToJsonString()
        }
        catch {
            return
        }
    }
}
