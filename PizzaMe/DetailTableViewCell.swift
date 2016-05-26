//
//  DetailTableViewCell.swift
//  PizzaMe
//
//  Created by Bharath Kongara on 5/25/16.
//  Copyright © 2016 Bharath Kongara. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var placeTitle: UILabel!
    @IBOutlet weak var placeAddress: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
