//
//  ConstantDefinition.swift
//  CarForRent
//
//  Created by Quang Binh Dang on 29/5/19.
//  Copyright © 2019 Quang Binh Dang. All rights reserved.
//

import Foundation

struct ConstantDefinition {
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
        case FinishedRetrieveCarData
        case FinishedRetrieveUserData
        case ShouldReloadTableData
        
        var stringValue : String {
            switch self {
            case .ShowCarDetail:
                return "SHOW_CAR_DETAIL_NOTIFICATION"
            case .FinishedRetrieveCarData:
                return "FINISH_RETRIEVE_CAR_NOTIFICATION"
            case .FinishedRetrieveUserData:
                return "FINISH_RETRIEVE_USERS_NOTIFICATION"
            case .ShouldReloadTableData:
                return "SHOULD_RELOAD_TABLE_DATA_NOTIFICATION"
            }
        }
    }
    
    enum ExploreCollectionViewType {
        case CarBrand
        case AllCar
    }
}



