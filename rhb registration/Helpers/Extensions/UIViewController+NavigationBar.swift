//
//  UIViewController+NavigationBar.swift
//  rhb registration
//
//  Created by Ghean Ginanjar on 15/09/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
  func hideNavigationBar() {
    self.navigationController?.navigationBar.isHidden = true
  }
  
  func setupNavigationBar(title: String, backButtonItem: UIBarButtonItem?, optionalButtonItem: UIBarButtonItem?) {
    navigationController?.navigationBar.isHidden = false
    navigationItem.title = title
    navigationItem.leftBarButtonItem = backButtonItem
    if backButtonItem == nil {
      navigationItem.hidesBackButton = true
    }
    navigationItem.rightBarButtonItem = optionalButtonItem
  }
}
