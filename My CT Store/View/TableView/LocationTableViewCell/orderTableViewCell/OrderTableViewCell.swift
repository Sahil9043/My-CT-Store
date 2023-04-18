//
//  OrderTableViewCell.swift
//  My CT Store
//
//  Created by Lalaiya Sahil on 10/04/23.
//

import UIKit

class OrderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var totalPrice: UILabel!
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
}
