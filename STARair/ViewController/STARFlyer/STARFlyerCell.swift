//
//  STARFlyerCell.swift
//  STARair
//
//  Created by Mandip Kanjiya on 31/03/19.
//  Copyright © 2019 Mandip Kanjiya. All rights reserved.
//

import UIKit

class STARFlyerCell: UITableViewCell {

    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
