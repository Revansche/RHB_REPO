//
//  SourceDataInterface.swift
//  rhb registration
//
//  Created by Ghean Ginanjar on 04/10/18.
//  Copyright © 2018 RHB TradeSmart. All rights reserved.
//

import Foundation

protocol SourceDataInterface {
  func showLoader(withText string: String)
  func refreshView()
  func hideLoader()
  func presentAlert(withMessage message: String)
}
