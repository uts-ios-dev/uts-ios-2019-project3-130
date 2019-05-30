//
//  ConstantDefinition.swift
//  CarForRent
//
//  Created by Quang Binh Dang on 29/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import Foundation

class ConstantDefinition {
    enum NetworkKeys {
        case CarApiKey
        case CarBaseUrl
        case AirTableApiKey
        case AirTableBaseUrl
        
        var stringValue : String {
            switch self {
            case .CarApiKey:
                return "d9rbH0vzEVtDG6kzZ3zqO7gupvRmR6Ug"
            case .CarBaseUrl:
                return "https://marketcheck-prod.apigee.net/v1/"
            case .AirTableApiKey:
                return "Bearer keyod4i6a6et44l9G"
            case .AirTableBaseUrl:
                return "https://api.airtable.com/v0/appNHAClov8jhlU9t"
            }
        }
    }
    
    enum NotificationMessage {
        case ShowCarDetail
        
        var stringValue : String {
            switch self {
            case .ShowCarDetail:
                return "SHOW_CAR_DETAIL_NOTIFICATION"
            }
        }
    }
    
}



