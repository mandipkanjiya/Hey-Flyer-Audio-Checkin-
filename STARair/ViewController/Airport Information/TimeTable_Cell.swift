//
//  TimeTable_Cell.swift
//  HeyFlyer
//
//  Created by baps on 24/07/1940 Saka.
//  Copyright © 1940 nikunj. All rights reserved.
//

import UIKit

class TimeTable_Cell: UITableViewCell {

    @IBOutlet weak var lblLine2: UILabel!
    @IBOutlet weak var lblLeadingConstant: NSLayoutConstraint!
    @IBOutlet weak var lblLine: UILabel!
    @IBOutlet weak var btnArrvl: UIButton!
    @IBOutlet weak var btnDeparture: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
