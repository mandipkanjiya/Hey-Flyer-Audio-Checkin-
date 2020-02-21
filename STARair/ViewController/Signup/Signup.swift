//
//  Signup.swift
//  STARair
//
//  Created by Mandip Kanjiya on 27/03/19.
//  Copyright © 2019 Mandip Kanjiya. All rights reserved.
//

import UIKit

class Signup: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var heightLblName: NSLayoutConstraint!
    @IBOutlet weak var heightLblEmail: NSLayoutConstraint!
    @IBOutlet weak var heightLblPassword: NSLayoutConstraint!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btSignIn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let buttonName = "Already have an account? Sign In"
        let range = (buttonName as NSString).range(of: "Sign In")
        let attributedString = NSMutableAttributedString(string:buttonName)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: darkPinkColor, range: range)
        btSignIn.tintColor = UIColor.init(hexString: "#ABABAB")
        btSignIn.setAttributedTitle(attributedString, for: .normal)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClickSignIn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onClickSkipNow(_ sender: Any) {
    }
    @IBAction func onClickSignup(_ sender: Any) {
        
        appDelegate.SetTabBarItem(0)
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if textField == txtName {
            UIView.animate(withDuration: 0.7, animations: {
                self.heightLblName.constant = 0
            })
        }
        
        if textField == txtEmail {
            UIView.animate(withDuration: 0.7, animations: {
                self.heightLblEmail.constant = 0
            })
        }
        
        if textField == txtPassword {
            UIView.animate(withDuration: 0.7, animations: {
                self.heightLblPassword.constant = 0
            })
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == txtName && txtName.text! == "" {
            UIView.animate(withDuration: 0.7, animations: {
                self.heightLblName.constant = 43
            })
        }
        
        if textField == txtEmail && txtEmail.text! == "" {
            UIView.animate(withDuration: 0.7, animations: {
                self.heightLblEmail.constant = 43
            })
        }
        
        if textField == txtPassword && txtPassword.text! == "" {
            UIView.animate(withDuration: 0.7, animations: {
                self.heightLblPassword.constant = 43
            })
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
