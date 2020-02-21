//
//  AppDelegate.swift
//  STARair
//
//  Created by Mandip Kanjiya on 27/03/19.
//  Copyright © 2019 Mandip Kanjiya. All rights reserved.
//

import UIKit
let imageCache = NSCache<AnyObject, AnyObject>()
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,UITabBarControllerDelegate {

    var window: UIWindow?

    var isLoadingViewVisible:Bool = false
    var navigate:UINavigationController?
    var isIpad = false
    var UserId:String = ""
    var Username:String?
    var Key: String = String()
    var SenderId:String?
    var Sendername:String?
    var SenderProfileImage:String?
    var DataDic:NSDictionary!
    var CustomerID = 0
    var isFromNotification = false
    var DeviceUUID: String = "0"
    var SocialType: String?
    var viaDeeplinking = ""
    var cAbout = "Get Live Flight Updates & Explore Airports"
    //Location
    let locationManager = CLLocationManager()
    var latitute: String = "0.0"
    var longitute: String = "0.0"
    var didFindLocation: Bool?
    
    
    
    //ChatFlag
    var childKey: String = "0"
    var FrdID: String?
    var FrdCheck: Bool = false
    var CheckUserTag: Bool?
    var FirebaseToken: String = ""
    var isSend: Bool?
    var FrdKey: String = ""
    
    var isBlockFrd:Int = 0
    var timer = Timer()
    
   
    var StrBadgeCount:Int = 0
     var tabBarController1 = UITabBarController()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        SetTabBarItem(0)
        // Override point for customization after application launch.
        return true
    }

    //MARK: - Create TabBar Controller
    
    func SetTabBarItem(_ buttotag : Int){
        
        
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        var tabBarController = UITabBarController()
        
        //        let controller1 = FlightMates_Next_VC(nibName: CheckDeviceType("FlightMates_Next_VC"), bundle: nil)
        //        let navController1 = UINavigationController(rootViewController: controller1)
        //        navController1.tabBarItem.image = UIImage(named: "footerhome")
        //        navController1.tabBarItem.title = "Home"
        //        controller1.navigationController?.isNavigationBarHidden = false
        //        SetNavigationBarColor(controller1, leftmenu: "", rightmenu: "")
        //first
        
        
        
//        let controller1 = SJSwiftSideMenuController()
//
//        let sideVC_L : SideMenu_Vc = (objHomeSB.instantiateViewController(withIdentifier: "SideMenu_Vc") as? SideMenu_Vc)!
//        // sideVC_L.menuItems = months as NSArray!
//
//        let sideVC_R : SideMenu_Vc = (objHomeSB.instantiateViewController(withIdentifier: "SideMenu_Vc") as? SideMenu_Vc)!
//        //sideVC_R.menuItems = days as NSArray!
//
//        let rootVC = objHomeSB.instantiateViewController(withIdentifier: "Home") as UIViewController
//
//        SJSwiftSideMenuController.setUpNavigation(rootController: rootVC, leftMenuController: sideVC_L, rightMenuController: sideVC_R, leftMenuType: .SlideOver, rightMenuType: .SlideView)
//
//        SJSwiftSideMenuController.enableSwipeGestureWithMenuSide(menuSide: .LEFT)
//
//        SJSwiftSideMenuController.enableDimbackground = true
//        SJSwiftSideMenuController.leftMenuWidth = 280
//        //=======================================
        
        let appearance = UITabBarItem.appearance()
        let attributes = [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 22)]
//        appearance.setTitleTextAttributes(attributes, for: .normal)
        
         let controller1 = objMain.instantiateViewController(withIdentifier: "Home")as! Home
        let navController1 = UINavigationController(rootViewController: controller1)
        navController1.tabBarItem.image = UIImage(named: "ic_book")
        navController1.tabBarItem.title = "Book"
        UITabBarItem.appearance().setTitleTextAttributes(attributes, for: .normal)
        controller1.navigationController?.isNavigationBarHidden = true
        //SetNavigationBarColor(controller1, leftmenu: "", rightmenu: "")
        
        //second
        let controller2 = objMain.instantiateViewController(withIdentifier: "Manage")as! Manage
        let navController2 = UINavigationController(rootViewController: controller2)
        navController2.tabBarItem.image = UIImage(named: "ic_manage")
        navController2.tabBarItem.title = "My Trips"
        controller2.navigationController?.isNavigationBarHidden = true
        
        //Third
        
