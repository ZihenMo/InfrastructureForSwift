//
//  ProductCell.swift
//  Infrastructure
//
//  Created by mozihen on 2019/3/24.
//  Copyright © 2019 mozihen. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.randomColor()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
