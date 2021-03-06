//
//  Colors.swift
//  Igo App
//
//  Created by Alam Yudi on 9/11/16.
//  Copyright © 2016 Alam Yudi. All rights reserved.
//

import UIKit

class Colors: NSObject {
    
    static func blackPrimary() -> UIColor {
        return UIColor(rgba: "#000000")
    }
    
    static func blackSecondary() -> UIColor {
        return UIColor(rgba: "#1a1a1a")
    }
    
    static func grayPrimary() -> UIColor {
        return UIColor(rgba: "#333333")
    }
    
    static func orangePrimary() -> UIColor {
        return UIColor(rgba: "#FF6600")
    }
    
    static func greenPrimary() -> UIColor {
        return UIColor(rgba: "#72f34a")
    }
  
  static var rhbMainBlue: UIColor {
    return UIColor(red: (19/255.0), green: (94/255.0), blue: (170/255.0), alpha: 1)
  }
  
  static var rhbMainBluePale: UIColor {
    return UIColor(red: (88/255.0), green: (128/255.0), blue: (164/255.0), alpha: 1)
  }
}

class DeviceOrientation: NSObject {
    
    static func currentOrientation() -> Int {
        var tmpLastOrientation = -1
        switch UIDevice.current.orientation{
        case .portrait:
            tmpLastOrientation = 1
        case .portraitUpsideDown:
            tmpLastOrientation = 1
        case .landscapeLeft:
            tmpLastOrientation = 0
        case .landscapeRight:
            tmpLastOrientation = 0
        default:
            tmpLastOrientation = -1
        }
        return tmpLastOrientation
    }
    
}
