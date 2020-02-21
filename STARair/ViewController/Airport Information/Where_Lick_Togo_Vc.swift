
import UIKit
import SwiftMessageBar
import Alamofire
import SDWebImage

class Where_Lick_Togo_Vc: UIViewController, WhereLickTogoListCellDelegate,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,WhereToGoFlyers_Cell_Delegate,UICollectionViewDataSource,UICollectionViewDelegate {
    
    var DataDic:NSDictionary = NSDictionary()
    var StrCityName : String = "Dubai"
    var StrAirportCode : String = "DXB"
    var StrAirportName : String = ""
    var Lat :String = ""
    var Long :String = ""
    var TypeOfFlight = "departure"
    var Airportcode :String = String()
    var isDeparture:Bool = true
    @IBOutlet weak var tblFlightTime: UITableView!
    @IBOutlet var lblAirportName:UILabel!
    @IBOutlet var lblAirportCode:UILabel!
    @IBOutlet var lblCityName:UILabel!
    @IBOutlet var lblweather:UILabel!
    @IBOutlet var Imgweather:UIImageView!
    @IBOutlet var ImgFlagHeader:UIImageView!
    @IBOutlet var ImgAirport:UIImageView!
    @IBOutlet var lblmsg:UILabel!
    var arrTimeTableFlight:NSMutableArray = NSMutableArray()
    @IBOutlet var tblPlaces: UITableView!
    var NoOfCell = NSMutableArray()
    var arrdata = NSMutableArray()
    @IBOutlet var HeaderView:UIView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    
    //Check IN
    
    @IBOutlet var VWCheckIn: UIView?
    @IBOutlet var imgAirline:UIImageView!
    @IBOutlet var lblAirline:UILabel!
    @IBOutlet var lbldateD:UILabel!
    @IBOutlet var lbltimeD:UILabel!
    @IBOutlet var btnDeparture:UIButton!
    @IBOutlet var imgFlghtTell:UIImageView!
    @IBOutlet var txtFlightNo:UITextField!
    @IBOutlet var lblFlightNo:UILabel!
    @IBOutlet var myDatePicker:UIDatePicker!
    var datePicker:UIDatePicker!
    
    var StrDateDeparture:String = ""
    var StrTimeDeparture:String = ""
    var flightName:String = ""
    
    
    
    var identifire: String = "WhereToGoFlyers_Cell"
    
    var Str_ChoiceTab:String = "information"
    
    
    @IBOutlet var vwInformation:UIView!
    @IBOutlet var vwAirport_Information:UIView!
    @IBOutlet var vwFlyersinTheCity:UIView!
    @IBOutlet var vwShopsDine:UIView!
    @IBOutlet var vwMeetups:UIView!
    @IBOutlet var vwEvents:UIView!
    @IBOutlet var vwPlaces:UIView!
    @IBOutlet var vwPics:UIView!
    
    @IBOutlet var collectionviewAirport_Information: UICollectionView!
    var arrScrolldataAirport_Information: NSMutableArray = NSMutableArray()
    
    @IBOutlet var collectionviewFlyersInTheCity: UICollectionView!
    var arrScrolldataFlyersInTheCity: NSMutableArray = NSMutableArray()
    
    @IBOutlet var collectionviewShops_Dine: UICollectionView!
    var arrScrolldataShops_Dine: NSMutableArray = NSMutableArray()
    
    @IBOutlet var collectionviewMeetups: UICollectionView!
    var arrScrolldataMeetups: NSMutableArray = NSMutableArray()
    
    @IBOutlet var collectionviewEvents: UICollectionView!
    var arrScrolldataEvents: NSMutableArray = NSMutableArray()
    
    @IBOutlet var collectionviewPlaces: UICollectionView!
    var arrScrolldataPlaces: NSMutableArray = NSMutableArray()
    
    @IBOutlet var collectionviewPics: UICollectionView!
    var arrScrolldataPics: NSMutableArray = NSMutableArray()
    
    
    
    //MARK:-
    //MARK:- viewDidLoad -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //AirportInformation_Cell
        let nibName2 = UINib(nibName: "AirportInformation_Cell", bundle: nil)
        collectionviewAirport_Information.register(nibName2, forCellWithReuseIdentifier: "AirportInformation_Cell")
        self.collectionviewAirport_Information.delegate = self
        self.collectionviewAirport_Information.dataSource = self
        
        //Flyers in the City
        let nibName3 = UINib(nibName: "HomeCollectionCell", bundle: nil)
        collectionviewFlyersInTheCity.register(nibName3, forCellWithReuseIdentifier: "HomeCollectionCell")
        self.collectionviewFlyersInTheCity.delegate = self
        self.collectionviewFlyersInTheCity.dataSource = self
        
        //Shops & Dine
        let nibName4 = UINib(nibName: "WherLicktoGo_Cell", bundle: nil)
        collectionviewShops_Dine.register(nibName4, forCellWithReuseIdentifier: "WherLicktoGo_Cell")
        self.collectionviewShops_Dine.delegate = self
        self.collectionviewShops_Dine.dataSource = self
        
        //Meetups
        let nibName5 = UINib(nibName: "MeetupCell", bundle: nil)
        collectionviewMeetups.register(nibName5, forCellWithReuseIdentifier: "MeetupCell")
        self.collectionviewMeetups.delegate = self
        self.collectionviewMeetups.dataSource = self
        
        //Events
        let nibName6 = UINib(nibName: "WherLicktoGo_Cell", bundle: nil)
        collectionviewEvents.register(nibName6, forCellWithReuseIdentifier: "WherLicktoGo_Cell")
        self.collectionviewEvents.delegate = self
        self.collectionviewEvents.dataSource = self
        
        //Places
        let nibName7 = UINib(nibName: "WherLicktoGo_Cell", bundle: nil)
        collectionviewPlaces.register(nibName7, forCellWithReuseIdentifier: "WherLicktoGo_Cell")
        self.collectionviewPlaces.delegate = self
        self.collectionviewPlaces.dataSource = self
        
        //Pics #
        let nibName8 = UINib(nibName: "PleaceDetail_Cell", bundle: nil)
        collectionviewPics.register(nibName8, forCellWithReuseIdentifier: "PleaceDetail_Cell")
        self.collectionviewPics.delegate = self
        self.collectionviewPics.dataSource = self
        
        
        tblPlaces.tableHeaderView = HeaderView
        tblPlaces.tableFooterView = vwInformation
        
        let nibName = UINib(nibName: "WhereLickTogoListCell", bundle: nil)
        self.tblPlaces.register(nibName, forCellReuseIdentifier: "WhereLickTogoListCell")
        
        
        let nibNameTime = UINib(nibName: "TimeTable_Cell", bundle: nil)
        self.tblPlaces.register(nibNameTime, forCellReuseIdentifier: "TimeTable_Cell")
        
