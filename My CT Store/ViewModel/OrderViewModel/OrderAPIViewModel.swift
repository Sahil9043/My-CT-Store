//
//  OrderAPIViewModel.swift
//  My CT Store
//
//  Created by Lalaiya Sahil on 10/04/23.
//

import Foundation
import Alamofire
import UIKit

class OrderAPIViewModel {
    private(set) var arrOrderDetails: [UserOrderDataViewModel] = []
    private let apiManager: ApiManager = ApiManager()
    
    func fetchOrderDetails(complition: @escaping(Result<(),Error>) -> Void) {
        apiManager.request(with: ApiEndPoint.orderPage.url, method: .get) { response in
            switch response {
            case .success(let data):
                do{
                    let orderDetails = try JSONDecoder().decode(OrderAPIData.self, from: data)
                    self.arrOrderDetails = orderDetails.data.map { UserOrderDataViewModel(userOrderData: $0)}
                    print(self.arrOrderDetails)
                    complition(.success(()))
                }catch{
                    print(error)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func numOfSection() -> Int { return 1 }
    func numOfRow() -> Int { return arrOrderDetails.count }
}
