//
//  OrderPageViewController.swift
//  My CT Store
//
//  Created by Lalaiya Sahil on 10/04/23.
//

import Foundation
import UIKit
import SDWebImage

class OrderPageViewController: UIViewController {
    
    @IBOutlet weak var orderDatatableView: UITableView!
    let viewModel: OrderAPIViewModel = OrderAPIViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        
    }
    
    private func setUp() {
        orderDatatableView.register(UINib(nibName: OredrTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: OredrTableViewCell.identifier)
        
        viewModel.fetchOrderDetails { result in
            switch result {
            case .success:
                print("Success")
                self.orderDatatableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
extension OrderPageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: OredrTableViewCell = tableView.dequeueReusableCell(withIdentifier: "OredrTableViewCell", for: indexPath) as! OredrTableViewCell
        cell.orderId.text = viewModel.arrOrderDetails[indexPath.row].getId()
        cell.dateAndTime.text = viewModel.arrOrderDetails[indexPath.row].getOrderDateAndTime()
        cell.orderStatus.text = viewModel.arrOrderDetails[indexPath.row].getOrderstatus()
        cell.vendorName.text = viewModel.arrOrderDetails[indexPath.row].getVendorName()
        cell.totalAmount.text = viewModel.arrOrderDetails[indexPath.row].getOrderTotalPrice()
        cell.vendorImage.sd_setImage(with: URL(string: viewModel.arrOrderDetails[indexPath.row].getImage()))
       return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}