        let nibNameTimeMain = UINib(nibName: "TimeTableMain_Cell", bundle: nil)
        self.tblPlaces.register(nibNameTimeMain, forCellReuseIdentifier: "TimeTableMain_Cell")
        if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad) {
            identifire = "WhereToGoFlyers_Cell_ipad"
        }
        else{
            identifire = "WhereToGoFlyers_Cell"
        }
        let nibName1 = UINib(nibName: identifire, bundle: nil)
        self.tblPlaces.register(nibName1, forCellReuseIdentifier: identifire)
        
        
        self.tblPlaces.contentInset = UIEdgeInsets.init(top: -44, left: 0, bottom: 0, right: 0)
        tblPlaces.estimatedRowHeight = 250
        
        let sortedViews = segmentedControl.subviews.sorted( by: { $0.frame.origin.x < $1.frame.origin.x } )
        sortedViews[0].tintColor = UIColor.init(hexString: "D8131B")
        sortedViews[1].tintColor = UIColor.init(hexString: "7E7E7E")
        sortedViews[2].tintColor = UIColor.init(hexString: "7E7E7E")
        
        print(DataDic)
        if(DataDic.count != 0){
            
//            if let strTmp = DataDic.object(forKey: "city") as? String {
//                StrCityName = strTmp
//                self.lblCityName.text = strTmp
//            }
//
//            if let strTmp = DataDic.object(forKey: "CountryCode") as? String {
//                let letters = CharacterSet.letters
//                let range = strTmp.rangeOfCharacter(from: letters)
//                if let _ = range {
//                    let a = strTmp.lowercased()
//                    let b = ".png"
//                    let c = a + b
//
//                    if let url = URL(string: urlFlag + c) {
//                        self.ImgFlagHeader.af_setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "usaflag"), filter: nil, progress: nil, progressQueue: .main, imageTransition: .crossDissolve(0.2), runImageTransitionIfCached: true, completion: nil)
//                    }
//                }
//                else {
//                    self.ImgFlagHeader.image = #imageLiteral(resourceName: "usaflag")
//                }
//            }
//            else{
//                 self.ImgFlagHeader.image = #imageLiteral(resourceName: "usaflag")
//            }
//
            if let strTmp = DataDic.object(forKey: "code") as? String {
                print(strTmp)
               // CodeFlagHeader(Code: strTmp)
                Airportcode = strTmp
//                let CityUrl = urlCityImg + strTmp + ".jpg"
//
//
//
//                if let url = URL(string: CityUrl) {
//                    self.ImgAirport.af_setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "city_place"), filter: nil, progress: nil, progressQueue: .main, imageTransition: .crossDissolve(0.2), runImageTransitionIfCached: false, completion: nil)
//                }

                StrAirportCode = strTmp

                lblAirportCode.text = strTmp
            }
            else if let strTmp = DataDic.object(forKey: "airportcode") as? String {
                print(strTmp)
                // CodeFlagHeader(Code: strTmp)
                Airportcode = strTmp
                //                let CityUrl = urlCityImg + strTmp + ".jpg"
                //
                //
                //
                //                if let url = URL(string: CityUrl) {
                //                    self.ImgAirport.af_setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "city_place"), filter: nil, progress: nil, progressQueue: .main, imageTransition: .crossDissolve(0.2), runImageTransitionIfCached: false, completion: nil)
                //                }
                
                StrAirportCode = strTmp
                
                lblAirportCode.text = strTmp
            }
//            if let strTmp = DataDic.object(forKey: "lat") as? String {
//                Lat = strTmp
//            }
//            if let strTmp = DataDic.object(forKey: "lon") as? String {
//                Long = strTmp
//            }
//            if let strTmp = DataDic.object(forKey: "name") as? String {
//
//                lblAirportName.text! = strTmp
//                self.lblAirportName.sizeToFit()
//
//                self.HeaderView.frame.size.height =  self.HeaderView.frame.size.height + self.lblAirportName.frame.size.height
//            }
            getairportDetails()
        }
       
        
        //fire analitics event
        
       
        
        let formattedString = StrCityName.replacingOccurrences(of: " ", with: "")
        StrCityName = formattedString
        
        //appDelegate.showLoader()
        
        self.perform(#selector(self.getAllAirportData_api), with: nil, afterDelay: 0.0)
        self.perform(#selector(self.GetCityLiveInUser), with: nil, afterDelay: 0.1)
        self.perform(#selector(self.GetRestaurants), with: nil, afterDelay: 0.2)
        self.perform(#selector(self.Meetup_API), with: nil, afterDelay: 0.3)
        self.perform(#selector(self.getEvents_api), with: nil, afterDelay: 0.4)
        self.perform(#selector(self.getPlace_api), with: nil, afterDelay: 0.5)
        self.perform(#selector(self.PinterestAPI), with: nil, afterDelay: 0.6)
        
        
        
        
        //============== Internet Error ===============
        if (Network.isConnectedToNetwork() == false){
            return
        }
        
    }
    
    //MARK:-
    //MARK:- viewWillAppear -
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(appDelegate.UserId != ""){
            if(Str_ChoiceTab == "Flyers"){
                self.tblPlaces.tableFooterView = nil
                self.NoOfCell = NSMutableArray()
                self.tblPlaces.reloadData()
                self.get_discussiondetail()
            }
            else if(Str_ChoiceTab == "CheckIn"){
                self.NoOfCell = NSMutableArray()
                self.tblPlaces.reloadData()
                self.tblPlaces.tableFooterView = VWCheckIn
            }
        }
        getCurrentWeather_api()
        lblmsg.isHidden = true
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK:- Button Click
    
    @IBAction func BtnBackClick(_ sender: AnyObject){
        
          _ = navigationController?.popViewController(animated: true)
       
        
    }
    
    
    
    
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            NSLog("History selected")
            Str_ChoiceTab = "information"
            
            self.lblmsg.isHidden = true
            
            tblPlaces.tableFooterView = nil
            self.NoOfCell = NSMutableArray()
            tblPlaces.reloadData()
            
            /* appDelegate.showLoader()
            self.perform(#selector(self.getAllAirportData_api), with: nil, afterDelay: 0.0)
            self.perform(#selector(self.GetCityLiveInUser), with: nil, afterDelay: 0.2)
            self.perform(#selector(self.GetRestaurants), with: nil, afterDelay: 0.4)
            self.perform(#selector(self.Meetup_API), with: nil, afterDelay: 0.6)
            self.perform(#selector(self.getEvents_api), with: nil, afterDelay: 0.8)
            self.perform(#selector(self.getPlace_api), with: nil, afterDelay: 1.0)
            self.perform(#selector(self.PinterestAPI), with: nil, afterDelay: 1.2)*/
            
            tblPlaces.tableFooterView = vwInformation
            
        case 1:
            
            Str_ChoiceTab = "Flyers"
            self.tblPlaces.tableFooterView = nil
            self.NoOfCell = NSMutableArray()
            self.tblPlaces.reloadData()
            self.lblmsg.isHidden = true
            if(appDelegate.UserId == ""){
                segmentedControl.selectedSegmentIndex = 0
                Str_ChoiceTab = "information"
                
                self.lblmsg.isHidden = true
                
                tblPlaces.tableFooterView = nil
                self.NoOfCell = NSMutableArray()
                tblPlaces.reloadData()
 tblPlaces.tableFooterView = vwInformation
                
            }else{
                
                self.get_discussiondetail()
            }
        case 2:
           // getFlightTimeTableByAirportCode()
            Str_ChoiceTab = "CheckIn"
//            self.lblmsg.isHidden = true
//            tblPlaces.tableFooterView = nil
//            self.NoOfCell = NSMutableArray()
//            self.tblPlaces.reloadData()
            if(appDelegate.UserId == ""){
                 segmentedControl.selectedSegmentIndex = 0
                Str_ChoiceTab = "information"
                
                self.lblmsg.isHidden = true
                
                tblPlaces.tableFooterView = nil
                self.NoOfCell = NSMutableArray()
                tblPlaces.reloadData()
                tblPlaces.tableFooterView = vwInformation
               
            }else{
                Str_ChoiceTab = "information"
                
                self.lblmsg.isHidden = true
                
                tblPlaces.tableFooterView = nil
                self.NoOfCell = NSMutableArray()
                tblPlaces.reloadData()
                
                tblPlaces.tableFooterView = vwInformation
                segmentedControl.selectedSegmentIndex = 0
//                let controller1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Flightschedule_Vc") as! Flightschedule_Vc
//                controller1.StrAirportCode = StrAirportCode
//               self.navigationController?.pushViewController(controller1, animated: true)
            }
            
        default:
            break;
        }
        
        let sortedViews = sender.subviews.sorted( by: { $0.frame.origin.x < $1.frame.origin.x } )
        
        for (index, view) in sortedViews.enumerated() {
            if index == sender.selectedSegmentIndex {
                view.tintColor = UIColor.init(hexString: "D8131B")
            } else {
                view.tintColor =  UIColor.init(hexString: "7E7E7E")
            }
        }
    }
    
    //MARK:- Events Call api  == 1
    
    @objc func getEvents_api(){
        
        self.vwInformation.frame.size.height =  self.vwInformation.frame.size.height - self.vwEvents.frame.size.height

        self.vwEvents.heightAnchor.constraint(equalToConstant: 0 ).isActive = true
        self.tblPlaces.tableFooterView = self.vwInformation
        self.tblPlaces.reloadData()
//        //remove this code after api working
//        self.vwInformation.frame.size.height =  self.vwInformation.frame.size.height - self.vwEvents.frame.size.height
//
//        self.vwEvents.heightAnchor.constraint(equalToConstant: 0 ).isActive = true
//        self.tblPlaces.tableFooterView = self.vwInformation
//        self.tblPlaces.reloadData()
//
//        let params = [
//            "city" :StrCityName
//        ]
//
//
//
//        request(kfacebookEvent, method: .post, parameters: params as Parameters, encoding: URLEncoding.default).responseJSON { (responseData) in
//
//
//
//            if((responseData.result.value) != nil) {
//                if(responseData.response?.statusCode == 200){
//                    let swiftyJsonVar = JSON(responseData.result.value!)
//
//                    if let resData = swiftyJsonVar.dictionary {
//
//                        if let resultData = resData["data"]?.arrayObject{
//                            if(resultData.count != 0){
//                                self.arrScrolldataEvents = NSMutableArray()
//                                self.arrScrolldataEvents = NSMutableArray(array: resultData)
//                                self.collectionviewEvents.reloadData()
//                            }
//                        }
//
//                        print(self.arrScrolldataEvents.count)
//                        if(self.arrScrolldataEvents.count == 0){
//                            self.vwInformation.frame.size.height =  self.vwInformation.frame.size.height - self.vwEvents.frame.size.height
//
//                            self.vwEvents.heightAnchor.constraint(equalToConstant: 0 ).isActive = true
//                            self.tblPlaces.tableFooterView = self.vwInformation
//                            self.tblPlaces.reloadData()
//                        }
//
//
//                    }
//                }
//            }
//        }
    }
    
    func CreateEventsApiCell(resultData: NSArray){
        
        if let cell = self.tblPlaces.dequeueReusableCell(withIdentifier: "WhereLickTogoListCell") as? WhereLickTogoListCell {
            cell.delegate = self
            cell.strNameKey = "name"
            cell.strImageUrlKey = "imageURL"
            cell.strTimeKey = "start_time"
            cell.lblTitle?.text = "Events"
            
            cell.arrWhereLickTogoList = NSMutableArray(array: resultData)
            
            self.NoOfCell.add(cell)
            
            self.tblPlaces.beginUpdates()
            self.tblPlaces.insertRows(at: [IndexPath(row: self.NoOfCell.count-1, section: 0)], with: .automatic)
            self.tblPlaces.endUpdates()
        }
    }
    
    //MARK: - Meetup API == 2
    
    @objc func Meetup_API(){
        
        let params = [
            "city" :StrCityName
        ]
        
        
        request(kMeetup, method: .post, parameters: params as Parameters, encoding: URLEncoding.default).responseJSON { (responseData) in
            
            if((responseData.result.value) != nil) {
                if(responseData.response?.statusCode == 200){
                    let swiftyJsonVar = JSON(responseData.result.value!)
                    
                    if let resData = swiftyJsonVar.dictionary {
                        
                        if let StrTemp = resData["success"]?.stringValue {
                            
                            if(StrTemp != "0"){
                                if let resData = resData["results"]?.dictionary{
                                    
                                    
                                    if let resultData = resData["results"]?.arrayObject {
                                        //  self.CreateAllAirportDataCell(resultData: resultData as NSArray)
                                        self.arrScrolldataMeetups = NSMutableArray()
                                        self.arrScrolldataMeetups = NSMutableArray(array: resultData)
                                        self.collectionviewMeetups.reloadData()
                                        
                                        
                                    }
                                    
                                    
                                }
                            }
                        }
                        
                        
                        print(self.arrScrolldataMeetups.count)
                        if(self.arrScrolldataMeetups.count == 0){
                            self.vwInformation.frame.size.height =  self.vwInformation.frame.size.height - self.vwMeetups.frame.size.height
                            
                            self.vwMeetups.heightAnchor.constraint(equalToConstant: 0 ).isActive = true
                            self.tblPlaces.tableFooterView = self.vwInformation
                            self.tblPlaces.reloadData()
                        }
                        
                        
                    }
                }
            }
        }
    }
    
    func CreateMeetupAPICell(resultData: NSArray){
        
        if let cell = self.tblPlaces.dequeueReusableCell(withIdentifier: "WhereLickTogoListCell") as? WhereLickTogoListCell {
            cell.delegate = self
            cell.lblTitle?.text = "Meetups"
            
            cell.arrWhereLickTogoList = NSMutableArray(array: resultData)
            
            self.NoOfCell.add(cell)
            
            self.tblPlaces.beginUpdates()
            self.tblPlaces.insertRows(at: [IndexPath(row: self.NoOfCell.count-1, section: 0)], with: .automatic)
            self.tblPlaces.endUpdates()
            
        }
    }
    
    //MARK:- getPlace_api ==  3
    
    @objc func getPlace_api(){
        
        let params = [
            "city" :StrCityName
        ]
        
        request(knearbyplaces, method: .post, parameters: params as Parameters, encoding: URLEncoding.default).responseJSON { (responseData) in
            
            if((responseData.result.value) != nil) {
                if(responseData.response?.statusCode == 200){
                    let swiftyJsonVar = JSON(responseData.result.value!)
                    if let resData = swiftyJsonVar.dictionary {
                        
                        if let StrTemp = resData["status"]?.stringValue {
                            
                            if(StrTemp == "OK"){
                                
                                if let resultData = resData["results"]?.arrayObject{
                                    //  self.CreatePlaceApiCell(resultData: resultData as NSArray)
                                    
                                    self.arrScrolldataPlaces = NSMutableArray()
                                    self.arrScrolldataPlaces = NSMutableArray(array: resultData)
                                    self.collectionviewPlaces.reloadData()
                                }
                            }
                        }
                        
                        print(self.arrScrolldataPlaces.count)
                        if(self.arrScrolldataPlaces.count == 0){
                            self.vwInformation.frame.size.height =  self.vwInformation.frame.size.height - self.vwPlaces.frame.size.height
                            
                            self.vwPlaces.heightAnchor.constraint(equalToConstant: 0 ).isActive = true
                            self.tblPlaces.tableFooterView = self.vwInformation
                            self.tblPlaces.reloadData()
                        }
                        
                    }
                }
            }
            print(self.arrScrolldataPlaces.count)
        }
    }
    
    func CreatePlaceApiCell(resultData: NSArray){
        
        if let cell = self.tblPlaces.dequeueReusableCell(withIdentifier: "WhereLickTogoListCell") as? WhereLickTogoListCell {
            cell.delegate = self
            cell.lblTitle?.text = "Places"
            
            cell.arrWhereLickTogoList = NSMutableArray(array: resultData)
            
            self.NoOfCell.add(cell)
            
            self.tblPlaces.beginUpdates()
            self.tblPlaces.insertRows(at: [IndexPath(row: self.NoOfCell.count-1, section: 0)], with: .automatic)
            self.tblPlaces.endUpdates()
        }
    }
    
    
    //MARK:- getAllAirportData_api == 4
    
    @objc func getAllAirportData_api(){
        
        let params = [
            "CAirportCode" : StrAirportCode
        ]
        
        request(kgetAllAirportData, method: .post, parameters: params as Parameters, encoding: URLEncoding.default).responseJSON { (responseData) in
            
            if((responseData.result.value) != nil) {
                if(responseData.response?.statusCode == 200){
                    let swiftyJsonVar = JSON(responseData.result.value!)
                    if let resData = swiftyJsonVar.dictionary {
                        
                        if let StrTemp = resData["success"]?.stringValue {
                            
                            if(StrTemp != "0"){
                                if let resultData = resData["Result"]?.arrayObject {
                                    //  self.CreateAllAirportDataCell(resultData: resultData as NSArray)
                                    
                                    self.arrScrolldataAirport_Information = NSMutableArray()
                                    self.arrScrolldataAirport_Information = NSMutableArray(array: resultData)
                                    self.collectionviewAirport_Information.reloadData()
                                    
                                    
                                }
                            }
                        }
                        
                        print(self.arrScrolldataAirport_Information.count)
                        
                        if(self.arrScrolldataAirport_Information.count == 0){
                            self.vwInformation.frame.size.height =  self.vwInformation.frame.size.height - self.vwAirport_Information.frame.size.height
                            
                            self.vwAirport_Information.heightAnchor.constraint(equalToConstant: 0 ).isActive = true
                            self.tblPlaces.tableFooterView = self.vwInformation
                            self.tblPlaces.reloadData()
                        }
                    }
                }
            }
        }
    }
    
    func CreateAllAirportDataCell(resultData: NSArray){
        
        if let cell = self.tblPlaces.dequeueReusableCell(withIdentifier: "WhereLickTogoListCell") as? WhereLickTogoListCell {
            cell.delegate = self
            cell.strNameKey = "CName"
            cell.strImageUrlKey = "Icon"
            cell.lblTitle?.text = "Airport Information"
            
            cell.arrWhereLickTogoList = NSMutableArray(array: resultData)
            
            self.NoOfCell.add(cell)
            
            self.tblPlaces.dataSource = self
            self.tblPlaces.delegate = self
            self.tblPlaces.reloadData()
            
        }
    }
    
    
    //MARK:- GetRestaurants_Api  == 5 Shops & Dine
    @objc func GetRestaurants(){
        
        
        let params = [
            "CAirportCode" :StrAirportCode
        ]
        
        
        
        request(kGetRestaurants, method: .post, parameters: params as Parameters, encoding: URLEncoding.default).responseJSON { (responseData) in
            
            
            if((responseData.result.value) != nil) {
                if(responseData.response?.statusCode == 200){
                    let swiftyJsonVar = JSON(responseData.result.value!)
                    if let resData = swiftyJsonVar.dictionary {
                        
                        if let StrTemp = resData["success"]?.stringValue {
                            if(StrTemp == "1"){
                                if let resultData = resData["result"]?.arrayObject{
                                    // self.CreateRestaurantsCell(resultData: resultData as NSArray)
                                    
                                    self.arrScrolldataShops_Dine = NSMutableArray()
                                    self.arrScrolldataShops_Dine = NSMutableArray(array: resultData)
                                    self.collectionviewShops_Dine.reloadData()
                                    print(self.arrScrolldataShops_Dine.count)
                                }
                            }
                        }
                        
                        
                        print(self.arrScrolldataShops_Dine.count)
                        if(self.arrScrolldataShops_Dine.count == 0){
                            self.vwInformation.frame.size.height =  self.vwInformation.frame.size.height - self.vwShopsDine.frame.size.height
                            
                            self.vwShopsDine.heightAnchor.constraint(equalToConstant: 0 ).isActive = true
                            self.tblPlaces.tableFooterView = self.vwInformation
                            self.tblPlaces.reloadData()
                        }
                        
                    }
                }
            }
        }
    }
    
    func CreateRestaurantsCell(resultData: NSArray){
        
        if let cell = self.tblPlaces.dequeueReusableCell(withIdentifier: "WhereLickTogoListCell") as? WhereLickTogoListCell {
            cell.delegate = self
            
            cell.lblTitle?.text = "Shops & Dine"
            cell.arrWhereLickTogoList = NSMutableArray(array: resultData)
            
            self.NoOfCell.add(cell)
            
            self.tblPlaces.beginUpdates()
            self.tblPlaces.insertRows(at: [IndexPath(row: self.NoOfCell.count-1, section: 0)], with: .automatic)
            self.tblPlaces.endUpdates()
            
        }
    }
    
    //MARK:- getairportDetails == 6
    @objc func getairportDetails(){
        
//        let params = [
//            "airportcode" :StrAirportCode
//        ]
//
//        let headers: HTTPHeaders = [
//            "X-API-KEY": X_API_KEY
//        ]
//
//
//
//        request(kGetairport_detail, method: .post, parameters: params as Parameters, encoding: URLEncoding.default,headers: headers).responseJSON { (responseData) in
//
//            print(responseData)
//            if((responseData.result.value) != nil) {
//                if(responseData.response?.statusCode == 200){
//                    let swiftyJsonVar = JSON(responseData.result.value!)
//                    if let resData = swiftyJsonVar.dictionary {
//
//                        if let StrTemp = resData["success"]?.stringValue {
//
//                            if(StrTemp != "0"){
//                                if let resultData = resData["result"]?.arrayObject {
//                                    //  self.CreateCityLiveInUserCell(resultData: resultData as NSArray)
//
//                                    if let mainTemp = (resultData[0] as! NSDictionary).value(forKey: "weather") as? NSDictionary {
//
//                                        if let StrTemp = mainTemp.value(forKey: "iconURL")
//                                            as? String  {
//
//                                            self.Imgweather.sd_setImage(with: URL(string:StrTemp as String), placeholderImage: UIImage(named: ""))
//
//                                        }
//                                        if let StrTemp = mainTemp.value(forKey: "weather")
//                                            as? String  {
//
//                                            self.lblweather.text = StrTemp + " \u{00B0}" + " C"
//
//                                        }
//                                        else if let StrTemp = mainTemp.value(forKey: "weather")
//                                            as? NSNumber  {
//
//                                            self.lblweather.text = "\(StrTemp) \u{00B0}" + " C"
//
//                                        }
//                                    }
//                                                if let strTmp = (resultData[0] as! NSDictionary).value(forKey: "city") as? String {
//                                                    self.StrCityName = strTmp
//                                                    self.lblCityName.text = strTmp
//                                                }
//
//                                                if let strTmp =  (resultData[0] as! NSDictionary).value(forKey: "CountryCode") as? String {
//                                                    let letters = CharacterSet.letters
//                                                    let range = strTmp.rangeOfCharacter(from: letters)
//                                                    if let _ = range {
//                                                        let a = strTmp.lowercased()
//                                                        let b = ".png"
//                                                        let c = a + b
//
//                                                        if let url = URL(string: urlFlag + c) {
//                                                            self.ImgFlagHeader.af_setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "usaflag"), filter: nil, progress: nil, progressQueue: .main, imageTransition: .crossDissolve(0.2), runImageTransitionIfCached: true, completion: nil)
//                                                        }
//                                                    }
//                                                    else {
//                                                        self.ImgFlagHeader.image = #imageLiteral(resourceName: "usaflag")
//                                                    }
//                                                }
//                                                else{
//                                                     self.ImgFlagHeader.image = #imageLiteral(resourceName: "usaflag")
//                                                }
//
//                                    if let strTmp = (resultData[0] as! NSDictionary).value(forKey: "code") as? String  {
//                                        print(strTmp)
//                                        // CodeFlagHeader(Code: strTmp)
//                                        self.Airportcode = strTmp
//                                        let CityUrl = urlCityImg + strTmp + ".jpg"
//
//
//
//                                        if let url = URL(string: CityUrl) {
//                                            self.ImgAirport.af_setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "city_place"), filter: nil, progress: nil, progressQueue: .main, imageTransition: .crossDissolve(0.2), runImageTransitionIfCached: false, completion: nil)
//                                        }
//
//                                        self.StrAirportCode = strTmp
//
//                                        self.lblAirportCode.text = strTmp
//                                    }
//                                    if let strTmp = (resultData[0] as! NSDictionary).value(forKey: "lat") as? String {
//                                        self.Lat = strTmp
//                                    }
//                                    if let strTmp = (resultData[0] as! NSDictionary).value(forKey: "lon") as? String {
//                                        self.Long = strTmp
//                                    }
//                                    if let strTmp = (resultData[0] as! NSDictionary).value(forKey: "name") as? String {
//
//                                        self.lblAirportName.text! = strTmp
//                                        self.lblAirportName.sizeToFit()
//
//                                        self.HeaderView.frame.size.height =  self.HeaderView.frame.size.height + self.lblAirportName.frame.size.height
//                                    }
//
//                                }
//                            }
//
//
//
//                        }
//                    }
//                }
//            }
//        }
    }
    
    //MARK:- GetCityLiveInUser_Api == 6
    @objc func GetCityLiveInUser(){
        
        let params = [
            "code" :StrAirportCode
        ]
        
        request(kGetCityLiveInUser, method: .post, parameters: params as Parameters, encoding: URLEncoding.default).responseJSON { (responseData) in
            
            
            if((responseData.result.value) != nil) {
                if(responseData.response?.statusCode == 200){
                    let swiftyJsonVar = JSON(responseData.result.value!)
                    if let resData = swiftyJsonVar.dictionary {
                        
                        if let StrTemp = resData["success"]?.stringValue {
                            
                            if(StrTemp != "0"){
                                if let resultData = resData["result"]?.arrayObject {
                                    //  self.CreateCityLiveInUserCell(resultData: resultData as NSArray)
                                    
                                    self.arrScrolldataFlyersInTheCity = NSMutableArray()
                                    self.arrScrolldataFlyersInTheCity = NSMutableArray(array: resultData)
                                    self.collectionviewFlyersInTheCity.reloadData()
                                    
                                    appDelegate.hideLoader()
                                    
                                }
                            }
                            
                            
                            print(self.arrScrolldataFlyersInTheCity.count)
                            
                            if(self.arrScrolldataFlyersInTheCity.count == 0){
                                self.vwInformation.frame.size.height =  self.vwInformation.frame.size.height - self.vwFlyersinTheCity.frame.size.height
                                
                                self.vwFlyersinTheCity.heightAnchor.constraint(equalToConstant: 0 ).isActive = true
                                self.tblPlaces.tableFooterView = self.vwInformation
                                self.tblPlaces.reloadData()
                            }
                            
                        }
                    }
                }
            }
        }
    }
    
    func CreateCityLiveInUserCell(resultData: NSArray){
        
        if let cell = self.tblPlaces.dequeueReusableCell(withIdentifier: "WhereLickTogoListCell") as? WhereLickTogoListCell {
            cell.delegate = self
            cell.strNameKey = "CName"
            cell.strImageUrlKey = "cProfileImage"
            cell.lblTitle?.text = "Flyers in the City"
            
            cell.subviewHeight?.constant = 104
            
            cell.arrWhereLickTogoList = NSMutableArray(array: resultData)
            
            self.NoOfCell.add(cell)
            
            self.tblPlaces.beginUpdates()
            self.tblPlaces.insertRows(at: [IndexPath(row: self.NoOfCell.count-1, section: 0)], with: .automatic)
            self.tblPlaces.endUpdates()
            
        }
    }
    
    
    //MARK:- Pinterest API == 7
    
    @objc func PinterestAPI(){
        
        StrAirportCode = StrAirportCode.replacingOccurrences(of: " ", with: "")
        
        let params = ["tags":StrAirportCode]
        
        request(kMyPinterest, method: .post, parameters: params as Parameters, encoding: URLEncoding.default).responseJSON { (responseData) in
            
            appDelegate.hideLoader()
            
            
            if((responseData.result.value) != nil) {
                if(responseData.response?.statusCode == 200){
                    let swiftyJsonVar = JSON(responseData.result.value!)
                    if let resData = swiftyJsonVar.dictionary {
                        if let arrData = resData[kResult]?.arrayObject {
                            
                            self.CreatePinterestAPICell(resultData: arrData as NSArray)
                            
                            
                        }
                    }
                }
            }
        }
    }
    
    func CreatePinterestAPICell(resultData: NSArray){
        if (resultData.count  > 0) {
            var arrImage = NSMutableArray()
            
            for item in resultData {
                if let dicdata = item as? NSDictionary {
                    if let enteryData = dicdata.value(forKey:"entry_data") as? NSDictionary{
                        if let arrTagPage = enteryData.object(forKey: "TagPage") as? NSArray {
                            for tagdic in arrTagPage {
                                if let DicTag = tagdic as? NSDictionary {
                                    if let tagData = DicTag.value(forKey:"tag") as? NSDictionary {
                                        if let mediaDic = tagData.object(forKey:"media") as? NSDictionary{
                                            if let arrNodes = mediaDic.object(forKey: "nodes") as? NSArray {
                                                
                                                if (arrNodes.count > 0){
                                                    for nodeDic in arrNodes {
                                                        if let DicNode = nodeDic as? NSDictionary {
                                                            if let thumbnail = DicNode.object(forKey:"thumbnail_src") as? String{
                                                                arrImage.add(thumbnail)
                                                            }
                                                        }
                                                    }
                                                }else{
                                                    
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                
                
                self.arrScrolldataPics = NSMutableArray()
                self.arrScrolldataPics = NSMutableArray(array: arrImage)
                print(self.arrScrolldataPics)
                self.collectionviewPics.reloadData()
                
                
                print(self.arrScrolldataPics.count)
                if(self.arrScrolldataPics.count == 0){
                    self.vwInformation.frame.size.height =  self.vwInformation.frame.size.height - self.vwPics.frame.size.height
                    
                    self.vwPics.heightAnchor.constraint(equalToConstant: 0 ).isActive = true
                    self.tblPlaces.tableFooterView = self.vwInformation
                    self.tblPlaces.reloadData()
                }
                
                
                
//                if let cell = self.tblPlaces.dequeueReusableCell(withIdentifier: "WhereLickTogoListCell") as? WhereLickTogoListCell {
//
//
//                    cell.delegate = self
//                    cell.lblTitle?.text = "Pics #"
//                    cell.subviewHeight?.constant = 150
//
//                    cell.arrWhereLickTogoList = NSMutableArray(array: arrImage)
//
//                    self.NoOfCell.add(cell)
//                    self.tblPlaces.beginUpdates()
//                    self.tblPlaces.insertRows(at: [IndexPath(row: self.NoOfCell.count-1, section: 0)], with: .automatic)
//                    self.tblPlaces.endUpdates()
//
//                }
            }
        }
    }
    
    //MARK: - WhereLickTogoListCellDelegate
    
    func BtnWhereLickTogoList(cell: WhereLickTogoListCell) {
        //        print(cell.lblTitle?.text)
        //        print(cell.arrWhereLickTogoList)
        
        if(cell.lblTitle?.text == "Airport Information"){
//            let RootObj:AirPortNinformationList_Vc = AirPortNinformationList_Vc(nibName:appDelegate.CheckDeviceType("AirPortNinformationList_Vc"),bundle: nil)
//            RootObj.DataDic = self.DataDic
//            self.navigationController?.pushViewController(RootObj, animated: false)
        }
        else if(cell.lblTitle?.text == "Flyers in the City"){
            
//            let RootObj:FlyerList_vc = FlyerList_vc(nibName:appDelegate.CheckDeviceType("FlyerList_vc"),bundle: nil)
//            RootObj.tag = (cell.lblTitle?.text)!
//            RootObj.DataDic = self.DataDic
//            RootObj.StrAirportCode = self.StrAirportCode
//            self.navigationController?.pushViewController(RootObj, animated: false)
        }
        else if(cell.lblTitle?.text == "Shops & Dine"){
//            let RootObj:ShopAndDine_VC = ShopAndDine_VC(nibName:appDelegate.CheckDeviceType("ShopAndDine_VC"),bundle: nil)
//            RootObj.tag = (cell.lblTitle?.text)!
//            RootObj.DataDic = self.DataDic
//            self.navigationController?.pushViewController(RootObj, animated: false)
        }
        else if(cell.lblTitle?.text == "Meetups"){
//            let RootObj:Meetups_vc = Meetups_vc(nibName:appDelegate.CheckDeviceType("Meetups_vc"),bundle: nil)
//            RootObj.tag = (cell.lblTitle?.text)!
//            RootObj.DataDic = self.DataDic
//            self.navigationController?.pushViewController(RootObj, animated: false)
        }
        else if(cell.lblTitle?.text == "Events"){
//            let RootObj:ShopAndDine_VC = ShopAndDine_VC(nibName:appDelegate.CheckDeviceType("ShopAndDine_VC"),bundle: nil)
//            RootObj.tag = (cell.lblTitle?.text)!
//            RootObj.DataDic = self.DataDic
//            self.navigationController?.pushViewController(RootObj, animated: false)
        }
        else if(cell.lblTitle?.text == "Places"){
//            let RootObj:ShopAndDine_VC = ShopAndDine_VC(nibName:appDelegate.CheckDeviceType("ShopAndDine_VC"),bundle: nil)
//            RootObj.tag = (cell.lblTitle?.text)!
//            RootObj.DataDic = self.DataDic
//            self.navigationController?.pushViewController(RootObj, animated: false)
        }
        else if(cell.lblTitle?.text == "Pics #"){
//            let RootObj = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyPinterestVC") as! MyPinterestVC
//            RootObj.hastagValue = self.StrAirportCode
//            self.navigationController?.pushViewController(RootObj, animated: true)
        }
        
        
    }
    
    func FriendsUserProfile(data: NSDictionary,StrTypeTag: String){
        //        print(data)
        //        print(StrTypeTag)
        
        if(StrTypeTag == "Airport Information"){
            if let StrTemp = data.object(forKey: "CLink") as? String {
                if(StrTemp != ""){
//                    let setting:Web_VC = Web_VC(nibName:appDelegate.CheckDeviceType("Web_VC"),bundle: nil)
//                    setting.tag = "Airport Information"
//                    setting.url = StrTemp
//                    setting.StrAirPortCode = StrAirportCode
//                    self.navigationController?.pushViewController(setting, animated: false)
                }
            }
        }else if(StrTypeTag == "Flyers in the City"){
            
            var FrdUserId:String?
            if let StrTemp = data.object(forKey: "nUserId") as? String {
                FrdUserId  = StrTemp
            }
            
            if(appDelegate.UserId == FrdUserId){
                //                appDelegate.SetTabBarItem(4)
//                let RootObj:SelfProfile_Vc = SelfProfile_Vc(nibName:appDelegate.CheckDeviceType("SelfProfile_Vc"),bundle: nil)
//                self.navigationController?.pushViewController(RootObj, animated: false)
            }
            else{
//                let RootObj:FlyerProfile_Vc = FlyerProfile_Vc(nibName:appDelegate.CheckDeviceType("FlyerProfile_Vc"),bundle: nil)
//                RootObj.DataDic = data
//                self.navigationController?.pushViewController(RootObj, animated: false)
            }
            
            
            
        }
        else if(StrTypeTag == "Shops & Dine"){
//            let RootObj:ShopAndDineDetail_VC = ShopAndDineDetail_VC(nibName:appDelegate.CheckDeviceType("ShopAndDineDetail_VC"),bundle: nil)
//            RootObj.tag = StrTypeTag
//            RootObj.DataDic = data
//            self.navigationController?.pushViewController(RootObj, animated: false)
        }
        else if(StrTypeTag == "Meetups"){
            if let StrTemp = data.object(forKey: "event_url") as? String {
//                let setting:Web_VC = Web_VC(nibName:appDelegate.CheckDeviceType("Web_VC"),bundle: nil)
//                setting.tag = "Meetups"
//                setting.url = StrTemp
//                self.navigationController?.pushViewController(setting, animated: false)
            }
        }
        else if(StrTypeTag == "Events"){
//            let RootObj:ShopAndDineDetail_VC = ShopAndDineDetail_VC(nibName:appDelegate.CheckDeviceType("ShopAndDineDetail_VC"),bundle: nil)
//            RootObj.tag = StrTypeTag
//            RootObj.DataDic = data
//            self.navigationController?.pushViewController(RootObj, animated: false)
        }
        else if(StrTypeTag == "Places"){
//            let RootObj:ShopAndDineDetail_VC = ShopAndDineDetail_VC(nibName:appDelegate.CheckDeviceType("ShopAndDineDetail_VC"),bundle: nil)
//            RootObj.tag = StrTypeTag
//            RootObj.DataDic = data
//            self.navigationController?.pushViewController(RootObj, animated: false)
        }
        else if(StrTypeTag == "Pics #"){}
        
        
        //        "Airport Information"
        //        "Flyers in the City"  == To Do
        //        "Shops & Dine"
        //        "Meetups"
        //        "Events"  == TO DO
        //        "Places"  == TO DO
        //        "Pics #"
    }
    
    
    @IBAction func BtnAirportInfoClick(_ sender: AnyObject){
//        let RootObj:AirPortNinformationList_Vc = AirPortNinformationList_Vc(nibName:appDelegate.CheckDeviceType("AirPortNinformationList_Vc"),bundle: nil)
//        RootObj.DataDic = self.DataDic
//        self.navigationController?.pushViewController(RootObj, animated: false)
    }
    
    @IBAction func BtnFlyerClick(_ sender: AnyObject){
//        let RootObj:FlyerList_vc = FlyerList_vc(nibName:appDelegate.CheckDeviceType("FlyerList_vc"),bundle: nil)
//        RootObj.tag = "Flyers in the City"
//        RootObj.DataDic = self.DataDic
//        RootObj.StrAirportCode = self.StrAirportCode
//        self.navigationController?.pushViewController(RootObj, animated: false)
    }
    
    @IBAction func BtnShopsDine(_ sender: AnyObject){
//        let RootObj:ShopAndDine_VC = ShopAndDine_VC(nibName:appDelegate.CheckDeviceType("ShopAndDine_VC"),bundle: nil)
//        RootObj.tag = "Shops & Dine"
//        RootObj.strTitletext = lblAirportCode.text!
//        RootObj.DataDic = self.DataDic
//        self.navigationController?.pushViewController(RootObj, animated: false)
    }
    
    @IBAction func BtnMeetups(_ sender: AnyObject){
//        let RootObj:Meetups_vc = Meetups_vc(nibName:appDelegate.CheckDeviceType("Meetups_vc"),bundle: nil)
//        RootObj.tag = "Meetups"
//        RootObj.DataDic = self.DataDic
//        self.navigationController?.pushViewController(RootObj, animated: false)
    }
    
    @IBAction func BtnEvents(_ sender: AnyObject){
//        let RootObj:ShopAndDine_VC = ShopAndDine_VC(nibName:appDelegate.CheckDeviceType("ShopAndDine_VC"),bundle: nil)
//        RootObj.tag = "Events"
//        RootObj.DataDic = self.DataDic
//        self.navigationController?.pushViewController(RootObj, animated: false)
    }
    
    @IBAction func BtnPlaces(_ sender: AnyObject){
//        let RootObj:ShopAndDine_VC = ShopAndDine_VC(nibName:appDelegate.CheckDeviceType("ShopAndDine_VC"),bundle: nil)
//        RootObj.tag = "Places"
//        RootObj.DataDic = self.DataDic
//        self.navigationController?.pushViewController(RootObj, animated: false)
    }
    
    @IBAction func BtnPics(_ sender: AnyObject){
//        let RootObj = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MyPinterestVC") as! MyPinterestVC
//        RootObj.hastagValue = self.StrAirportCode
//        self.navigationController?.pushViewController(RootObj, animated: true)
    }
    
    @IBAction func onclickbtnDeparture(_ sender:UIButton!) {
        // do cool stuff here
        TypeOfFlight = "departure"
        isDeparture = true
        tblPlaces.reloadData()
        getFlightTimeTableByAirportCode()
    }
    
    @IBAction func onclickbtnArrivle(_ sender:UIButton!) {
        // do cool stuff here
        TypeOfFlight = "arrival"
        isDeparture = false
        tblPlaces.reloadData()
        getFlightTimeTableByAirportCode()
    }
    //MARK:- getCurrentWeather_api  == 8
    func getCurrentWeather_api(){
        
//        let params = [
//            "city" :StrCityName,
//            "latitude" :Lat,
//            "longitude" : Long
//        ]
//
//        let headers: HTTPHeaders = [
//            "X-API-KEY": X_API_KEY
//        ]
//
//
//
//        request(kcurrentweather, method: .post, parameters: params as Parameters, encoding: URLEncoding.default,headers: headers).responseJSON { (responseData) in
//
//            //     appDelegate.showLoader()
//            print(responseData.result.value)
//            if((responseData.result.value) != nil) {
//
//                if(responseData.response?.statusCode == 200){
//
//                    let swiftyJsonVar = JSON(responseData.result.value!)
//
//                    if let resData = swiftyJsonVar.dictionary {
//                        if let resultData = resData[kResult]?.arrayObject {
//
//                            if let mainTemp = (resultData[0] as! NSDictionary).value(forKey: "main") as? NSDictionary {
//
//                                if let StrTemp = mainTemp.value(forKey: "iconURL")
//                                as? String  {
//
//                                    self.Imgweather.sd_setImage(with: URL(string:StrTemp as String), placeholderImage: UIImage(named: ""))
//
//                                }
//                                if let StrTemp = mainTemp.value(forKey: "weather")
//                                    as? String  {
//
//                                    self.lblweather.text = StrTemp + " \u{00B0}" + " C"
//
//                                }
//                                else if let StrTemp = mainTemp.value(forKey: "weather")
//                                    as? NSNumber  {
//
//                                    self.lblweather.text = "\(StrTemp) \u{00B0}" + " C"
//
//                                }
//                            }
//                        }
//
//                    }
//                }
//            }
//        }
    }
    
    //MARK:- getFlightTimeTableByAirportCode  == 8
    func getFlightTimeTableByAirportCode(){
        
//       appDelegate.showLoader()
//        var param:String = ""
//        param = String(format: "%@?key=%@&iataCode=%@&type=%@", GetAviationData,AviationKey,StrAirportCode,TypeOfFlight)
//
////        http://aviation-edge.com/v2/public/timetable?key=13156c-13cf44&iataCode=amd&type=departure
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
//
//                        self.arrTimeTableFlight = NSMutableArray()
//
//                        self.arrTimeTableFlight = NSMutableArray(array: resData as [AnyObject])
//                       print(self.arrTimeTableFlight)
//                        self.tblPlaces.reloadData()
//                    }
//                }
//            }
//        }
    }
    //MARK: -
   
    
    //MARK:- TableView Methods -
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if Str_ChoiceTab == "CheckIn"
        {
            return 2
        }
        else
        {
           return 1
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       if Str_ChoiceTab == "CheckIn"
       {
        if section == 0
        {
            return 1
        }
        else
        {
            return arrTimeTableFlight.count
        }
        
       }
        else
       {
        if NoOfCell.count > 0 {
            return NoOfCell.count
        }
        }
        
       
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if Str_ChoiceTab == "CheckIn"
        {
            if indexPath.section == 0
            {
               return UITableView.automaticDimension
            }
            else
            {
                return 100
            }
            
        }
        else
        {
            if  let cell = NoOfCell.object(at: indexPath.row) as? WhereToGoFlyers_Cell {
                
                if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad) {
                    return 400
                }
                else{
                    return 280
                }
            }
            else{
                return UITableView.automaticDimension
            }
        }
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if Str_ChoiceTab == "CheckIn"
        {
            if indexPath.section == 0
            {
                let cell = tableView.dequeueReusableCell(withIdentifier: "TimeTable_Cell", for: indexPath) as! TimeTable_Cell
                cell.btnArrvl.addTarget(self, action: #selector(self.onclickbtnArrivle(_:)), for: .touchUpInside)
                
                cell.btnDeparture.addTarget(self, action: #selector(self.onclickbtnDeparture(_:)), for: .touchUpInside)
               
                if isDeparture == true
                {
                    cell.lblLine.backgroundColor =  UIColor.init(hexString: "D8131B")
                     cell.lblLine2.backgroundColor =  UIColor.white
                }
                else
                {
                    cell.lblLine2.backgroundColor =  UIColor.init(hexString: "D8131B")
                    cell.lblLine.backgroundColor =  UIColor.white
                }
                return cell
            }
            else
            {
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
                       // cell.btnStatus.setBackgroundImage(UIImage.init(named: "greadintGreen"), for: .normal)
                    }
                    else
                    {
                        //cell.btnStatus.setBackgroundImage(UIImage.init(named: "Gradient-4"), for: .normal)
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
                    
                    
//                    if let Name = ((arrTimeTableFlight.object(at: indexPath.row) as! NSDictionary).value(forKey: "airline") as? NSDictionary)?.value(forKey: "iataCode") as? String
//                    {
//
//
//                        cell.imgFlag?.sd_setImage(with: URL(string:urlCuntryFlag + Name + ".png"), placeholderImage: UIImage(named: "usaflag"))
//
//
//                    }
                    
                }
                return cell
            }
           
        }
        else
        {
            if let cell = NoOfCell.object(at: indexPath.row) as? UITableViewCell {
            return cell
            }
        }

        
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if Str_ChoiceTab == "CheckIn"
        {
            if indexPath.section == 0
            {
                
            }
            else
            {
                if Str_ChoiceTab == "CheckIn"
                {
                    if indexPath.section == 0
                    {
                        
                    }
                    else
                    {
//                        let RootObj = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FlightTimeTableDetail_Vc") as! FlightTimeTableDetail_Vc
//                        RootObj.Data = arrTimeTableFlight.object(at: indexPath.row) as! NSDictionary
//                        self.navigationController?.pushViewController(RootObj, animated: true)
                    }
                }
                
           
            }
            
        }
    }
    //MARK: - Flyers
    //==================================================================================================================================================================================================================================================================================================================================================================================//
    
    
    //MARK: -   get_discussiondetail  == 9
    
    func get_discussiondetail(){
        
//        appDelegate.showLoader()
//        let  params = ["to":"",
//                       "num":"0",
//                       "cLat" : "",
//                       "cLong" : "",
//                       "nUserId":appDelegate.UserId,
//                       "isreload": "",
//                       "airportCode" : StrAirportCode,
//                       "page":"1"] as [String : Any]
//
//
//
//        let headers: HTTPHeaders = [
//            "X-API-KEY": appDelegate.Key
//        ]
//
//        print(params)
//        request(kGetAtairportDetail, method: .post, parameters: params as Parameters, encoding: URLEncoding.default,headers: headers).responseJSON { (responseData) in
//
//            appDelegate.hideLoader()
//
//            print(responseData.result.value)
//            if((responseData.result.value) != nil) {
//                if(responseData.response?.statusCode == 200){
//                    let swiftyJsonVar = JSON(responseData.result.value!)
//                    if let resData = swiftyJsonVar.dictionary {
//
//
//                        if let StrTemp = resData["success"]?.stringValue {
//                            if(StrTemp == "0"){
//                                if let StrTemp = resData["message"]?.stringValue {
//                                    self.lblmsg.isHidden = false
//                                    self.lblmsg.text = StrTemp
//                                }
//
//                            }else{
//                                if let resultData = resData[kResult]?.arrayObject {
//                                    print(resultData)
//                                    self.arrdata = NSMutableArray()
//                                    self.arrdata = NSMutableArray(array: resultData)
//                                    self.CreateCell1()
//                                }
//                            }
//                        }
//                    }
//                }
//            }
//        }
    }
    
    
    //MARK:- Tableview
    func CreateCell1(){
        
        NoOfCell = NSMutableArray()
        
        for item in arrdata {
            if let dicdata = item as? NSDictionary {
                
                if let cell = tblPlaces.dequeueReusableCell(withIdentifier: identifire) as? WhereToGoFlyers_Cell {
                    
                    let dic = dicdata as NSDictionary
                    cell.DataDic = dic
                    cell.delegate = self
                    
                    if let StrTemp = cell.DataDic?.object(forKey: "nUserId") as? String {
                        
                        if(StrTemp == appDelegate.UserId){
                            cell.btnrequestMeeting.isHidden = true
                        }else{
                            cell.btnrequestMeeting.isHidden = false
                        }
                    }
                    
//                    if let ProfileImage = dic.object(forKey: "cProfileImage") as? String {
//
//                        cell.ProfileImg?.sd_setImage(with: URL(string:ProfileImage), placeholderImage: UIImage(named: "photo"))
//                    }
                    
                    if let StrTemp = dic.object(forKey: "cName") as? String {
                        cell.lblname.text = StrTemp
                    }
                    
                    if let StrTemp = dic.object(forKey: "dtCreatedDate") as? String {
                        if(StrTemp != "0000-00-00"){
                            cell.lblDate.text = appDelegate.SetDateFormat(StrTemp)
                        }
                    }
                    
//                    cell.ImgBlare.image = #imageLiteral(resourceName: "city_place")
//                    if let StrTemp = dic.object(forKey: "airportcode") as? String{
//                        if(StrTemp != ""){
//                            let CityUrl = urlCityImg + StrTemp + ".jpg"
//
//                            cell.ImgBlare.sd_setImage(with: URL(string:CityUrl as String), placeholderImage: UIImage(named: "placeholder"))
//                        }
//                    }
                    
                    if let StrTemp = dic.object(forKey: "cTitle") as? String {
                        cell.lblLocation.text = StrTemp
                    }
                    self.NoOfCell.add(cell)
                }
            }
        }
        tblPlaces.reloadData()
    }
    
    func BtnRequestMeeting(cell: WhereToGoFlyers_Cell){
        
        var FrdUserId:String?
        if let StrTemp = cell.DataDic?.object(forKey: "nUserId") as? String {
            FrdUserId  = StrTemp
        }
        
        if(appDelegate.UserId != FrdUserId){
//            let RootObj:Sent_Meeting_RQ_VC = Sent_Meeting_RQ_VC(nibName:appDelegate.CheckDeviceType("Sent_Meeting_RQ_VC"),bundle: nil)
//            RootObj.DataDic = cell.DataDic
//            RootObj.tag = "1"
//            self.navigationController?.pushViewController(RootObj, animated: true)
        }
    }
    
    
    
    
    
    func BtnProfile(cell: WhereToGoFlyers_Cell){
        
//        print(cell.DataDic)
//        var FrdUserId:String?
//        if let StrTemp = cell.DataDic?.object(forKey: "nUserId") as? String {
//            FrdUserId  = StrTemp
//        }
//
//        if(appDelegate.UserId == FrdUserId){
//            //                appDelegate.SetTabBarItem(4)
////            let RootObj:SelfProfile_Vc = SelfProfile_Vc(nibName:appDelegate.CheckDeviceType("SelfProfile_Vc"),bundle: nil)
////            self.navigationController?.pushViewController(RootObj, animated: false)
//        }
//        else{
//            let RootObj:FlyerProfile_Vc = FlyerProfile_Vc(nibName:appDelegate.CheckDeviceType("FlyerProfile_Vc"),bundle: nil)
//            RootObj.DataDic = cell.DataDic
//            self.navigationController?.pushViewController(RootObj, animated: false)
//        }
    }
    
    //MARK: - Check In
    //==================================================================================================================================================================================================================================================================================================================================================================================//
    
    @IBAction func btnAirline(_ sender:AnyObject){
//        let airline:AirLine_VC = AirLine_VC(nibName:appDelegate.CheckDeviceType("AirLine_VC"),bundle: nil)
//        airline.delegate = self
//        airline.hidesBottomBarWhenPushed = true
//        self.navigationController?.pushViewController(airline, animated: true)
    }
    
    
    
    func AirLineProtocol(_ dics: NSDictionary){
        
        if let StrTemp = dics.object(forKey: "name") as? String {
            flightName = StrTemp
            lblAirline.text = StrTemp
        }
        
        if let code = dics.object(forKey: "code") as? String {
            
            if(code != ""){
                
                
               // imgFlghtTell.sd_setImage(with: URL(string: urlCuntryFlag + code + ".png"), placeholderImage: UIImage(named: "usaflag"))
                
                lblFlightNo.text = code
            }
        }
        
        
        if let code = dics.object(forKey: "code") as? String {
            
            let letters = CharacterSet.letters
            
            let range = code.rangeOfCharacter(from: letters)
            
            lblAirline.isHidden = true
            if let _ = range {
                
                let a = code.lowercased()
                let b = "-logo.png"
                let c = a + b
//                if let url = URL(string: urlimg + c) {
//                    imgAirline.sd_setImage(with: url)
//                    imgAirline.frame = CGRect(x: 0, y: 23, width: 100, height: 30)
//                }
            }
            else {
                imgAirline.image = UIImage(named: "departure")
                imgAirline.frame = CGRect(x: 0, y: 23, width: 100, height: 30)
            }
        }
    }
    
    @ IBAction func BtnDeparture (_ sender: AnyObject)
    {
        pickefview(sender)
    }
    
    func pickefview(_ sender: AnyObject){
        
        if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad) {
            
            print("========= iPad =========")
            
            let alertView = UIAlertController(title: nil, message: "\n\n\n\n\n\n\n\n\n", preferredStyle: .actionSheet)
            
            myDatePicker = UIDatePicker(frame: CGRect(x: -230, y: 0, width: alertView.view.frame.size.width, height: 180))
            alertView.view.addSubview(myDatePicker)
            
            
            alertView.addAction(UIAlertAction(title: "Done", style: .default, handler: { (alertAction) -> Void in
                self.mydatepice()
                
            }))
            
            alertView.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) -> Void in
                
            }))
            
            if let presenter = alertView.popoverPresentationController {
                presenter.sourceView = sender as? UIView
                if #available(iOS 12.0, *) {
                    presenter.sourceRect = sender.frame
                } else {
                    // Fallback on earlier versions
                }
            }
            present(alertView, animated: true, completion: nil)
        }
        else{
            let alertView = UIAlertController(title: nil, message: "\n\n\n\n\n\n\n\n\n", preferredStyle: .actionSheet)
            
            myDatePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: alertView.view.frame.size.width, height: 180))
            alertView.view.addSubview(myDatePicker)
            
            
            alertView.addAction(UIAlertAction(title: "Done", style: .default, handler: { (alertAction) -> Void in
                self.mydatepice()
                
            }))
            
            alertView.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (alertAction) -> Void in
                
            }))
            self.present(alertView, animated: true, completion: nil)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func btnCheckInClick(_ sender: AnyObject){
//        if(imgAirline.image == UIImage(named: "departure") ){
//            SwiftMessageBar.showMessageWithTitle("", message: "Please Select Airline", type: .error)
//            return
//        }
//
//        if(lbldateD.text == ""){
//            SwiftMessageBar.showMessageWithTitle("", message: "Please Select Departure Date And Time", type: .error)
//            return
//        }
//
//
//        if(txtFlightNo.text == ""){
//            SwiftMessageBar.showMessageWithTitle("", message: "Enter your Flight No", type: .error)
//            return
//        }
//
        
        appDelegate.showLoader()
        insert_journey()
    }
    
    //MARK: - DatePicker
    func mydatepice(){
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let strDate = dateFormatter.string(from: myDatePicker.date)
        
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        dateFormatter.timeZone = TimeZone.init(abbreviation: "UTC")
        myDatePicker.locale = Locale(identifier: "en_GB")  // For 24 Hrs
        let strtime = timeFormatter.string(from: myDatePicker.date)
        
        
        StrTimeDeparture = strtime
        StrDateDeparture = strDate
        lbldateD.text = appDelegate.SetDateFormat(strDate)
        lbltimeD.text = strtime
        
    }
    
    //MARK:- insert_journey() -
    
    
    
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
//            "cFlightNo" : lblFlightNo.text! + txtFlightNo.text!,
//            "dtFlightDepartureDateTime" : lbldateD.text!,
//            ]
//
//        request(kflightchecking, method: .post, parameters: params as Parameters, encoding: URLEncoding.default).responseJSON { (responseData) in
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
//
//
//
//            if((responseData.result.value) != nil) {
//                if(responseData.response?.statusCode == 200){
//                    let swiftyJsonVar = JSON(responseData.result.value!)
//                    if let resData = swiftyJsonVar.dictionary {
//                        if let StrTemp = resData["success"]?.stringValue {
//
//
//
//                            if(StrTemp == "0"){
//
//                                let RootObj:CheckIn_VC = CheckIn_VC(nibName:appDelegate.CheckDeviceType("CheckIn_VC"),bundle: nil)
//                                RootObj.StrDataNilTag = "yes"
//                                RootObj.flightNo = self.lblFlightNo.text! + self.txtFlightNo.text!
//                                RootObj.imgflight = self.imgFlghtTell.image!
//                                RootObj.imgAirline1 = self.imgAirline.image!
//                                RootObj.flight = self.lblAirline.text!
//                                RootObj.flightName = self.flightName
//                                RootObj.dateSource = self.StrDateDeparture
//                                RootObj.timeSource = self.StrTimeDeparture
//                                self.navigationController?.pushViewController(RootObj, animated: true)
//
//
//                            }else{
//
//
//
//
//
//
//                                if let StrTemp1 = resData["result"]?.arrayObject{
//
//                                    var arrdata : NSMutableArray = NSMutableArray()
//                                    arrdata = NSMutableArray(array: StrTemp1 as [AnyObject])
//
//
//                                    if(resData.count == 0 ){
//
//                                    }else{
//
//                                        let dic = arrdata[0] as? NSDictionary
//                                        if(dic?.count != nil){
//                                            if let StrTemporigin = dic?.object(forKey:"origin") as? NSDictionary{
//
//                                                if let StrTemp2 = StrTemporigin.object(forKey:"alternate_ident") as? String{
//
//                                                    source = StrTemp2
//
//                                                }
//
//                                                if let StrTemp2 = StrTemporigin.object(forKey:"airport_name") as? String{
//
//                                                    airNameSource = StrTemp2
//
//                                                }
//
//                                                if let StrTemp2 = StrTemporigin.object(forKey:"city") as? String{
//
//                                                    LocationCityDeparture1 = StrTemp2
//                                                }
//
//                                            }
//
//                                            if let StrTemporigin = dic?.object(forKey:"estimated_arrival_time") as? NSDictionary{
//
//                                                if let StrTemp2 = StrTemporigin.object(forKey:"date") as? String{
//
//                                                    dateSource = StrTemp2
//
//                                                }
//
//                                                if let StrTemp2 = StrTemporigin.object(forKey:"time") as? String{
//
//                                                    timeSource = StrTemp2
//
//
//                                                }
//                                            }
//
//
//                                            if let StrTemporigin = dic?.object(forKey:"estimated_departure_time") as? NSDictionary{
//
//
//                                                if let StrTemp2 = StrTemporigin.object(forKey:"date") as? String{
//
//                                                    dateDesti = StrTemp2
//
//                                                }
//
//                                                if let StrTemp2 = StrTemporigin.object(forKey:"time") as? String{
//
//                                                    timeDesti = StrTemp2
//
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
//
//
//                                            if let StrTemporigin = dic?.object(forKey:"destination") as? NSDictionary{
//
//                                                if let StrTemp2 = StrTemporigin.object(forKey:"alternate_ident") as? String{
//
//                                                    destination = StrTemp2
//
//                                                }
//
//                                                if let StrTemp2 = StrTemporigin.object(forKey:"city") as? String{
//
//                                                    LocationCityArrival1 = StrTemp2
//                                                }
//
//                                                if let StrTemp2 = StrTemporigin.object(forKey:"airport_name") as? String{
//
//                                                    airNameDesti = StrTemp2
//
//                                                }
//
//                                            }
//
//                                            let RootObj:CheckIn_VC = CheckIn_VC(nibName:appDelegate.CheckDeviceType("CheckIn_VC"),bundle: nil)
//                                            self.view.endEditing(true)
//                                            RootObj.flightNo = self.lblFlightNo.text! + self.txtFlightNo.text!
//                                            RootObj.CheckInData = dic
//                                            RootObj.imgflight = self.imgFlghtTell.image!
//                                            RootObj.destination = destination
//                                            RootObj.source = source
//                                            RootObj.dateSource = dateSource
//                                            RootObj.timeSource = timeSource
//                                            RootObj.dateDesti = dateDesti
//                                            RootObj.timeDesti = timeDesti
//                                            RootObj.imgAirline1 = self.imgAirline.image!
//                                            RootObj.arrivalDelay = arrivalDelay
//                                            RootObj.departureDelay = departureDelay
//                                            RootObj.flight = self.lblAirline.text!
//                                            RootObj.flightName = self.flightName
//
//                                            RootObj.airNameDesti = airNameDesti
//                                            RootObj.airNameSource = airNameSource
//
//                                            RootObj.StrLocationCityDeparture = LocationCityDeparture1
//                                            RootObj.StrLocationCityArrival = LocationCityArrival1
//
//
//
//                                            self.navigationController?.pushViewController(RootObj, animated: true)
//                                        }else{
//                                            let RootObj:CheckIn_VC = CheckIn_VC(nibName:appDelegate.CheckDeviceType("CheckIn_VC"),bundle: nil)
//                                            RootObj.StrDataNilTag = "yes"
//                                            RootObj.flightNo = self.lblFlightNo.text! + self.txtFlightNo.text!
//                                            RootObj.imgflight = self.imgFlghtTell.image!
//                                            RootObj.imgAirline1 = self.imgAirline.image!
//                                            RootObj.flight = self.lblAirline.text!
//                                            RootObj.flightName = self.flightName
//                                            RootObj.dateSource = self.StrDateDeparture
//                                            RootObj.timeSource = self.StrTimeDeparture
//                                            self.navigationController?.pushViewController(RootObj, animated: true)
//
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
//                    RootObj.flightNo = self.lblFlightNo.text! + self.txtFlightNo.text!
//                    RootObj.imgflight = self.imgFlghtTell.image!
//                    RootObj.imgAirline1 = self.imgAirline.image!
//                    RootObj.flight = self.lblAirline.text!
//                    RootObj.flightName = self.flightName
//                    RootObj.dateSource = self.StrDateDeparture
//                    RootObj.timeSource = self.StrTimeDeparture
//                    self.navigationController?.pushViewController(RootObj, animated: true)
//
//                }
//            }
//            else{
//                let RootObj:CheckIn_VC = CheckIn_VC(nibName:appDelegate.CheckDeviceType("CheckIn_VC"),bundle: nil)
//                RootObj.StrDataNilTag = "yes"
//                RootObj.flightNo = self.lblFlightNo.text! + self.txtFlightNo.text!
//                RootObj.imgflight = self.imgFlghtTell.image!
//                RootObj.imgAirline1 = self.imgAirline.image!
//                RootObj.flight = self.lblAirline.text!
//                RootObj.flightName = self.flightName
//                RootObj.dateSource = self.StrDateDeparture
//                RootObj.timeSource = self.StrTimeDeparture
//                self.navigationController?.pushViewController(RootObj, animated: true)
//            }
//        }
    }
    
    
    
   
    
    //MARK: Collection view
    //=================================================================================================================================================================================//
    
    func collectionView(_ collectionView : UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:IndexPath) -> CGSize
    {
        if collectionView == self.collectionviewAirport_Information{
            return CGSize(width: collectionviewAirport_Information.frame.size.width, height: collectionviewAirport_Information.frame.size.height)
            
        }
        else if collectionView == self.collectionviewFlyersInTheCity{
            return CGSize(width: collectionviewFlyersInTheCity.frame.size.width, height: collectionviewFlyersInTheCity.frame.size.height)
        }
        else if collectionView == self.collectionviewShops_Dine{
            return CGSize(width: collectionviewShops_Dine.frame.size.width, height: collectionviewShops_Dine.frame.size.height)
        }
        else if collectionView == self.collectionviewMeetups{
            return CGSize(width: collectionviewMeetups.frame.size.width, height: collectionviewMeetups.frame.size.height)
        }
        else if collectionView == self.collectionviewEvents{
            return CGSize(width: collectionviewEvents.frame.size.width, height: collectionviewEvents.frame.size.height)
        }
        else if collectionView == self.collectionviewPlaces{
            return CGSize(width: collectionviewPlaces.frame.size.width, height: collectionviewPlaces.frame.size.height)
        }
        else{
            return CGSize(width: collectionviewPics.frame.size.width, height: collectionviewPics.frame.size.height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        if collectionView == self.collectionviewAirport_Information{
            return arrScrolldataAirport_Information.count
        }
        else if collectionView == self.collectionviewFlyersInTheCity{
            return arrScrolldataFlyersInTheCity.count
        }
        else if collectionView == self.collectionviewShops_Dine{
            return arrScrolldataShops_Dine.count
        }
        else if collectionView == self.collectionviewMeetups{
            return arrScrolldataMeetups.count
        }
        else if collectionView == self.collectionviewEvents{
            return arrScrolldataEvents.count
        }
        else if collectionView == self.collectionviewPlaces{
            return arrScrolldataPlaces.count
        }
        else if collectionView == self.collectionviewPics{
            return arrScrolldataPics.count
        }
        else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        
        
        if collectionView == self.collectionviewAirport_Information{
            let  cell = collectionviewAirport_Information!.dequeueReusableCell(withReuseIdentifier: "AirportInformation_Cell", for: indexPath) as! AirportInformation_Cell
            let dic = arrScrolldataAirport_Information[indexPath.row] as? NSDictionary
            cell.DataDic = dic
            if let StrTemp = dic?.object(forKey: "Icon") as? String {
                cell.ProfileImg.sd_setImage(with: URL(string:StrTemp as String), placeholderImage: UIImage(named: ""))
            }
            if let StrTemp = dic?.object(forKey: "CName") as? String {
                cell.lblname.text = StrTemp
            }
            return cell
        }
        else if collectionView == self.collectionviewFlyersInTheCity{
            let  cell = collectionviewFlyersInTheCity?.dequeueReusableCell(withReuseIdentifier: "HomeCollectionCell", for: indexPath) as? HomeCollectionCell
            cell?.userProfile.layer.borderColor = UIColor.white.cgColor
            cell?.userProfile.layer.borderWidth = 2
            print(arrScrolldataFlyersInTheCity)
            if let dic = arrScrolldataFlyersInTheCity[indexPath.row] as? NSDictionary {
                cell?.DataDic = dic
                if let name = dic.object(forKey: "cName") as? String {
                    cell?.lblName.text = name
                }
                if let ProfileImage = dic.object(forKey: "cProfileImage") as? String {
                    if let url = URL(string: ProfileImage) {
//                        cell?.userProfile?.sd_setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "photo"), filter: nil, progress: nil, progressQueue: .main, imageTransition: .crossDissolve(0.2), runImageTransitionIfCached: true, completion: nil)
                        
                        cell!.userProfile.sd_setImage(with: url, placeholderImage: UIImage(named: ""))
                        
                        
                    }
                }
            }
            
            return cell!
        }
        else if collectionView == self.collectionviewShops_Dine{
            
            let  cell = collectionviewShops_Dine?.dequeueReusableCell(withReuseIdentifier: "WherLicktoGo_Cell", for: indexPath) as? WherLicktoGo_Cell
            
            let dic = arrScrolldataShops_Dine[indexPath.row] as? NSDictionary
            cell?.DataDic = dic
            if let StrTemp = dic?.object(forKey: "cPlaceImage") as? String {
                if let url =  URL(string: StrTemp) {
                    cell!.ProfileImg.sd_setImage(with: url, placeholderImage: UIImage(named: ""))
                }else{
                    cell?.ProfileImg.image = #imageLiteral(resourceName: "Resturant")
                }
            }
            if let StrTemp = dic?.object(forKey: "cPlaceName") as? String {
                cell?.lblname.text = StrTemp
            }
            
            return cell!
            
        }
        else if collectionView == self.collectionviewMeetups{
            let  cell = collectionviewMeetups?.dequeueReusableCell(withReuseIdentifier: "MeetupCell", for: indexPath) as? MeetupCell
            
            let dic = arrScrolldataMeetups[indexPath.row] as? NSDictionary
            cell?.DataDic = dic
            
            if let StrTemp = dic?.object(forKey: "name") as? String {
                cell?.lblTitle.text =  StrTemp
            }
            
            if let StrTemp = dic?.object(forKey: "time") as? Float {
                cell?.lblDate.text = self.milisecondsConvertDate(miliseconds:StrTemp)
            }
            
            if let StrTemp = dic?.object(forKey: "time") as? NSNumber {
                print(StrTemp)
                
                cell?.lblTime.text = self.milisecondsConvertDateTime(miliseconds:Float(truncating: StrTemp))
            }
            
            if let StrTemp = dic?.object(forKey: "time") as? NSNumber {
                cell?.lblMonth.text = self.milisecondsConvertDateMonth(miliseconds:Float(truncating: StrTemp))
            }
            
            if let groupDic = dic?.object(forKey: "group") as? NSDictionary {
                if let StrTemp = groupDic.object(forKey: "name") as? String {
                    cell?.lblGroupName.text = "Hosted By: " + StrTemp
                }
            }
            return cell!
        }
        else if collectionView == self.collectionviewEvents{
            let  cell = collectionviewEvents?.dequeueReusableCell(withReuseIdentifier: "WherLicktoGo_Cell", for: indexPath) as? WherLicktoGo_Cell
            
            let dic = arrScrolldataEvents[indexPath.row] as? NSDictionary
            
            cell?.DataDic = dic
            
            
            
            if let StrTemp = dic?.object(forKey: "imageURL") as? String {
                let strUrl = StrTemp.replacingOccurrences(of: "\n", with: "")
                
                if let url =  URL(string: strUrl){
                    
//                    cell?.ProfileImg.af_setImage(withURL: url, placeholderImage: #imageLiteral(resourceName: "calendar"), filter: nil, progress: nil, progressQueue: .main, imageTransition: .crossDissolve(0.2), runImageTransitionIfCached: false, completion: nil)
                    cell!.ProfileImg.sd_setImage(with: url, placeholderImage: UIImage(named: ""))
                }
            }
            
            if let StrTemp = dic?.object(forKey: "start_time") as? String {
                cell?.lblDate.text = StrTemp
            }
            
            if let StrTemp = dic?.object(forKey: "name") as? String {
                cell?.lblname.text = StrTemp
            }
            
            return cell!
        }
        else if collectionView == self.collectionviewPlaces{
            let  cell = collectionviewPlaces?.dequeueReusableCell(withReuseIdentifier: "WherLicktoGo_Cell", for: indexPath) as? WherLicktoGo_Cell
            
            if let dic = arrScrolldataPlaces[indexPath.row] as? NSDictionary {
                cell?.DataDic = dic
                
                
                
                if let photoDic = dic.object(forKey: "photos") as? NSArray{
                    for item in photoDic {
                        if let imageData = item as? NSDictionary {
                            if let StrTemp = imageData.object(forKey: "imageURL") as? String {
                                
                                let strUrl = StrTemp.replacingOccurrences(of: "\n", with: "")
                                
                                cell?.ProfileImg.sd_setImage(with: URL(string:strUrl as String), placeholderImage: UIImage(named: "Place"))
                            }
                        }
                    }
                }
                
                if let StrTemp = dic.object(forKey: "name") as? String {
                    cell?.lblname.text = StrTemp
                }
            }
            return cell!
        }
        else{
            let  cell = collectionviewPics?.dequeueReusableCell(withReuseIdentifier: "PleaceDetail_Cell", for: indexPath) as? PleaceDetail_Cell
            
            if let image = arrScrolldataPics[indexPath.item] as? String {
                cell?.img.sd_setImage(with: URL(string:image), placeholderImage: UIImage(named: "instagram"))
            }
            
            
            /*if let url =  URL(string: image!) {
             cell?.img.af_setImage(withURL: url, placeholderImage:#imageLiteral(resourceName: "instagram"), filter: nil, progress: nil, progressQueue: .main, imageTransition: .crossDissolve(0.2), runImageTransitionIfCached: false, completion: nil)
             
             }*/
            
            cell?.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            cell?.layer.shadowOffset = CGSize(width: 0, height: 3)
            cell?.layer.shadowOpacity = 1.0
            cell?.layer.shadowRadius = 10.0
            cell?.layer.cornerRadius = 5.0
            cell?.layer.masksToBounds = false
            
            
            return cell!
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        if collectionView == self.collectionviewAirport_Information{
            let dic = arrScrolldataAirport_Information[indexPath.row] as? NSDictionary
            if let StrTemp = dic?.object(forKey: "FacilityLink") as? String {
                if(StrTemp != ""){
//                    let setting:Web_VC = Web_VC(nibName:appDelegate.CheckDeviceType("Web_VC"),bundle: nil)
//                    setting.tag = "Airport Information"
//                    setting.url = StrTemp
//                    setting.StrAirPortCode = StrAirportCode
//                    self.navigationController?.pushViewController(setting, animated: false)
                }
            }
        }
        else if collectionView == self.collectionviewFlyersInTheCity{
            let dic = arrScrolldataFlyersInTheCity[indexPath.row] as? NSDictionary
            
            var FrdUserId:String?
            if let StrTemp = dic?.object(forKey: "nUserId") as? String {
                FrdUserId  = StrTemp
            }
            
            if(appDelegate.UserId == ""){
//                let RootObj:MainScreen_VC = MainScreen_VC(nibName:appDelegate.CheckDeviceType("MainScreen_VC"),bundle: nil)
//                RootObj.StrTag = "1"
//                RootObj.StrTagNavigat = "FlyerProfile"
//                //RootObj.StrTagFlyerIdNavigat = StrUserId
//                self.navigationController?.pushViewController(RootObj, animated: true)
            }
            else
            {
                
            if(appDelegate.UserId == FrdUserId){
//                let RootObj:SelfProfile_Vc = SelfProfile_Vc(nibName:appDelegate.CheckDeviceType("SelfProfile_Vc"),bundle: nil)
//                self.navigationController?.pushViewController(RootObj, animated: false)
            }
            else{
//                let RootObj:FlyerProfile_Vc = FlyerProfile_Vc(nibName:appDelegate.CheckDeviceType("FlyerProfile_Vc"),bundle: nil)
//                RootObj.DataDic = dic
//                self.navigationController?.pushViewController(RootObj, animated: false)
            }
                
            }
            
        }
        else if collectionView == self.collectionviewShops_Dine{
            let dic = arrScrolldataShops_Dine[indexPath.row] as? NSDictionary
//            let RootObj:ShopAndDineDetail_VC = ShopAndDineDetail_VC(nibName:appDelegate.CheckDeviceType("ShopAndDineDetail_VC"),bundle: nil)
//            RootObj.tag = "Shops & Dine"
//            RootObj.DataDic = dic!
//            self.navigationController?.pushViewController(RootObj, animated: false)
        }
        else if collectionView == self.collectionviewMeetups{
            let dic = arrScrolldataMeetups[indexPath.row] as? NSDictionary
            if let StrTemp = dic?.object(forKey: "event_url") as? String {
//                let setting:Web_VC = Web_VC(nibName:appDelegate.CheckDeviceType("Web_VC"),bundle: nil)
//                setting.tag = "Meetups"
//                setting.url = StrTemp
//                self.navigationController?.pushViewController(setting, animated: false)
            }
        }
        else if collectionView == self.collectionviewEvents{
            let dic = arrScrolldataEvents[indexPath.row] as? NSDictionary
//            let RootObj:ShopAndDineDetail_VC = ShopAndDineDetail_VC(nibName:appDelegate.CheckDeviceType("ShopAndDineDetail_VC"),bundle: nil)
//            RootObj.tag = "Events"
//            RootObj.DataDic = dic!
//            self.navigationController?.pushViewController(RootObj, animated: false)
        }
        else if collectionView == self.collectionviewPlaces{
           let dic = arrScrolldataPlaces[indexPath.row] as? NSDictionary
            
//            let RootObj:ShopAndDineDetail_VC = ShopAndDineDetail_VC(nibName:appDelegate.CheckDeviceType("ShopAndDineDetail_VC"),bundle: nil)
//            RootObj.tag = "Places"
//            RootObj.DataDic = dic!
//            self.navigationController?.pushViewController(RootObj, animated: false)
            
        }
        else if collectionView == self.collectionviewPics{
            
        }
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
    
}
