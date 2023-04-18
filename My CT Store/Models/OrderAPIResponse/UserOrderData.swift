//
//  UserOrderData.swift
//  My CT Store
//
//  Created by Lalaiya Sahil on 10/04/23.
//

import Foundation

struct UserOrderData: Decodable{
    var orderId: String
    var status: String
    var vendorImage: String
    var vendorNames: String
    var totalPrice: String
    var dateAndTime: String
    
    enum CodingKeys: String, CodingKey{
        case orderId = "order_id"
        case status = "stats"
        case vendorImage = "vimage"
        case vendorNames = "vname"
        case totalPrice = "tprice"
        case dateAndTime = "date_time"
    }
}
