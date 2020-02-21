//
//  WhereLickTogoListCell.swift
//  HeyFlyer
//
//  Created by Nikunj on 17/03/18.
//  Copyright © 2018 nikunj. All rights reserved.
//

import UIKit

protocol WhereLickTogoListCellDelegate {
    func BtnWhereLickTogoList(cell: WhereLickTogoListCell)
    func FriendsUserProfile(data: NSDictionary,StrTypeTag: String)
}

class WhereLickTogoListCell: UITableViewCell, WhereLickCollectionViewDelegate {

    @IBOutlet var subviewHeight: NSLayoutConstraint?
    
    var delegate: WhereLickTogoListCellDelegate?
    @IBOutlet var collectionview: UICollectionView?
    
    var strImageUrlKey: String = ""
    var strNameKey: String = ""
    var strGroupKey: String = ""
    var strTimeKey: String = ""
    
    @IBOutlet var lblTitle: UILabel?
    
    var regardView = WhereLickCollectionView.instanceFromNib()
    @IBOutlet var subView: UIView?
    
    var arrWhereLickTogoList = NSMutableArray(){
        didSet{
            regardView.frame = (subView?.bounds)!
            regardView.strNameKey = strNameKey
            regardView.strImageUrlKey = strImageUrlKey
            regardView.strTypes = (lblTitle?.text)!
            regardView.arrWhereLickTogoList = NSMutableArray(array: arrWhereLickTogoList)
            regardView.delegate = self
            self.subView?.addSubview(regardView)
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func BtnWhereLickTogoListClick(sender: Any){
        if delegate != nil {
            delegate?.BtnWhereLickTogoList(cell: self)
        }
    }
    
    func MeetupUserData(userData: NSDictionary, StrTypeTag: String) {
        if delegate != nil {
            delegate?.FriendsUserProfile(data: userData,StrTypeTag: (lblTitle?.text)! )
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
