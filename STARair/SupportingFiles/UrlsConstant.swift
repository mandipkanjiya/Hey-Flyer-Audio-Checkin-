//
//  UrlsConstant.swift
//  FindMe
//
//  Created by shoebpersonal on 7/15/16.
//  Copyright © 2016 shoebpersonal. All rights reserved.
//

import Foundation

//API Constant
let kAppName = "MUSA"
let kMessage = "message"
let kMessageText = "No results found"
let kServerErrorMessage = "Something went wrong please try again or contact your administrator"
let kSuccess = "success"
let kUserId = "nUserId"
let kCode = "code"
let kResult = "result"

let kEducation = "education"
let kErrorMessage = "error_message"

let kPostMethod = "POST"
let kGetMethod = "GET"

//Live Base url
let kMainDomainUrl = "https://www.heyflyer.com/Webservices/"
//let kMainDomainUrl = "http://18.185.24.180/Webservices/"
//Saporting Url
let kBgImg = "http://heyflyer.com/appbg/bg.jpg"
let kAvtar = "http://meetmeatairport.com/Webservices/uploads/avtarm1.png"
let urlCityImg = "http://meetmeatairport.com/Webservices/cityimage/"
let urlimg = "http://d3brl4nqahsb3e.cloudfront.net/logos/png/300x100/"

//let urlAirLine = "https://cometari-airportsfinder-v1.p.mashape.com/api/airports/by-code?code="
let urlCuntryFlag = "http://www.heathrow.com/file_source/Heathrow/Images/regular/icons/tailfin-"
let urlFlag = "https://www.heyflyer.com/country/"
let kMainBaseCustomerID = "http://www.karram.ae/meetme/webservices/Customer.asmx/AddCustomer"
let urledu = "http://meetmeatairport.com/Webservices/educationlist.json"

//Startup Api url
let kRegister = "\(kMainDomainUrl)user_register_login.php" //1
let kLogin = "\(kMainDomainUrl)post_user_login.php" //2
let kforgot_password = "\(kMainDomainUrl)forgot_password.php" //42
let urlAirLine = "\(kMainDomainUrl)getairportdetail.php?code=" //1
//Browse
let kcurrentweather = "\(kMainDomainUrl)currentweather.php" //80

let kgetAllAirportData = "\(kMainDomainUrl)getAllAirportData.php" //92
let kGetCityLiveInUser = "\(kMainDomainUrl)get_arrivinguserlistby_code.php" //87
let kGetRestaurants = "\(kMainDomainUrl)shopanddine.php"   //93
let kMeetup = "\(kMainDomainUrl)meetUpEventGet.php"        //96
let kfacebookEvent = "\(kMainDomainUrl)facebookevent.php"  //79
let knearbyplaces = "\(kMainDomainUrl)nearbyplaces1.php"   //
let kMyPinterest = "\(kMainDomainUrl)instagrampost.php"    //91
let kget_discussiondetail = "\(kMainDomainUrl)get_discussiondetail.php" //12

//Home Page
let kPeople_nearby_you = "\(kMainDomainUrl)people_nearby_you.php"
let kgetAllData = "\(kMainDomainUrl)getAllData.php"//75
let kGetOurUsers = "\(kMainDomainUrl)getLatestUsers.php" // 94  == Current Users = LatestUsers
let kGetLastJourneyUsers = "\(kMainDomainUrl)getLastJourneyUsers.php" // 95 == LastJourneyUsers
let kMeetingSuggestionUser = "\(kMainDomainUrl)meetingSuggestionUserJourney.php" // 99
let kairlines_json = "https://www.heyflyer.com/airlines.json"
let kJourney_Listbyid_second = "\(kMainDomainUrl)journey_listbyid_second.php" // 31
let kjourney_listbyid = "\(kMainDomainUrl)journey_listbyid.php" // 31
let kGetUserFliteMates = "\(kMainDomainUrl)getuserflitemates.php"
let kview_user_profile_second = "\(kMainDomainUrl)view_user_profile_second.php"

