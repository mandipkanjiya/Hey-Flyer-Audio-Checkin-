//
//  Constant.swift
//  Deputize America
//
//  Created by Darshak Trivedi.
//  Copyright © 2017 Scorch Mobile. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

let appDelegate = UIApplication.shared.delegate as! AppDelegate

//MARK:- Font
let RalewayRegular = "Raleway-Regular"

//MARK:- Color

let darkPinkColor = UIColor(hexString: "EE6EA1")
let palceHolderColor = UIColor(hexString: "EE6EA1").withAlphaComponent(0.7)


//MARK:- Storyboards Objects
let objLaunchScreenSB = UIStoryboard(name: "LaunchScreen", bundle: nil)
let objMain = UIStoryboard(name: "Main", bundle: nil)
let objHome = UIStoryboard(name: "HomeSB", bundle: nil)


//MARK:- General Constant
var kUserType = ""
let kAlertTitle = "Baci Fashion"
var kNavBarHeight:CGFloat = 0.0
let kToken = "token"
let kEmpID = "employeeID"
let kEmpEmailID = "emaiID"
let kEmpStatus = "empStatus"
let kEmpRoleID = "empRoleID"
let kAgree = "empAgree"
let kAmSpId = "empAmspid"
let kEmpName = "empName"
let kEmpRate = "empRate"
let kIsLogin = "isLogin"
let kURL = "kUrl"
//let kMessage = "message"

// MARK: - Validation Messages

let kValidationMobileNo = "Please enter mobile number"
let kValidationPassword = "Please enter password"
let kValidationFirstName = "Please enter First Name"
let kValidationLastName = "Please enter Last Name"
let kValidationEmail = "Please enter Email"
let kValidationInvalidEmail = "Please enter valid email"
let kValidationConfirmPassword = "Please enter confirm password"
let kValidationMinLength = "Please enter at list 6 characters"
let kValidationNotMatch = "Password and confirm password not matched"
let kValidationAccountHolderName = "Please enter account holder name"
let kValidationAccountNumber = "Please enter account number"
let kValidationSwiftCode = "Please enter swift code"
let kValidationTermsAndCondition = "Please check terms and conditions"
let kValidationDate = "Please select date"
let kValidationName = "Please enter name"
let kValidationRegistrationNumber = "Please eneter registration number"
let kValidationTime = "Please select time"
let kValidationBookingID = "Please enter booking id"
let kValidationSmartAppearance = "Please check smart appearance"
let kValidationFuel = "Please select fuel"
let kValidationDamageAndDefects = "Please enter damage and defects"
let kValidationRectifiedBy = "Please enter rectified by"
let kValidationExcessExhaust = "Please select excess exhaust smoke"
let kValidationOperationTeamInfo = "Please select operation team informed"
let kValidationICanConfirm = "Please select I can confirm I have taken my legal rest"
let kValidationVehicleFit = "Please select vehicle fit purpose"
let kValidationCardNumber = "Please enter card number"
let kValidationCardMonth = "Please select month"
let kValidationCardYear = "Please select year"
let kValidationCVV = "Please enter CVV"
let kValidationCardHolder = "Please enter card holder name"
let kValidationCardCountry = "Please enter country/Region"
