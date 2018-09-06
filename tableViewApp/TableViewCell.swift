//
//  TableViewCell.swift
//  tableViewApp
//
//  Created by 陳仲堯 on 2018/9/6.
//  Copyright © 2018年 陳仲堯. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var restaurantImage: UIImageView!
//    {
//        didSet {
//            restaurantImage.layer.cornerRadius = restaurantImage.bounds.width / 2
//            restaurantImage.clipsToBounds = true
//        }
//    }
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var heartImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
