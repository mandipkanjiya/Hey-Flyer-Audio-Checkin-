//
//  HomeTable_Cell.swift
//  MeetMeAtAirport
//
//  Created by i can infotech on 23/06/17.
//  Copyright © 2017 i can infotech. All rights reserved.
//

import UIKit

protocol WhereToGoFlyers_Cell_Delegate {
    func BtnRequestMeeting(cell: WhereToGoFlyers_Cell)
    func BtnProfile(cell: WhereToGoFlyers_Cell)
    
}

class WhereToGoFlyers_Cell: UITableViewCell {

    var delegate: WhereToGoFlyers_Cell_Delegate?
    
    var DataDic:NSDictionary?
    
    @IBOutlet var lblname: UILabel!
    @IBOutlet var lblDate: UILabel!
    @IBOutlet var ProfileImg: UIImageView!
    @IBOutlet var lblLocation:UILabel!
    @IBOutlet var ImgBlare: UIImageView!
    @IBOutlet var btnrequestMeeting:UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func BtnRequestClick(sender: Any){
        if delegate != nil {
            delegate?.BtnRequestMeeting(cell: self)
        }
    }
    
    @IBAction func BtnProfileClick(sender: Any){
        if delegate != nil {
            delegate?.BtnProfile(cell: self)
        }
    }
    
   
    
}
