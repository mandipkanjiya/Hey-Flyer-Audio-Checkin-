//
//  TimeTableMain_Cell.swift
//  HeyFlyer
//
//  Created by baps on 24/07/1940 Saka.
//  Copyright © 1940 nikunj. All rights reserved.
//

import UIKit

class TimeTableMain_Cell: UITableViewCell {

    @IBOutlet weak var btnStatus: UIButton!
    @IBOutlet weak var lblFlightName: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var lblGateNo: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblFlightNO: UILabel!
    @IBOutlet weak var imgFlag: UIImageView!
    @IBOutlet weak var viewBack: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        viewBack.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        viewBack.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        viewBack.layer.shadowOpacity = 1.0
        viewBack.layer.shadowRadius = 2.0
        viewBack.layer.masksToBounds = false
        //viewBack.layer.cornerRadius = 5.0
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
