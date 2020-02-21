//
//  FlightTimeTableDetail_Vc.swift
//  HeyFlyer
//
//  Created by baps on 24/07/1940 Saka.
//  Copyright © 1940 nikunj. All rights reserved.
//

import UIKit
import SwiftMessageBar

class FlightTimeTableDetail_Vc: UIViewController {

    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var btnAddFlight: RoundCornerButton!
    @IBOutlet weak var lblTerminal: UILabel!
    @IBOutlet weak var lblGateNo: UILabel!
    @IBOutlet weak var lblActualTime: UILabel!
    @IBOutlet weak var lblScheduledTime: UILabel!
    @IBOutlet weak var lblTo: UILabel!
    @IBOutlet weak var lblFlightNum: UILabel!
    @IBOutlet weak var imgFlight: UIImageView!
    @IBOutlet weak var imgBackGround: UIImageView!
    var Data:NSDictionary = NSDictionary()
    var imgFlghtTell:UIImageView =  UIImageView()
    var imgAirline:UIImageView =  UIImageView()
    var FlightNo:String = String()
    var DepartureTime:String = String()
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(Data)
        if let status = Data.value(forKey: "status") as? String
        {
            lblStatus.text = status
        }
        if let FlightCode = (Data.value(forKey: "airline") as! NSDictionary).value(forKey: "iataCode") as? String
        {
            let a = FlightCode.lowercased()
            let b = "-logo.png"
            let c = a + b
            
            print(c)
            if let url = URL(string: urlimg + c) {
               // imgFlight.sd_setImage(with: url, placeholderImage: UIImage(named: "departure"))
                
            }
        }
        
        if let FlightCode = (Data.value(forKey: "airline") as! NSDictionary).value(forKey: "iataCode") as? String
        {
            if let NO = (Data.value(forKey: "flight") as! NSDictionary).value(forKey: "number") as? String
            {
                lblFlightNum.text = FlightCode + " " + NO
                FlightNo = FlightCode+NO
                
                if(FlightCode != ""){
                    
                    //self.imgFlghtTell.sd_setImage(with: URL(string:urlCuntryFlag + FlightCode + ".png"), placeholderImage: UIImage(named: "usaflag"))
                    
                    let letters = CharacterSet.letters
                    
                    let range = FlightCode.rangeOfCharacter(from: letters)
                    
                    
                    if let _ = range {
                        
                        let a = FlightCode.lowercased()
                        let b = "-logo.png"
                        let c = a + b
                        if let url = URL(string: urlimg + c) {
                           // self.imgAirline.sd_setImage(with: url)
                          //  self.imgAirline.sd_setImage(with: url, placeholderImage: UIImage(named: "departure"))
                            //imgAirline.frame = CGRect(x: 0, y: 23, width: 100, height: 30)
                        }
                    }
                    else {
                        self.imgAirline.image = UIImage(named: "departure")
                        //imgAirline.frame = CGRect(x: 0, y: 23, width: 100, height: 30)
                    }
                    //  txtFlightNo.text = code
                    
                }
            }
        }
        
