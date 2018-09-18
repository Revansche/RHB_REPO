//
//  CustomView.swift
//  Igo App
//
//  Created by Alam Yudi on 8/3/16.
//  Copyright © 2016 Alam Yudi. All rights reserved.
//

import UIKit

@IBDesignable
class CustomView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
//            layer.cornerRadius = cornerRadius
//            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
//            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: String = "#000000" {
        didSet {
//            layer.borderColor = UIColor(rgba: borderColor).cgColor //borderColor?.cgColor
        }
    }
    
    @IBInspectable var backColor: String = "#ffffff" {
        didSet {
//            layer.backgroundColor = UIColor(rgba: backColor).cgColor
        }
    }
    
    @IBInspectable var isBorderBottom: Bool = false {
        didSet {
            
        }
    }
    
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        if (isBorderBottom) {
            
            let bottomBorder: CALayer = CALayer(layer: layer)
            bottomBorder.frame = CGRect(x: 0, y: self.frame.size.height - 1.5, width: self.frame.size.width, height: 1)
            bottomBorder.backgroundColor = UIColor(rgba: borderColor).cgColor
            self.layer.addSublayer(bottomBorder)
            
        } else {
            self.layer.borderWidth = self.borderWidth
            self.layer.borderColor = UIColor(rgba: borderColor).cgColor
            
            self.layer.cornerRadius = self.cornerRadius
            if (self.cornerRadius > 0) {
                self.layer.masksToBounds = true;
            }
        }
    }
    

}