//        let RootObj:Where_Lick_Togo_Vc = Where_Lick_Togo_Vc(nibName:appDelegate.CheckDeviceType("Where_Lick_Togo_Vc"),bundle: nil)
        let controller3 = objMain.instantiateViewController(withIdentifier: "Flightschedule_Vc")as! Flightschedule_Vc
//        let navController3 = UINavigationController(rootViewController: RootObj)
        let navController3 = UINavigationController(rootViewController: controller3)
        navController3.tabBarItem.image = UIImage(named: "ic_status")
        navController3.tabBarItem.title = "Status"
        controller3.navigationController?.isNavigationBarHidden = true
//        RootObj.navigationController?.isNavigationBarHidden = true
        
        
        
        
        //        //Fourth
        //        var objSB = objHome
        //        if UIDevice.current.userInterfaceIdiom == .pad
        //        {
        //            objSB = objProfileIpad
        //        }
        //        else
        //        {
        //            objSB = objHome
        //        }
//        let RootObj:Where_Lick_Togo_Vc = Where_Lick_Togo_Vc(nibName:appDelegate.CheckDeviceType("Where_Lick_Togo_Vc"),bundle: nil)
        let controller4 = objMain.instantiateViewController(withIdentifier: "InflightEntertainment")as! InflightEntertainment
        let navController4 = UINavigationController(rootViewController: controller4)
        navController4.tabBarItem.image = UIImage(named: "ic_status")
        navController4.tabBarItem.title = "Inflight"
        controller4.navigationController?.isNavigationBarHidden = true
        
        
        let controller5 = objMain.instantiateViewController(withIdentifier: "STARFlyer")as! STARFlyer
        let navController5 = UINavigationController(rootViewController: controller5)
        navController5.tabBarItem.image = UIImage(named: "")
        navController5.tabBarItem.title = "STARFlyer"
        controller5.navigationController?.isNavigationBarHidden = true
        
        //        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        //        let controller4 = storyBoard.instantiateViewController(withIdentifier: "Meetup_VC") as! Meetup_VC
        //        let navController4 = UINavigationController(rootViewController: controller4)
        //        navController4.tabBarItem.image = UIImage(named: "footer_meeting")
        //        navController4.tabBarItem.title = "Meetings"
        //        navController4.navigationController?.isNavigationBarHidden = false
        
        tabBarController.delegate = self
        
        tabBarController.viewControllers = [navController1, navController2,navController3,navController4,navController5]
        tabBarController.tabBar.selectedImageTintColor = UIColor.black
        tabBarController.tabBar.unselectedItemTintColor = UIColor.gray
        UITabBar.appearance().barTintColor = UIColor.white
        
        let topBorder = CALayer()
        
        let borderHeight: CGFloat = 1
        tabBarController.selectedIndex = buttotag
        topBorder.borderWidth = borderHeight
        topBorder.borderColor = UIColor.white.cgColor
        
        topBorder.frame = CGRect(x: 0, y: -1, width: tabBarController.tabBar.frame.width, height: borderHeight)
        tabBarController.tabBar.layer.addSublayer(topBorder)
        tabBarController1 = tabBarController
        appDelegate.window?.rootViewController = tabBarController1
    }
    
    //MARK: - CheckDeviceType
    
    func CheckDeviceType(_ name: String) -> String {
        var Type: String?
        
        if (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad) {
            
            print("========= iPad =========")
            
            if(name == "ViewController"){
                Type = "ViewController_ipad"
            }
            else if(name == "Startup_Vc_New"){
                Type = "Startup_Vc_New_ipad"
            }
            else if(name == "BrowseTop_Vc"){
                Type = "BrowseTop_Vc"
            }
            else if(name == "TravellingFrom"){
                Type = "TravellingFrom_ipad"
            }
            else if(name == "Where_Lick_Togo_Vc"){
                Type = "Where_Lick_Togo_Vc"
            }
            else if(name == "MainScreen_VC"){
                Type = "MainScreen_VC_ipad"
            }
            else if(name == "SignInViewController"){
                Type = "SignInViewController_ipad"
            }
            else if(name == "ForgotPass_VC"){
                Type = "ForgotPass_VC_ipad"
            }
            else if(name == "SignUp_Vc"){
                Type = "SignUp_Vc_ipad"
            }
            else if(name == "SignUp_Next_VC"){
                Type = "SignUp_Next_VC_ipad"
            }
            else if(name == "Qualification_vc"){
                Type = "Qualification_vc"
            }
            else if(name == "nationality_VC"){
                Type = "nationality_VC"
            }
            else if(name == "Where_Lick_Togo_Flyer_Vc"){
                Type = "Where_Lick_Togo_Flyer_Vc"
            }
            else if(name == "AirPortNinformationList_Vc"){
                Type = "AirPortNinformationList_Vc"
            }
            else if(name == "ShopAndDine_VC"){
                Type = "ShopAndDine_VC"
            }
            else if(name == "Meetups_vc"){
                Type = "Meetups_vc"
            }
            else if(name == "Web_VC"){
                Type = "Web_VC_ipad"
            }
            else if(name == "ShopAndDineDetail_VC"){
                Type = "ShopAndDineDetail_VC"
            }
            else if(name == "FlyerList_vc"){
                Type = "FlyerList_vc"
            }
            else if(name == "FlyerProfile_Vc"){
                Type = "FlyerProfile_Vc"
            }
            else if(name == "Community_Vc"){
                Type = "Community_Vc"
            }
            else if(name == "SelfProfile_Vc"){
                Type = "SelfProfile_Vc"
            }
                //
                
                
                
            else if(name == "HeyFlyer_Home_Vc"){
                Type = "HeyFlyer_Home_Vc"
            }
            else if(name == "CheckIn_VC"){
                Type = "CheckIn_VC"
            }
                
            else if(name == "ChatList_VC"){
                Type = "ChatList_VC_ipad"
            }
                
            else if(name == "FlightMates_Next_VC"){
                Type = "FlightMates_Next_VC_ipad"
            }
            else if(name == "EditProfile_VC"){
                Type = "EditProfile_VC_ipad"
            }
            else if(name == "Setting_vc"){
                Type = "Setting_vc_ipad"
            }
            else if(name == "EmailVc"){
                Type = "EmailVc_ipad"
            }
                
            else if(name == "More_Vc"){
                Type = "More_Vc"
            }
            else if(name == "AirLine_VC"){
                Type = "AirLine_VC_ipad"
            }
            else if(name == "Sent_Meeting_RQ_VC"){
                Type = "Sent_Meeting_RQ_VC_ipad"
            }
                
            else if(name == "Tour_Detail_VC"){
                Type = "Tour_Detail_VC_ipad"
            }
            else if(name == "CheckInFirstVC"){
                Type = "CheckInFirstVC"
            }
                
                
            else if(name == "InternetVC"){
                Type = "InternetVC_ipad"
            }
            
        } else {
            // iPhone
            print("========= iPhone =========")
            
            if(name == "ViewController"){
                Type = "ViewController"
            }
            else if(name == "Startup_Vc_New"){
                Type = "Startup_Vc_New"
            }
            else if(name == "BrowseTop_Vc"){
                Type = "BrowseTop_Vc"
            }
            else if(name == "TravellingFrom"){
                Type = "TravellingFrom"
            }
            else if(name == "Where_Lick_Togo_Vc"){
                Type = "Where_Lick_Togo_Vc"
            }
            else if(name == "MainScreen_VC"){
                Type = "MainScreen_VC"
            }
            else if(name == "SignInViewController"){
                Type = "SignInViewController"
            }
            else if(name == "ForgotPass_VC"){
                Type = "ForgotPass_VC"
            }
            else if(name == "SignUp_Vc"){
                Type = "SignUp_Vc"
            }
            else if(name == "SignUp_Next_VC"){
                Type = "SignUp_Next_VC"
            }
            else if(name == "Qualification_vc"){
                Type = "Qualification_vc"
            }
            else if(name == "nationality_VC"){
                Type = "nationality_VC"
            }
            else if(name == "Where_Lick_Togo_Flyer_Vc"){
                Type = "Where_Lick_Togo_Flyer_Vc"
            }
            else if(name == "AirPortNinformationList_Vc"){
                Type = "AirPortNinformationList_Vc"
            }
            else if(name == "ShopAndDine_VC"){
                Type = "ShopAndDine_VC"
            }
            else if(name == "Meetups_vc"){
                Type = "Meetups_vc"
            }
            else if(name == "Web_VC"){
                Type = "Web_VC"
            }
            else if(name == "ShopAndDineDetail_VC"){
                Type = "ShopAndDineDetail_VC"
            }
            else if(name == "FlyerList_vc"){
                Type = "FlyerList_vc"
            }
            else if(name == "FlyerProfile_Vc"){
                Type = "FlyerProfile_Vc"
            }
            else if(name == "Community_Vc"){
                Type = "Community_Vc"
            }
            else if(name == "SelfProfile_Vc"){
                Type = "SelfProfile_Vc"
            }
                
                
            else if(name == "HeyFlyer_Home_Vc"){
                Type = "HeyFlyer_Home_Vc"
            }
            else if(name == "CheckIn_VC"){
                Type = "CheckIn_VC"
            }
                
            else if(name == "ChatList_VC"){
                Type = "ChatList_VC"
            }
                
            else if(name == "FlightMates_Next_VC"){
                Type = "FlightMates_Next_VC"
            }
            else if(name == "EditProfile_VC"){
                Type = "EditProfile_VC"
            }
            else if(name == "Setting_vc"){
                Type = "Setting_vc"
            }
            else if(name == "EmailVc"){
                Type = "EmailVc"
            }
                
            else if(name == "More_Vc"){
                Type = "More_Vc"
            }
            else if(name == "AirLine_VC"){
                Type = "AirLine_VC"
            }
            else if(name == "Sent_Meeting_RQ_VC"){
                Type = "Sent_Meeting_RQ_VC"
            }
            else if(name == "Tour_Detail_VC"){
                Type = "Tour_Detail_VC"
            }else if(name == "CheckInFirstVC"){
                Type = "CheckInFirstVC"
            }
                
            else if(name == "InternetVC"){
                Type = "InternetVC"
            }
        }
        return Type!
    }
    //MARK: - Loader -
    func showLoader() {
        self.window?.isUserInteractionEnabled = false
        SVProgressHUD.setBackgroundColor(UIColor.clear)
        SVProgressHUD.setRingThickness(3)
        SVProgressHUD.show()
    }
    
    func hideLoader() {
        self.window?.isUserInteractionEnabled = true
        SVProgressHUD.dismiss()
    }
    
    
    
    func showLoader1() {
        SVProgressHUD.setBackgroundColor(UIColor.clear)
        SVProgressHUD.setRingThickness(3)
        SVProgressHUD.show()
    }
    
    func hideLoader1() {
        SVProgressHUD.dismiss()
    }
    
    //MARK: - AlertMessage
    
    func AlertMessage(_ title: String ,message: String){
        //Opps!
        DispatchQueue.main.async {
            
            let alertView = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            alertView.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: { (alertAction) -> Void in
                
            }))
            self.window?.rootViewController!.present(alertView, animated: true, completion: nil)
        }
    }
    
    //MARK:- SET Date & Time Format
    
    func SetDateFormat(_ strDate: String)-> String{
        print(strDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let yourDate = dateFormatter.date(from: strDate)!
        dateFormatter.dateFormat = "MMM dd, yyyy"
        let convertdate: String = dateFormatter.string(from: yourDate)
        
        return convertdate
    }
    
    func SetDateFormatNew(_ strDate: String)-> String{
        print(strDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let yourDate = dateFormatter.date(from: strDate)!
        dateFormatter.dateFormat = "dd MMM"
        let convertdate: String = dateFormatter.string(from: yourDate)
        
        return convertdate
    }
    
    func SetDayOfweekFromdate(_ strDate: String)-> String{
        print(strDate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let yourDate = dateFormatter.date(from: strDate)!
        let weekdays = [
            "Sunday",
            "Monday",
            "Tuesday",
            "Wednesday",
            "Thursday",
            "Friday",
            "saturday,"
        ]
        
        
        return weekdays[Calendar.current.dateComponents([.weekday], from: yourDate).weekday! - 1]
    }
    
    func SetDateFormatSent(_ strDate: String)-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        
        let yourDate = dateFormatter.date(from: strDate)!
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let convertdate: String = dateFormatter.string(from: yourDate)
        
        return convertdate
    }
    
    func SetDateFormatSentCheckIn(_ strDate: String)-> String{
        
        if strDate.contains("-")
        {
            //            let dateFormatter = DateFormatter()
            //            dateFormatter.dateFormat = "dd/MM/yyyy"
            //
            //            let yourDate = dateFormatter.date(from: strDate)!
            //            dateFormatter.dateFormat = "yyyy-MM-dd"
            //            let convertdate: String = dateFormatter.string(from: yourDate)
            
            return strDate
        }
        else
        {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            
            let yourDate = dateFormatter.date(from: strDate)!
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let convertdate: String = dateFormatter.string(from: yourDate)
            
            return convertdate
        }
        
    }
    
    
    func SetTimeFormat(_ strDate: String)-> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "H:mm:ss"
        
        let yourDate = dateFormatter.date(from: strDate)!
        dateFormatter.dateFormat = "h:mm aa"
        let convertdate: String = dateFormatter.string(from: yourDate)
        
        return convertdate
    }
    
    func SetTimeFormat242(_ strDate: String)-> String{
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "H:mm:ss"
        
        let yourDate = dateFormatter.date(from: strDate)!
        dateFormatter.dateFormat = "HH:mm"
        let convertdate: String = dateFormatter.string(from: yourDate)
        
        return convertdate
    }
    
    
    func SetTimeFormat24(_ strDate: String)-> String{
        
        if strDate.count > 5
        {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "h:mm aa"
            
            
            if dateFormatter.date(from: strDate) != nil {
                let yourDate = dateFormatter.date(from: strDate)!
                dateFormatter.dateFormat = "HH:mm"
                let convertdate: String = dateFormatter.string(from: yourDate)
                
                return convertdate
            } else {
                dateFormatter.dateFormat = "h:mma"
                if dateFormatter.date(from: strDate) != nil {
                    let yourDate = dateFormatter.date(from: strDate)!
                    dateFormatter.dateFormat = "HH:mm"
                    let convertdate: String = dateFormatter.string(from: yourDate)
                    
                    return convertdate
                } else {
                    dateFormatter.dateFormat = "H:mm:ss"
                    let yourDate = dateFormatter.date(from: strDate)!
                    dateFormatter.dateFormat = "HH:mm"
                    let convertdate: String = dateFormatter.string(from: yourDate)
                    
                    return convertdate
                }
                // invalid format
                
            }
            
            
        }
        else
        {
            let date = strDate.split(separator: " ")
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            
            let yourDate = dateFormatter.date(from: String(date[0]))!
            dateFormatter.dateFormat = "HH:mm"
            let convertdate: String = dateFormatter.string(from: yourDate)
            
            return convertdate
        }
        
    }
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

extension UIImageView {
    func cacheImage(urlString: String,placeholder:String){
        let url = URL(string: urlString)
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            SVProgressHUD.dismiss()
            return
        }
        self.image = UIImage(named:placeholder)
        URLSession.shared.dataTask(with: url!) {
            data, response, error in
            if let response = data {
                DispatchQueue.main.async {
                    let imageToCache = UIImage(data: data!)
                    
                    if imageToCache != nil {
                        imageCache.setObject(imageToCache!, forKey: urlString as AnyObject)
                        self.image = imageToCache
                    }
                    
                    SVProgressHUD.dismiss()
                }
            }
            }.resume()
    }
}