        if let type = Data.value(forKey: "type") as? String
        {
            var Url :String = String()
            
            
            if let FlightCode = (Data.value(forKey: "departure") as! NSDictionary).value(forKey: "estimatedTime") as? String
            {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
                let dateObj = dateFormatter.date(from: FlightCode)
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let timeStr = dateFormatter.string(from: dateObj!)
                DepartureTime = timeStr
                
            }
            
            if type == "departure"
            {
                if let FlightCode = (Data.value(forKey: "arrival") as! NSDictionary).value(forKey: "iataCode") as? String
                {
                    Url = urlCityImg + FlightCode + ".jpg"
                    
                    let Name = getFlightTimeTableByAirportCode(AirportCode: FlightCode, IsTo: true)
                   
                }
                
                if let FlightCode = (Data.value(forKey: "arrival") as! NSDictionary).value(forKey: "terminal") as? String
                {
                    lblTerminal.text = FlightCode
                    
                    
                }
                
                if let FlightCode = (Data.value(forKey: "arrival") as! NSDictionary).value(forKey: "scheduledTime") as? String
                {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
                    let dateObj = dateFormatter.date(from: FlightCode)
                    dateFormatter.dateFormat = "HH:mm"
                    let timeStr = dateFormatter.string(from: dateObj!)
                   lblScheduledTime.text = timeStr
                    
                }
                
                if let FlightCode = (Data.value(forKey: "arrival") as! NSDictionary).value(forKey: "actualTime") as? String
                {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
                    let dateObj = dateFormatter.date(from: FlightCode)
                    dateFormatter.dateFormat = "HH:mm"
                    let timeStr = dateFormatter.string(from: dateObj!)
                    lblActualTime.text = timeStr
                    
                }
                
               
            }
            else
            {
                if let FlightCode = (Data.value(forKey: "departure") as! NSDictionary).value(forKey: "iataCode") as? String
                {
                    Url = urlCityImg + FlightCode + ".jpg"
                     let Name = getFlightTimeTableByAirportCode(AirportCode: FlightCode, IsTo: false)
                   
                }
                
                if let FlightCode = (Data.value(forKey: "departure") as! NSDictionary).value(forKey: "terminal") as? String
                {
                   lblTerminal.text = FlightCode
             
                }
                
                if let FlightCode = (Data.value(forKey: "departure") as! NSDictionary).value(forKey: "gate") as? String
                {
                    lblGateNo.text = FlightCode
                    
                }
                
                if let FlightCode = (Data.value(forKey: "departure") as! NSDictionary).value(forKey: "scheduledTime") as? String
                {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
                    let dateObj = dateFormatter.date(from: FlightCode)
                    dateFormatter.dateFormat = "HH:mm"
                    let timeStr = dateFormatter.string(from: dateObj!)
                    lblScheduledTime.text = timeStr
                }
                
                if let FlightCode = (Data.value(forKey: "departure") as! NSDictionary).value(forKey: "actualTime") as? String
                {
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
                    let dateObj = dateFormatter.date(from: FlightCode)
                    dateFormatter.dateFormat = "HH:mm"
                    let timeStr = dateFormatter.string(from: dateObj!)
                    lblActualTime.text = timeStr
                    
                }
            }
            
          
            
            
            if let url = URL(string: Url) {
                //self.imgBackGround.af_setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "city_place"), filter: nil, progress: nil, progressQueue: .main, imageTransition: .crossDissolve(0.2), runImageTransitionIfCached: false, completion: nil)
            }
        }
        
