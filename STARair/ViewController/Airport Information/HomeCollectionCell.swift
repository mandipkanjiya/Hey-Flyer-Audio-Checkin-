//
//  HomeCollectionCell.swift
//  FriendlyChatSwift
//
//  Created by Nikunj on 07/02/17.
//  Copyright © 2017 Google Inc. All rights reserved.
//

import UIKit

class HomeCollectionCell: UICollectionViewCell {

    @IBOutlet weak var viewImage: UIView!
    @IBOutlet var lblName: UILabel!
    @IBOutlet var lblDetails: UILabel!
    @IBOutlet var userProfile: UIImageView!
    @IBOutlet var CheckedImg: UIImageView!
    @IBOutlet var bgView: UIView!
    @IBOutlet var bgRound: UIView!
    
    var DataDic:NSDictionary = NSDictionary()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewImage.layer.cornerRadius = viewImage.frame.height/2
        viewImage.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        viewImage.layer.shadowOffset = CGSize.zero
        viewImage.layer.shadowOpacity = 1.0
        viewImage.layer.shadowRadius = 2.0
        viewImage.layer.masksToBounds = false
        viewImage.backgroundColor = UIColor.white
        CheckedImg.isHidden = true
        //viewImage.layer.cornerRadius = 5.0
    }

}
