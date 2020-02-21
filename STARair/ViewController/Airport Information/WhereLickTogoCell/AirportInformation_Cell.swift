//
//  AirportInformation_Cell.swift
//  HeyFlyer
//
//  Created by i can infotech on 19/03/18.
//  Copyright © 2018 nikunj. All rights reserved.
//

import UIKit

class AirportInformation_Cell: UICollectionViewCell {

    var DataDic:NSDictionary?
    
    @IBOutlet var lblname: UILabel!
    @IBOutlet var ProfileImg: UIImageView!
    @IBOutlet var vwBG: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        vwBG.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        vwBG.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        vwBG.layer.shadowOpacity = 1.0
        vwBG.layer.shadowRadius = 2.0
        vwBG.layer.masksToBounds = false
        vwBG.layer.cornerRadius = 5.0
        // Initialization code
    }

}
