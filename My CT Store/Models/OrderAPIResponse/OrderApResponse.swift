//
//  OrderApResponse.swift
//  My CT Store
//
//  Created by Lalaiya Sahil on 10/04/23.
//

import Foundation

struct OrderAPIData: Decodable {
    var error: Bool
    var data: [UserOrderData]
}
