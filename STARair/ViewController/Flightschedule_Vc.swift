//
//  Flightschedule_Vc.swift
//  HeyFlyer
//
//  Created by baps on 23/08/1940 Saka.
//  Copyright © 1940 nikunj. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class Flightschedule_Vc: UIViewController ,UITableViewDelegate , UITextFieldDelegate, UITableViewDataSource{
    var searchActive: Bool = false
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var ViewSearch: UIView!
    @IBOutlet var tblPlaces: UITableView!
    var SearchData: NSMutableArray = NSMutableArray()
    var arrTimeTableFlight:NSMutableArray = NSMutableArray()
    var StrAirportCode : String = "DXB"
    var StrAirportName : String = "Dubai Insternational Airport"
    var TypeOfFlight = "departure"
    var isDeparture:Bool = true
    @IBOutlet weak var lblLine2: UILabel!
    @IBOutlet weak var lblLeadingConstant: NSLayoutConstraint!
    @IBOutlet weak var lblLine: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ViewSearch.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        ViewSearch.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        ViewSearch.layer.shadowOpacity = 1.0
        ViewSearch.layer.shadowRadius = 4.0
        ViewSearch.layer.masksToBounds = false
        ViewSearch.layer.cornerRadius = 5.0
        
        
        lblLine.backgroundColor =  UIColor.init(hexString: "202794")
        lblLine2.backgroundColor =  UIColor.white
        let nibNameTimeMain = UINib(nibName: "TimeTableMain_Cell", bundle: nil)
        self.tblPlaces.register(nibNameTimeMain, forCellReuseIdentifier: "TimeTableMain_Cell")
