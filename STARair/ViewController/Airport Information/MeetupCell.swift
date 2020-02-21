//
//  Meetup_Cell.swift
//  HeyFlyer
//
//  Created by i can infotech on 08/12/17.
//  Copyright © 2017 i can infotech. All rights reserved.
//

import UIKit

class MeetupCell: UICollectionViewCell {

    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblGroupName: UILabel!
    @IBOutlet var lblDate: UILabel!
    var DataDic:NSDictionary?
    @IBOutlet var vwBG: UIView!
    @IBOutlet var lblTime: UILabel!
    @IBOutlet var lblMonth: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        vwBG.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        vwBG.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        vwBG.layer.shadowOpacity = 1.0
        vwBG.layer.shadowRadius = 2.0
        vwBG.layer.masksToBounds = false
        vwBG.layer.cornerRadius = 5.0
       // vwBG.layer.borderWidth = 1.0
        //vwBG.layer.borderColor = UIColor.lightGray.cgColor
    }

}
