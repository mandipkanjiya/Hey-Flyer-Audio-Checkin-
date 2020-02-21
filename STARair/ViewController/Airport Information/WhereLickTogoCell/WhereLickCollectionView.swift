//
//  WhereLickCollectionView.swift
//  HeyFlyer
//
//  Created by Nikunj on 17/03/18.
//  Copyright © 2018 nikunj. All rights reserved.
//

import UIKit

protocol WhereLickCollectionViewDelegate {
    func MeetupUserData(userData: NSDictionary,StrTypeTag:String)
}

class WhereLickCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet var collectionview: UICollectionView?
    
    var strImageUrlKey: String = ""
    var strNameKey: String = ""
    var strGroupKey: String = ""
    var strTimeKey: String = ""
    
    var strTypes: String = ""
    
    var delegate: WhereLickCollectionViewDelegate?
    
    var arrWhereLickTogoList = NSMutableArray(){
        didSet{
            
            
            
            //AirportInformation_Cell
            let nibName = UINib(nibName: "AirportInformation_Cell", bundle: nil)
            collectionview?.register(nibName, forCellWithReuseIdentifier: "AirportInformation_Cell")
            
            //if self.strTypes == "Meetups" {
            let nibName1 = UINib(nibName: "MeetupCell", bundle: nil)
            collectionview?.register(nibName1, forCellWithReuseIdentifier: "MeetupCell")
            //}
            // else if self.strTypes == "Pics #" {
            let nibName2 = UINib(nibName: "PleaceDetail_Cell", bundle: nil)
            collectionview?.register(nibName2, forCellWithReuseIdentifier: "PleaceDetail_Cell")
            //}
            //else{
            let nibName3 = UINib(nibName: "WherLicktoGo_Cell", bundle: nil)
            collectionview?.register(nibName3, forCellWithReuseIdentifier: "WherLicktoGo_Cell")
            //}
            
            let nibName4 = UINib(nibName: "HomeCollectionCell", bundle: nil)
            collectionview?.register(nibName4, forCellWithReuseIdentifier: "HomeCollectionCell")
            
            
            collectionview?.dataSource = self
            collectionview?.delegate = self
            collectionview?.reloadData()
        }
    }
    
    
    class func instanceFromNib() -> WhereLickCollectionView {
        return UINib(nibName: "WhereLickCollectionView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! WhereLickCollectionView
    }
    
    override func awakeFromNib() {
        
        
    }
    
    //MARK: - CollectionView Delegate Method
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        if self.strTypes == "Airport Information" {
            return CGSize(width: 120, height: 170)
        }
        else if self.strTypes == "Flyers in the City" {
            return CGSize(width: 60, height: 104)
        }
        else if self.strTypes == "Pics #" {
            return CGSize(width: 150, height: 150)
        }
        else{
            return CGSize(width: 180, height: 200)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if arrWhereLickTogoList.count > 0{
            return arrWhereLickTogoList.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
       
        if (self.strTypes == "Airport Information"){
            
            if let  cell = collectionview?.dequeueReusableCell(withReuseIdentifier: "AirportInformation_Cell", for: indexPath) as? AirportInformation_Cell {
                
//                let dic = arrWhereLickTogoList[indexPath.row] as? NSDictionary
//
//                cell.DataDic = dic
//
//
//
//                if let StrTemp = dic?.object(forKey: "Icon") as? String {
//
//                    cell.ProfileImg.sd_setImage(with: URL(string:StrTemp as String), placeholderImage: UIImage(named: ""))
//
//
//
//                }
//
//
//
//                if let StrTemp = dic?.object(forKey: "CName") as? String {
//                    cell.lblname.text = StrTemp
//                }
//
                return cell
            }
            else{
                return UICollectionViewCell()
            }
            
            
        }
        if (self.strTypes == "Meetups") {
            
            if let  cell = collectionview?.dequeueReusableCell(withReuseIdentifier: "MeetupCell", for: indexPath) as? MeetupCell {
                
                let dic = arrWhereLickTogoList[indexPath.row] as? NSDictionary
                cell.DataDic = dic
                
                if let StrTemp = dic?.object(forKey: "name") as? String {
                    cell.lblTitle.text =  StrTemp
                }
                
                if let StrTemp = dic?.object(forKey: "time") as? Float {
                    cell.lblDate.text = self.milisecondsConvertDate(miliseconds:StrTemp)
                }
                
                if let StrTemp = dic?.object(forKey: "time") as? Float {
                    cell.lblTime.text = self.milisecondsConvertDateTime(miliseconds:StrTemp)
                }
                
                if let StrTemp = dic?.object(forKey: "time") as? Float {
                    cell.lblMonth.text = self.milisecondsConvertDateMonth(miliseconds:StrTemp)
                }
                
                if let groupDic = dic?.object(forKey: "group") as? NSDictionary {
                    if let StrTemp = groupDic.object(forKey: "name") as? String {
                        cell.lblGroupName.text = "Hosted By: " + StrTemp
                    }
                }
                return cell
            }
            else{
                return UICollectionViewCell()
            }
        }
        if (self.strTypes == "Flyers in the City"){
            
            if let  cell = collectionview?.dequeueReusableCell(withReuseIdentifier: "HomeCollectionCell", for: indexPath) as? HomeCollectionCell {
                
                cell.userProfile.layer.borderColor = UIColor.white.cgColor
                cell.userProfile.layer.borderWidth = 2
                
                if let dic = arrWhereLickTogoList[indexPath.row] as? NSDictionary {
                    cell.DataDic = dic
                    
                    if let name = dic.object(forKey: "cName") as? String {
                        cell.lblName.text = name
                    }
                    
                    if let ProfileImage = dic.object(forKey: "cProfileImage") as? String {
                        if let url = URL(string: ProfileImage) {
                            //cell.userProfile?.af_setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "photo"), filter: nil, progress: nil, progressQueue: .main, imageTransition: .crossDissolve(0.2), runImageTransitionIfCached: true, completion: nil)
                        }
                    }
                }
                return cell
            }
            else{
                return UICollectionViewCell()
            }
        }
        if (self.strTypes == "Shops & Dine") {
            
            if let  cell = collectionview?.dequeueReusableCell(withReuseIdentifier: "WherLicktoGo_Cell", for: indexPath) as? WherLicktoGo_Cell {
                
                if let dic = arrWhereLickTogoList[indexPath.row] as? NSDictionary{
                    cell.DataDic = dic
                    
                    if let StrTemp = dic.object(forKey: "cPlaceImage") as? String {
                        if let url =  URL(string: StrTemp) {
                            //cell.ProfileImg.af_setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "Resturant"), filter: nil, progress: nil, progressQueue: .main, imageTransition: .crossDissolve(0.2), runImageTransitionIfCached: false, completion: nil)
                            
                        }else{
                            cell.ProfileImg.image = #imageLiteral(resourceName: "Resturant")
                        }
                    }
                    
                    if let StrTemp = dic.object(forKey: "cPlaceName") as? String {
                        cell.lblname.text = StrTemp
                    }
                    
                    return cell
                }
            }
            else{
                return UICollectionViewCell()
            }
        }
        if (self.strTypes == "Places"){
            
            if let  cell = collectionview?.dequeueReusableCell(withReuseIdentifier: "WherLicktoGo_Cell", for: indexPath) as? WherLicktoGo_Cell {
                
                if let dic = arrWhereLickTogoList[indexPath.row] as? NSDictionary {
                    cell.DataDic = dic
                    
                    
                    
                    if let photoDic = dic.object(forKey: "photos") as? NSArray{
                        for item in photoDic {
                            if let imageData = item as? NSDictionary {
                                if let StrTemp = imageData.object(forKey: "imageURL") as? String {
                                    
                                    let strUrl = StrTemp.replacingOccurrences(of: "\n", with: "")
                                    
                                   // cell.ProfileImg.sd_setImage(with: URL(string:strUrl as String), placeholderImage: UIImage(named: "Place"))
                                }
                            }
                        }
                    }
                    
                    if let StrTemp = dic.object(forKey: "name") as? String {
                        cell.lblname.text = StrTemp
                    }
                }
                return cell
            }
            else{
                return UICollectionViewCell()
            }
        }
        if (self.strTypes == "Pics #") {
            
            if let  cell = collectionview?.dequeueReusableCell(withReuseIdentifier: "PleaceDetail_Cell", for: indexPath) as? PleaceDetail_Cell {
                
                let image = arrWhereLickTogoList[indexPath.item] as? String
                if let url =  URL(string: image!) {
                    //cell.img.af_setImage(withURL: url, placeholderImage:#imageLiteral(resourceName: "instagram"), filter: nil, progress: nil, progressQueue: .main, imageTransition: .crossDissolve(0.2), runImageTransitionIfCached: false, completion: nil)
                    
                }
                
                cell.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
                cell.layer.shadowOffset = CGSize(width: 0, height: 3)
                cell.layer.shadowOpacity = 1.0
                cell.layer.shadowRadius = 10.0
                cell.layer.cornerRadius = 5.0
                cell.layer.masksToBounds = false
                
                return cell
            }
            else{
                return UICollectionViewCell()
            }
        }
        else{
            if let  cell = collectionview?.dequeueReusableCell(withReuseIdentifier: "WherLicktoGo_Cell", for: indexPath) as? WherLicktoGo_Cell {
                
                let dic = arrWhereLickTogoList[indexPath.row] as? NSDictionary
                
                cell.DataDic = dic
                
                if let StrTemp = dic?.object(forKey: strImageUrlKey) as? String {
                    let strUrl = StrTemp.replacingOccurrences(of: "\n", with: "")
                    
                    if let url =  URL(string: strUrl){
                        
                       // cell.ProfileImg.af_setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "events"), filter: nil, progress: nil, progressQueue: .main, imageTransition: .crossDissolve(0.2), runImageTransitionIfCached: false, completion: nil)
                    }
                }
                
                if let StrTemp = dic?.object(forKey: strTimeKey) as? String {
                    cell.lblDate.text = StrTemp
                }
                
                if let StrTemp = dic?.object(forKey: strNameKey) as? String {
                    cell.lblname.text = StrTemp
                }
                
                return cell
            }
            else{
                return UICollectionViewCell()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
     
        if (self.strTypes == "Airport Information"){
            if let dic = arrWhereLickTogoList[indexPath.row] as? NSDictionary {
                if delegate != nil {
                    delegate?.MeetupUserData(userData: dic, StrTypeTag: strTypes)
                }
            }
        }
        else if (self.strTypes == "Flyers in the City"){
            if let dic = arrWhereLickTogoList[indexPath.row] as? NSDictionary {
                if delegate != nil {
                    delegate?.MeetupUserData(userData: dic, StrTypeTag: strTypes)
                }
            }
        }
        else if (self.strTypes == "Shops & Dine"){
            if let dic = arrWhereLickTogoList[indexPath.row] as? NSDictionary {
                if delegate != nil {
                    delegate?.MeetupUserData(userData: dic, StrTypeTag: strTypes)
                }
            }
        }
       else if (self.strTypes == "Meetups"){
            if let dic = arrWhereLickTogoList[indexPath.row] as? NSDictionary {
               if delegate != nil {
                    delegate?.MeetupUserData(userData: dic, StrTypeTag: strTypes)
                }
            }
        }
        else if(self.strTypes == "Events"){
            if let dic = arrWhereLickTogoList[indexPath.row] as? NSDictionary {
                if delegate != nil {
                    delegate?.MeetupUserData(userData: dic, StrTypeTag: strTypes)
                }
            }
        }
        else if(self.strTypes == "Places"){
            if let dic = arrWhereLickTogoList[indexPath.row] as? NSDictionary {
                if delegate != nil {
                    delegate?.MeetupUserData(userData: dic, StrTypeTag: strTypes)
                }
            }
        }
        else if(self.strTypes == "Pics #"){
            if let dic = arrWhereLickTogoList[indexPath.row] as? NSDictionary {
                if delegate != nil {
                    delegate?.MeetupUserData(userData: dic, StrTypeTag: strTypes)
                }
            }
        }
        
        
        //        "Airport Information"
        //        "Flyers in the City"  == To Do
        //        "Shops & Dine"
        //        "Meetups"
        //        "Events"  == TO DO
        //        "Places"  == TO DO
        //        "Pics #"
    }
    
    //MARK: - Date Convert Methods -
    func dateConvert(strDate : String) -> String {
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from: strDate)!
        dateFormatter.dateFormat = "MMM dd, yyyy"
        dateFormatter.locale = tempLocale // reset the locale
        let dateString = dateFormatter.string(from: date)
       
        return dateString
    }
    func milisecondsConvertDate (miliseconds : Float) -> String {
        let date = NSDate(timeIntervalSince1970:TimeInterval(miliseconds / 1000.0))
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "dd"
        dateFormatter.locale = tempLocale
        let dateString = dateFormatter.string(from: date as Date)
        
        return dateString
        
    }
    
    func milisecondsConvertDateTime(miliseconds : Float) -> String {
        let date = NSDate(timeIntervalSince1970:TimeInterval(miliseconds / 1000.0))
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "HH:mm a"
        dateFormatter.locale = tempLocale
        let dateString = dateFormatter.string(from: date as Date)
        
        return dateString
        
    }
    
    func milisecondsConvertDateMonth(miliseconds : Float) -> String {
        let date = NSDate(timeIntervalSince1970:TimeInterval(miliseconds / 1000.0))
        let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "MMM"
        dateFormatter.locale = tempLocale
        let dateString = dateFormatter.string(from: date as Date)
        
        return dateString
        
    }
    
    
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
