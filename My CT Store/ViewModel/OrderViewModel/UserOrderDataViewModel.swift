//
//  OrderViewModel.swift
//  My CT Store
//
//  Created by Lalaiya Sahil on 10/04/23.
//

import Foundation
struct UserOrderDataViewModel {
    private let userOrderData: UserOrderData
    
    init(userOrderData: UserOrderData) {
        self.userOrderData = userOrderData
    }
    
    func getId() -> String { return userOrderData.orderId }
    
    func getVendorName() -> String { return userOrderData.vendorNames }
    
    func  getOrderTotalPrice() -> String { return userOrderData.totalPrice }
    
    func  getOrderDateAndTime() -> String { return userOrderData.dateAndTime }
    
    func  getOrderstatus() -> String { return userOrderData.status }
    
    func getImage() -> String {
        return Config.baseURLForImage + (userOrderData.vendorImage.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")
    }

}

