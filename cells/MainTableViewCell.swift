//
//  MainTableViewCell.swift
//  srikar
//
//  Created by epita on 01/07/2019.
//  Copyright © 2019 epita. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var lableUName: UILabel!
    @IBOutlet weak var lableUEmail: UILabel!
    @IBOutlet weak var contactImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
                                                                                                                                                                                                                                                                                                                             
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