        // Do any additional setup after loading the view.
    }

    //MARK:- getFlightTimeTableByAirportCode  == 8
    func getFlightTimeTableByAirportCode(AirportCode:String , IsTo:Bool) -> String{
//        var Name :String = "sjkdajhsajd"
//        appDelegate.showLoader()
//        var param:String = ""
//        param = String(format: "%@?key=%@&codeIataAirport=%@", GetAirportCodeToName,AviationKey,AirportCode)
//
//        //        http://aviation-edge.com/v2/public/timetable?key=13156c-13cf44&iataCode=amd&type=departure
//        print(param)
//
//        request(param, method: .get, encoding: JSONEncoding.default, headers:nil ).responseJSON { (responseData) in
//            appDelegate.hideLoader()
//            appDelegate.hideLoader()
//            print((responseData.result.value))
//            if((responseData.result.value) != nil) {
//
//                if(responseData.response?.statusCode == 200){
//
//                    let swiftyJsonVar = JSON(responseData.result.value!)
//                    if let resData = swiftyJsonVar.arrayObject {
//                        print(resData)
//                        if let data = resData[0] as? NSDictionary
//                        {
//                            print(data)
//                             Name = data.value(forKey: "nameAirport") as! String
//                            if IsTo == true
//                            {
//                                self.lblTo.text = "To \(Name) (\(AirportCode))"
//
//                            }
//                            else
//                            {
//                                self.lblTo.text = "From \(Name) (\(AirportCode))"
//                            }
//
//
//                        }
//
//                    }
//                }
//            }
//        }
        
        return "Name"
    }
    
    
    //MARK:- Call api -
    //MARK:- Call api -
    func insert_journey(){
//        var UserId: String = ""
//        if let dics = StoreLocalData().GetDictionaryLocalStoreData(key: "Login") as? NSDictionary {
//            if(dics.count != 0){
//                if let strTemp = dics.object(forKey: "nUserId") as? String {
//                    UserId = strTemp
//                }
//            }
//        }
//
//        let params = [
//            "cFlightNo" : FlightNo,
//            "dtFlightDepartureDateTime" : DepartureTime,
//            ]
//
//        let headers: HTTPHeaders = [
//            "X-API-KEY": appDelegate.Key
//        ]
//
//
//
//        print(params)
//        request(kflightchecking, method: .post, parameters: params as Parameters, encoding: URLEncoding.default,headers: headers).responseJSON { (responseData) in
//
//            appDelegate.hideLoader()
//
//            var destination : String = ""
//            var source : String = ""
//            var dateSource : String = ""
//            var timeSource : String = ""
//            var dateDesti : String = ""
//            var timeDesti : String = ""
//            var airNameDesti : String = ""
//            var airNameSource : String = ""
//            var arrivalDelay : Int = 0
//            var departureDelay : Int = 0
//            var LocationCityDeparture1:String = ""
//            var LocationCityArrival1:String = ""
//            var cFlightStatus:String = ""
//            var cAircraftType:String = ""
//
//            print(responseData.result.value)
//
//
//            if((responseData.result.value) != nil) {
//                if(responseData.response?.statusCode == 200){
//                    let swiftyJsonVar = JSON(responseData.result.value!)
//                    if let resData = swiftyJsonVar.dictionary {
//                        if let StrTemp = resData["success"]?.stringValue {
//
//                            print(resData)
//
//                            if(StrTemp == "0"){
//
//                                let alertView = UIAlertController(title: "HeyFlyer", message: "invalid flight", preferredStyle: .alert)
//
//                                alertView.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (alertAction) -> Void in
//                                    self.navigationController?.popViewController(animated: true)
//                                }))
//                                self.present(alertView, animated: true, completion: nil)
//                            }else{
//
//                                print(resData)
//
//
//
//
//                                if let StrTemp1 = resData["result"]?.arrayObject{
//
//
//                                    var arrdata : NSMutableArray = NSMutableArray()
//                                    arrdata = NSMutableArray(array: StrTemp1 as [AnyObject])
//
//                                    print(resData.count)
//                                    if(resData.count == 0 ){
//
//                                    }else{
//
//                                        let dic = arrdata[0] as? NSDictionary
//
//                                        print(dic?.count)
//
//                                        if(dic?.count != nil){
//                                            if let StrTemporigin = dic?.object(forKey:"origin") as? NSDictionary{
//                                                print(StrTemporigin)
//
//
//                                                if let StrTemp2 = StrTemporigin.object(forKey:"alternate_ident") as? String{
//
//                                                    source = StrTemp2
//                                                    print(source)
//                                                }
//
//                                                if let StrTemp2 = StrTemporigin.object(forKey:"airport_name") as? String{
//
//                                                    airNameSource = StrTemp2
//                                                    print(source)
//                                                }
//
//                                                if let StrTemp2 = StrTemporigin.object(forKey:"city") as? String{
//
//
//                                                    print(StrTemp2)
//
//                                                    LocationCityDeparture1 = StrTemp2
//                                                }
//
//                                            }
//
//                                            if let StrTemporigin = dic?.object(forKey:"estimated_arrival_time") as? NSDictionary{
//                                                print(StrTemporigin)
//
//
//                                                if let StrTemp2 = StrTemporigin.object(forKey:"date") as? String{
//
//                                                    dateSource = StrTemp2
//                                                    print(source)
//                                                }
//
//                                                if let StrTemp2 = StrTemporigin.object(forKey:"time") as? String{
//
//                                                    timeSource = StrTemp2
//                                                    print(source)
//
//                                                }
//                                            }
//
//
//                                            if let StrTemporigin = dic?.object(forKey:"estimated_departure_time") as? NSDictionary{
//                                                print(StrTemporigin)
//
//
//                                                if let StrTemp2 = StrTemporigin.object(forKey:"date") as? String{
//
//                                                    dateDesti = StrTemp2
//                                                    print(source)
//                                                }
//
//                                                if let StrTemp2 = StrTemporigin.object(forKey:"time") as? String{
//
//                                                    timeDesti = StrTemp2
//                                                    print(source)
//                                                }
//                                            }
//
//
//                                            if let arrivaldelay1 = dic?.object(forKey:"arrival_delay") as? Int{
//
//                                                arrivalDelay = arrivaldelay1
//
//                                            }
//
//                                            if let departuredelay1 = dic?.object(forKey:"departure_delay") as? Int{
//                                                departureDelay = departuredelay1
//                                            }
//
//                                            if let arrivaldelay1 = dic?.object(forKey:"status") as? String{
//
//                                                cFlightStatus = arrivaldelay1
//
//                                            }
//
//                                            if let arrivaldelay1 = dic?.object(forKey:"aircrafttype") as? String{
//
//                                                cAircraftType = arrivaldelay1
//
//                                            }
//                                            print(departureDelay)
//                                            print(arrivalDelay)
//
//
//
//                                            if let StrTemporigin = dic?.object(forKey:"destination") as? NSDictionary{
//                                                print(StrTemporigin)
//
//                                                if let StrTemp2 = StrTemporigin.object(forKey:"alternate_ident") as? String{
//
//                                                    destination = StrTemp2
//                                                    print(source)
//                                                }
//
//                                                if let StrTemp2 = StrTemporigin.object(forKey:"city") as? String{
//                                                    print(StrTemp2)
//                                                    LocationCityArrival1 = StrTemp2
//                                                }
//
//                                                if let StrTemp2 = StrTemporigin.object(forKey:"airport_name") as? String{
//
//                                                    airNameDesti = StrTemp2
//                                                    print(source)
//                                                }
//
//                                            }
//
//                                            let RootObj:CheckIn_VC = CheckIn_VC(nibName:appDelegate.CheckDeviceType("CheckIn_VC"),bundle: nil)
//                                            self.view.endEditing(true)
//                                            RootObj.flightNo = self.FlightNo
//                                            RootObj.CheckInData = dic
//                                            RootObj.imgflight = self.imgFlghtTell.image!
//                                            RootObj.destination = destination
//                                            RootObj.source = source
//                                            RootObj.dateSource = dateSource
//                                            RootObj.timeSource = timeSource
//                                            RootObj.dateDesti = dateDesti
//                                            RootObj.timeDesti = timeDesti
//                                            RootObj.imgAirline1 = self.imgAirline.image!
//                                            RootObj.arrivalDelay = Int(arrivalDelay)
//                                            RootObj.departureDelay = departureDelay
//                                            // RootObj.flight = self.lblAirline.text!
//                                            // RootObj.flightName = self.flightName
//
//                                            RootObj.airNameDesti = airNameDesti
//                                            RootObj.airNameSource = airNameSource
//                                            RootObj.cFlightStatus = cFlightStatus
//                                            RootObj.cAircraftType = cAircraftType
//                                            RootObj.StrLocationCityDeparture = LocationCityDeparture1
//                                            RootObj.StrLocationCityArrival = LocationCityArrival1
//
//
//
//                                            self.navigationController?.pushViewController(RootObj, animated: true)
//                                        }else{
//                                            let RootObj:CheckIn_VC = CheckIn_VC(nibName:appDelegate.CheckDeviceType("CheckIn_VC"),bundle: nil)
//                                            RootObj.StrDataNilTag = "yes"
//                                            RootObj.flightNo = self.FlightNo
//                                            RootObj.imgflight = self.imgFlghtTell.image!
//                                            RootObj.imgAirline1 = self.imgAirline.image!
//                                            //RootObj.flight = self.lblAirline.text!
//                                            //RootObj.flightName = self.flightName
//                                            // RootObj.dateSource = self.StrDateDeparture
//                                            // RootObj.timeSource = self.StrTimeDeparture
//                                            self.navigationController?.pushViewController(RootObj, animated: true)
//                                        }
//
//                                    }
//                                }
//                            }
//                        }
//                    }
//                }else{
//                    let RootObj:CheckIn_VC = CheckIn_VC(nibName:appDelegate.CheckDeviceType("CheckIn_VC"),bundle: nil)
//                    RootObj.StrDataNilTag = "yes"
//                    RootObj.flightNo = self.FlightNo
//                    RootObj.imgflight = self.imgFlghtTell.image!
//                    RootObj.imgAirline1 = self.imgAirline.image!
//                    //RootObj.flight = self.lblAirline.text!
//                    // RootObj.flightName = self.flightName
//                    // RootObj.dateSource = self.StrDateDeparture
//                    //RootObj.timeSource = self.StrTimeDeparture
//                    self.navigationController?.pushViewController(RootObj, animated: true)
//                }
//            }
//            else{
//                //                let RootObj:CheckIn_VC = CheckIn_VC(nibName:appDelegate.CheckDeviceType("CheckIn_VC"),bundle: nil)
//                //                RootObj.StrDataNilTag = "yes"
//                //                RootObj.flightNo = self.lblFlightNo.text! + self.txtFlightNo.text!
//                //                RootObj.imgflight = self.imgFlghtTell.image!
//                //                RootObj.imgAirline1 = self.imgAirline.image!
//                //                RootObj.flight = self.lblAirline.text!
//                //                RootObj.flightName = self.flightName
//                //                RootObj.dateSource = self.StrDateDeparture
//                //                RootObj.timeSource = self.StrTimeDeparture
//                //                self.navigationController?.pushViewController(RootObj, animated: true)
//            }
//        }
    }
    @IBAction func onClickBtnBack(_ sender: Any) {
         self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func onClickBtnAddFlight(_ sender: Any) {
         insert_journey()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