let kinsert_journey = "\(kMainDomainUrl)insert_journey_new.php"  // 19
let kupdate_journeydetail = "\(kMainDomainUrl)update_journeydetail.php"
let kDeleteJourney = "\(kMainDomainUrl)DeleteJourney.php"

let kchangeMeetingStatus = "\(kMainDomainUrl)changeMeetingStatus.php" //43
let kGetNearByAirport = "\(kMainDomainUrl)getNearByAirport.php" //84
let kurlupdate_user_location = "\(kMainDomainUrl)update_user_location.php" // 33
let kupdate_user_uuid = "\(kMainDomainUrl)update_user_uuid.php" // 52

let kflightchecking = "\(kMainDomainUrl)flightchecking.php"
let kgetinterestjson = "\(kMainDomainUrl)getinterestjson.php"
let kinsert_interest = "\(kMainDomainUrl)insert_interest.php"
let kget_hashtag = "\(kMainDomainUrl)get_hashtag.php"
let kinsert_profileviewer = "\(kMainDomainUrl)insert_profileviewer.php"
let kget_sameflightiserlist_second = "\(kMainDomainUrl)get_sameflightiserlist_second.php"
let kget_flightmate_second = "\(kMainDomainUrl)get_flightmate_second.php"
let ksetMeeting = "\(kMainDomainUrl)setMeeting.php"
let kupdate_user_profile = "\(kMainDomainUrl)update_user_profile.php"
let kUpdateEmailSetting = "\(kMainDomainUrl)UpdateEmailSetting.php"
let kUpdatePushSetting = "\(kMainDomainUrl)UpdatePushSetting.php"
let kGetBanner = "\(kMainDomainUrl)getbanner.php"
let kGetUserJourneybyid = "\(kMainDomainUrl)user_journey_airportdetail.php"//118

let kMeetingCount = "\(kMainDomainUrl)meetingcount.php"
let kMeetingGetReq = "\(kMainDomainUrl)meetingToUserWise.php"
let kMeetingacceptedReq = "\(kMainDomainUrl)meetingaccepted.php"
let kMeetingSuggestion = "\(kMainDomainUrl)meetingSuggestionUser.php"
let kMeetingSuggestionJourney = "\(kMainDomainUrl)meetingSuggestionUserJourney.php"
let kSuggestionJourney = "\(kMainDomainUrl)journey.php"
let kGetAtairportDetail = "\(kMainDomainUrl)getatairportdetail.php"
let kget_journey_details_byid = "\(kMainDomainUrl)get_journey_details_byid.php"
let kget_all_notification = "\(kMainDomainUrl)get_all_notification.php"
let kview_notification = "\(kMainDomainUrl)view_notification.php"

let kchatNotification = "\(kMainDomainUrl)chatNotification.php"
let kinsert_UserPassportdetail = "\(kMainDomainUrl)insert_UserPassportdetail.php"
let kuser_passport_detial = "\(kMainDomainUrl)user_passport_detial.php"
let kinsert_airlinereward = "\(kMainDomainUrl)insert_airlinereward.php"
let klist_airlinerewards = "\(kMainDomainUrl)list_airlinerewards.php"
let kinsert_frequentflyer_detail = "\(kMainDomainUrl)insert_frequentflyer_detail.php"
let GetAviationData = "http://aviation-edge.com/v2/public/timetable"
let AviationKey = "13156c-13cf44"
let GetAirportCodeToName = "http://aviation-edge.com/v2/public/airportDatabase"
let kjourney_v1 = "\(kMainDomainUrl)journey_v1.php" //Meeting screen

