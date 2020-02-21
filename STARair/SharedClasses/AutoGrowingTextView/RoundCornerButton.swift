//
//  RoundCornerButton.swift
//  CuroRC
//
//  Created by Nikunj on 23/06/16.
//  Copyright © 2016 Nikunj. All rights reserved.
//

import UIKit

class GradientView: UIView {
    override open class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let gradientLayer = layer as! CAGradientLayer
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
    }
}

class RoundCornerButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            //layer.masksToBounds = cornerRadius > 0
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    @IBInspectable var bgColor: UIColor? {
        didSet {
            backgroundColor = bgColor
        }
    }
    @IBInspectable var titleColor: UIColor? {
        didSet {
            setTitleColor(titleColor, for: UIControl.State())
        }
    }
    @IBInspectable var ShadowColor: UIColor? {
        didSet {
            self.layer.shadowColor = ShadowColor!.cgColor
            self.layer.shadowOffset = CGSize(width: 3, height: 3)
            self.layer.shadowRadius = 1
            self.layer.shadowOpacity = 0.5
        }
    }
    init() {
        super.init(frame: CGRect.zero)
        roundCorner()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        roundCorner()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        roundCorner()
    }
    func roundCorner(){
    }
}