getFlightTimeTableByAirportCode()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.title = "\(StrAirportCode) Time Table"
//        appDelegate.SetNavigationBarColor(self, leftmenu: "", rightmenu: "")
    }
    
    @objc func BackClick(){
        _ = navigationController?.popViewController(animated: true)
    }
    @IBAction func onclickbtnDeparture(_ sender:UIButton!) {
        // do cool stuff here
        TypeOfFlight = "departure"
       searchActive = false
        SearchData.removeAllObjects()
        txtSearch.text = ""
        txtSearch.endEditing(true)
            lblLine.backgroundColor =  UIColor.init(hexString: "202794")
            lblLine2.backgroundColor =  UIColor.white
       
        isDeparture = true
        tblPlaces.reloadData()
        getFlightTimeTableByAirportCode()
    }
    
    @IBAction func onclickbtnArrivle(_ sender:UIButton!) {
        // do cool stuff here
        TypeOfFlight = "arrival"
       searchActive = false
        SearchData.removeAllObjects()
        txtSearch.text = ""
        txtSearch.endEditing(true)
            lblLine2.backgroundColor =  UIColor.init(hexString: "202794")
            lblLine.backgroundColor =  UIColor.white
       
        isDeparture = false
        tblPlaces.reloadData()
        getFlightTimeTableByAirportCode()
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.text!.isEmpty{
            searchActive = false
            //self.view.endEditing(true)
            SearchData.removeAllObjects()
            tblPlaces.reloadData()
            
        } else {
            searchActive = true
            SearchData.removeAllObjects()
            
            DispatchQueue.global(priority: DispatchQueue.GlobalQueuePriority.default).async {
                
                if((textField.text?.characters.count)! > 1){
                    
                    for item in self.arrTimeTableFlight {
                        
                        let dic = item as? NSDictionary
                        //print(dic)
                        var CName: String = ""
                        var CCode: String = ""
                        var CCity: String = ""
                        
                        if let name = (dic?.object(forKey: "flight") as! NSDictionary).value(forKey: "iataNumber") as? String {
                            CName = name
                        }
                        
                        if let code = (dic?.object(forKey: "airline") as! NSDictionary).value(forKey: "name") as? String {
                            CCode = code
                        }
                        
//                        if let city = (dic?.object(forKey: "jobinfo") as! NSDictionary).value(forKey: "preffered") as? String {
//                            CCity = city
//                        }
                        
                        if((CName.lowercased().range(of: textField.text!.lowercased())  != nil || CCode.lowercased().range(of: textField.text!.lowercased())  != nil )){
                            
                            self.SearchData.add(dic!)
                        }
                    }
                    
                    DispatchQueue.main.async{
                        self.tblPlaces.reloadData()
                        print(self.SearchData)
                        // self.SearchData()
                    }
                }else{
                    self.searchActive = false
                    //self.view.endEditing(true)
                    self.SearchData.removeAllObjects()
                    self.tblPlaces.reloadData()
                }
                print(self.SearchData)
            }
        }
        return true
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(searchActive == true){
            return SearchData.count
        }
        else{
            return arrTimeTableFlight.count
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(searchActive == true){
            let cell = tableView.dequeueReusableCell(withIdentifier: "TimeTableMain_Cell", for: indexPath) as! TimeTableMain_Cell
            
            if let Name = (SearchData.object(at: indexPath.row) as! NSDictionary).value(forKey: "status") as? String
            {
                
                
                //                    let view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
                //                    let gradient = CAGradientLayer()
                //
                //                    gradient.frame = cell.lblStatus.bounds
                //                    gradient.colors = [UIColor.red.cgColor, UIColor.black.cgColor]
                //
                //                    cell.lblStatus.layer.insertSublayer(gradient, at: 0)
                cell.btnStatus.setTitle(Name, for: .normal)
                
                if Name == "active"
                {
                    // cell.btnStatus.setBackgroundImage(UIImage.init(named: "greadintGreen"), for: .normal)
                }
                else
                {
                    //cell.btnStatus.setBackgroundImage(UIImage.init(named: "Gradient-4"), for: .normal)
                }
            }
            
            if let type = (SearchData.object(at: indexPath.row) as! NSDictionary).value(forKey: "type") as? String
            {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
                //        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
                
                if type != "departure"
                {
                    
                    if let Name = ((SearchData.object(at: indexPath.row) as! NSDictionary).value(forKey: "departure") as? NSDictionary)?.value(forKey: "iataCode") as? String
                    {
                        cell.lblName.text = Name
                    }
                    
                    if let Name = ((SearchData.object(at: indexPath.row) as! NSDictionary).value(forKey: "departure") as? NSDictionary)?.value(forKey: "terminal") as? String
                    {
                        cell.lblGateNo.text = Name
                    }
                    
                    if let Name = ((SearchData.object(at: indexPath.row) as! NSDictionary).value(forKey: "departure") as? NSDictionary)?.value(forKey: "estimatedTime") as? String
                    {
                        var dateObj = dateFormatter.date(from: Name)
                        dateFormatter.dateFormat = "HH:mm"
                        let timeStr = dateFormatter.string(from: dateObj!)
                        cell.lblTime.text = timeStr
                    }
                    
                }
                else
                {
                    if let Name = ((SearchData.object(at: indexPath.row) as! NSDictionary).value(forKey: "arrival") as? NSDictionary)?.value(forKey: "iataCode") as? String
                    {
                        cell.lblName.text = Name
                    }
                    
                    if let Name = ((SearchData.object(at: indexPath.row) as! NSDictionary).value(forKey: "arrival") as? NSDictionary)?.value(forKey: "terminal") as? String
                    {
                        cell.lblGateNo.text = Name
                    }
                    
                    if let Name = ((SearchData.object(at: indexPath.row) as! NSDictionary).value(forKey: "arrival") as? NSDictionary)?.value(forKey: "estimatedTime") as? String
                    {
                        var dateObj = dateFormatter.date(from: Name)
                        dateFormatter.dateFormat = "HH:mm"
                        let timeStr = dateFormatter.string(from: dateObj!)
                        cell.lblTime.text = timeStr
                    }
                }
                
                if let Name = ((SearchData.object(at: indexPath.row) as! NSDictionary).value(forKey: "airline") as? NSDictionary)?.value(forKey: "name") as? String
                {
                    cell.lblFlightName.text = Name
                }
                
                if let Name = ((SearchData.object(at: indexPath.row) as! NSDictionary).value(forKey: "flight") as? NSDictionary)?.value(forKey: "iataNumber") as? String
                {
                    cell.lblFlightNO.text = Name
                }
                
                
                if let Name = ((SearchData.object(at: indexPath.row) as! NSDictionary).value(forKey: "airline") as? NSDictionary)?.value(forKey: "iataCode") as? String
                {
                    
                    
                    cell.imgFlag?.sd_setImage(with: URL(string:urlCuntryFlag + Name + ".png"), placeholderImage: UIImage(named: "usaflag"))
                    
                    
                }
                
            }
            return cell
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "TimeTableMain_Cell", for: indexPath) as! TimeTableMain_Cell
            
            if let Name = (arrTimeTableFlight.object(at: indexPath.row) as! NSDictionary).value(forKey: "status") as? String
            {
                
                
                //                    let view = UIView(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
                //                    let gradient = CAGradientLayer()
                //
                //                    gradient.frame = cell.lblStatus.bounds
                //                    gradient.colors = [UIColor.red.cgColor, UIColor.black.cgColor]
                //
                //                    cell.lblStatus.layer.insertSublayer(gradient, at: 0)
                cell.btnStatus.setTitle(Name, for: .normal)
                
                if Name == "active"
                {
//                     cell.btnStatus.setBackgroundImage(UIImage.init(named: "greadintGreen"), for: .normal)
                    cell.btnStatus.setTitleColor(UIColor.init(hexString: "32CD32"), for: .normal)
                }
                else if Name == "scheduled" {
                    cell.btnStatus.setTitleColor(UIColor.init(hexString: "32CD32"), for: .normal)
                }
                else if Name == "landed" {
                    cell.btnStatus.setTitleColor(UIColor.gray, for: .normal)
                }
                else
                {
//                    cell.btnStatus.setBackgroundImage(UIImage.init(named: "Gradient-4"), for: .normal)
                    cell.btnStatus.setTitleColor(UIColor.red, for: .normal)
                }
            }
            
            if let type = (arrTimeTableFlight.object(at: indexPath.row) as! NSDictionary).value(forKey: "type") as? String
            {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
                //        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
                
                if type != "departure"
                {
                    
                    if let Name = ((arrTimeTableFlight.object(at: indexPath.row) as! NSDictionary).value(forKey: "departure") as? NSDictionary)?.value(forKey: "iataCode") as? String
                    {
                        cell.lblName.text = Name
                    }
                    
                    if let Name = ((arrTimeTableFlight.object(at: indexPath.row) as! NSDictionary).value(forKey: "departure") as? NSDictionary)?.value(forKey: "terminal") as? String
                    {
                        cell.lblGateNo.text = Name
                    }
                    
                    if let Name = ((arrTimeTableFlight.object(at: indexPath.row) as! NSDictionary).value(forKey: "departure") as? NSDictionary)?.value(forKey: "estimatedTime") as? String
                    {
                        var dateObj = dateFormatter.date(from: Name)
                        dateFormatter.dateFormat = "HH:mm"
                        let timeStr = dateFormatter.string(from: dateObj!)
                        cell.lblTime.text = timeStr
                    }
                    
                }
                else
                {
                    if let Name = ((arrTimeTableFlight.object(at: indexPath.row) as! NSDictionary).value(forKey: "arrival") as? NSDictionary)?.value(forKey: "iataCode") as? String
                    {
                        cell.lblName.text = Name
                    }
                    
                    if let Name = ((arrTimeTableFlight.object(at: indexPath.row) as! NSDictionary).value(forKey: "arrival") as? NSDictionary)?.value(forKey: "terminal") as? String
                    {
                        cell.lblGateNo.text = Name
                    }
                    
                    if let Name = ((arrTimeTableFlight.object(at: indexPath.row) as! NSDictionary).value(forKey: "arrival") as? NSDictionary)?.value(forKey: "estimatedTime") as? String
                    {
                        var dateObj = dateFormatter.date(from: Name)
                        dateFormatter.dateFormat = "HH:mm"
                        let timeStr = dateFormatter.string(from: dateObj!)
                        cell.lblTime.text = timeStr
                    }
                }
                
                if let Name = ((arrTimeTableFlight.object(at: indexPath.row) as! NSDictionary).value(forKey: "airline") as? NSDictionary)?.value(forKey: "name") as? String
                {
                    cell.lblFlightName.text = Name
                }
                
                if let Name = ((arrTimeTableFlight.object(at: indexPath.row) as! NSDictionary).value(forKey: "flight") as? NSDictionary)?.value(forKey: "iataNumber") as? String
                {
                    cell.lblFlightNO.text = Name
                }
                
                
                if let Name = ((arrTimeTableFlight.object(at: indexPath.row) as! NSDictionary).value(forKey: "airline") as? NSDictionary)?.value(forKey: "iataCode") as? String
                {
                    
                    
                    cell.imgFlag?.sd_setImage(with: URL(string:urlCuntryFlag + Name + ".png"), placeholderImage: UIImage(named: "usaflag"))
                    
                    
                }
                
            }
            return cell
        }
        
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let RootObj = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FlightTimeTableDetail_Vc") as! FlightTimeTableDetail_Vc
//        RootObj.Data = arrTimeTableFlight.object(at: indexPath.row) as! NSDictionary
//        self.navigationController?.isNavigationBarHidden = true
//        self.navigationController?.pushViewController(RootObj, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    //MARK:- getFlightTimeTableByAirportCode  == 8
    func getFlightTimeTableByAirportCode(){
        
        appDelegate.showLoader()
        var param:String = ""
        param = String(format: "%@?key=%@& =%@&type=%@", GetAviationData,AviationKey,StrAirportCode,TypeOfFlight)
        
        //        http://aviation-edge.com/v2/public/timetable?key=13156c-13cf44&iataCode=amd&type=departure
        print(param)
        
        request(param, method: .get, encoding: JSONEncoding.default, headers:nil ).responseJSON { (responseData) in
            appDelegate.hideLoader()
            appDelegate.hideLoader()
            print((responseData.result.value))
            if((responseData.result.value) != nil) {
                
                if(responseData.response?.statusCode == 200){
                    
                    let swiftyJsonVar = JSON(responseData.result.value!)
                    if let resData = swiftyJsonVar.arrayObject {
                        
                        self.arrTimeTableFlight = NSMutableArray()
                        
                        self.arrTimeTableFlight = NSMutableArray(array: resData as [AnyObject])
                        print(self.arrTimeTableFlight)
                        self.tblPlaces.reloadData()
                    }
                }
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