func GetDateOrTime(_ dateString : String)-> (dateStr : String, timeStr : String){
    
    let dateFormatter = DateFormatter()
    dateFormatter.locale =  Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    //        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
    var dateObj = dateFormatter.date(from: dateString)
    if dateObj == nil {
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateObj = dateFormatter.date(from: dateString)
    }
    dateFormatter.dateFormat = "dd/MM/yyyy"
    var dateStr = ""
    if dateObj != nil {
        dateStr = dateFormatter.string(from: dateObj!)
    }
    //        print("Dateobj: \(dateStr))")
    
    dateFormatter.dateFormat = "HH:mm"
    var timeStr = ""
    if dateObj != nil {
        timeStr = dateFormatter.string(from: dateObj!)
    }
    //        print("Dateobj: \(timeStr))")
    //    let newStr = String(format: "%@ Time: %@", arguments: [dateStr,timeStr])
    return (dateStr,timeStr)
}


func GetFormatedDateromString(_ dateString : String)-> String{
    
    let dateFormatter = DateFormatter()
    dateFormatter.locale =  Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    //        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
    var dateObj = dateFormatter.date(from: dateString)
    if dateObj == nil {
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateObj = dateFormatter.date(from: dateString)
    }
    
    dateFormatter.dateFormat = "dd/MM/yyyy"
    var dateStr = ""
    if dateObj != nil {
        dateStr = dateFormatter.string(from: dateObj!)
    }
    //        print("Dateobj: \(dateStr))")
    
    dateFormatter.dateFormat = "HH:mm"
    var timeStr = ""
    if dateObj != nil {
        timeStr = dateFormatter.string(from: dateObj!)
    }
    //        print("Dateobj: \(timeStr))")
    let newStr = String(format: "%@ Time: %@", arguments: [dateStr,timeStr])
    return newStr
}

func GetFormatedDateNoMilliSecondfromString(_ dateString : String)-> String{
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    //        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
    var dateObj = dateFormatter.date(from: dateString)
    if dateObj == nil {
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        dateObj = dateFormatter.date(from: dateString)
    }
    
    dateFormatter.dateFormat = "dd/MM/yyyy"
    var dateStr = ""
    if dateObj != nil {
        dateStr = dateFormatter.string(from: dateObj!)
    }
    //        print("Dateobj: \(dateStr))")
    
    dateFormatter.dateFormat = "HH:mm"
    var timeStr = ""
    if dateObj != nil {
        timeStr = dateFormatter.string(from: dateObj!)
    }
    //        print("Dateobj: \(timeStr))")
    let newStr = String(format: "%@ Time: %@", arguments: [dateStr,timeStr])
    return newStr
}

func GetNewDicationary(_ data : NSDictionary) -> NSDictionary{
    let tempData = NSMutableDictionary()
    for object in data.allKeys {
        if let keyStr = object as? String {
            
            if let _ = data.object(forKey: keyStr) as? NSNull {
                tempData.setObject("", forKey: keyStr as NSCopying)
            }else{
                tempData.setObject(data.object(forKey: keyStr)!, forKey: keyStr as NSCopying)
            }
            
        }
        
    }
    return tempData
}


func GetTodayDate(_ isTommorow : Bool)-> String{
    
    let dateFormatter = DateFormatter()
    dateFormatter.locale =  Locale(identifier: "en_US_POSIX")
    let calendar = Calendar.current
    
    let todayDate = Date()
    
    var components = (calendar as NSCalendar).components([.day , .month, .year ], from: todayDate)
    components.hour = 0
    components.minute = 0
    components.second = 0
    if isTommorow == true {
        components.day = components.day! + 1
    }
    let newDate = calendar.date(from: components)
    dateFormatter.locale =  Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    var dateStr = dateFormatter.string(from: newDate!)
    
    if dateStr.isEmpty == true {
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        dateStr = dateFormatter.string(from: newDate!)
    }
    //print("newDate: \(dateStr)")
    if isTommorow == true {
        print("Today: \(dateStr)")
    }else{
        print("Tommorow: \(dateStr)")
    }
    
    return dateStr
    
}

