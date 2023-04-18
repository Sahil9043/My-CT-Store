//
//  OredrTableViewCell.swift
//  My CT Store
//
//  Created by Lalaiya Sahil on 10/04/23.
//

import UIKit

class OredrTableViewCell: UITableViewCell {

    
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var vendorName: UILabel!
    @IBOutlet weak var vendorImage: UIImageView!
    @IBOutlet weak var orderStatus: UILabel!
    @IBOutlet weak var dateAndTime: UILabel!
    @IBOutlet weak var orderId: UILabel!
    @IBOutlet weak var reOrderButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    
    func cellForRow(view: UIView) {
        switch orderStatus.text {
        case "Confirmed":
            view.backgroundColor = .green
        case "Pending":
            view.backgroundColor = .orange
        case "Dispatched":
            view.backgroundColor = .red
        case "cancelled":
            view.backgroundColor = .red
        default:
            view.backgroundColor = .white
        }
    }
}
