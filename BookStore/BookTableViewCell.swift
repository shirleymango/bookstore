//
//  BookTableViewCell.swift
//  BookStore
//
//  Created by ZhuMacPro on 10/29/22.
//  Copyright © 2022 Apple. All rights reserved.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var bookFeature: UILabel!
    @IBOutlet weak var bookFeatureValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
