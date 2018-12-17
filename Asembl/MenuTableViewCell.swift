//
//  MenuTableViewCell.swift
//  Asembl
//
//  Created by ANTHONY ORSO on 12/17/18.
//  Copyright © 2018 Chris David. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

   
        @IBOutlet weak var iconImage: UIImageView!
        @IBOutlet weak var menuLabel: UILabel!
        
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
