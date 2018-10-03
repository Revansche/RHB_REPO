//
//  RHBFormValidator.swift
//  rhb registration
//
//  Created by Ghean Ginanjar on 01/10/18.
//  Copyright © 2018 RHB TradeSmart. All rights reserved.
//

import Foundation

struct RHBFormValidator {  
  static func emailValidation(input inputString: String) -> Bool {
    let regex = NSRegularExpression("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
    return regex.matches(inputString)
  }
  
  static func phoneNumberValidation(input inputString: String) -> Bool {
    let regex = NSRegularExpression("^08[0-9]{7,13}$")
    return regex.matches(inputString)
  }
}

extension NSRegularExpression {
  //Extension for convenience, if regex are entered by user, don't use this extension
  convenience init(_ pattern: String) {
    do {
      try self.init(pattern: pattern)
    } catch {
      preconditionFailure("Illegal regular expression: \(pattern).")
    }
  }
  // Make it easier to apply the regex to string
  func matches(_ string: String) -> Bool {
    let range = NSRange(location: 0, length: string.utf16.count)
    return firstMatch(in: string, options: [], range: range) != nil
  }
}
