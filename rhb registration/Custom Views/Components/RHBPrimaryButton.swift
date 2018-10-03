//
//  RHBPrimaryButton.swift
//  rhb registration
//
//  Created by Ghean Ginanjar on 02/10/18.
//  Copyright © 2018 RHB TradeSmart. All rights reserved.
//

import UIKit

class RHBPrimaryButton: UIButton {
  
  override var isEnabled: Bool {
    willSet(_isEnabled) {
      if _isEnabled {
        self.backgroundColor = Colors.rhbMainBlue
      } else {
        self.backgroundColor = Colors.rhbMainBluePale
      }
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
  }

  override func draw(_ rect: CGRect) {
    super.draw(rect)
  }
}
