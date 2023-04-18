//
//  ApiEndPoint.swift
//  My CT Store
//
//  Created by Lalaiya Sahil on 31/03/23.
//

import Foundation

enum ApiEndPoint {
    case getArea
    case getcity
    case homePage
    case orderPage
    
    var url: String {
        switch self {
        case .getArea: return "\(Config.baseUrl)/get_area"
        case .getcity: return "\(Config.baseUrl)/get_city"
        case .homePage: return "\(Config.baseUrl)/homepage"
        case .orderPage: return "\(Config.baseUrl)/get_order/8"
        }
    }
    
}
