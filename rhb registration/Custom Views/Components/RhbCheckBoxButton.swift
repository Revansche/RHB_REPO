//
//  RhbCheckBoxButton.swift
//  rhb registration
//
//  Created by Ghean Ginanjar on 17/09/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//

import UIKit

protocol RhbCheckBoxButtonDelegate: class {
  func selectedStateChanged(withValue isSelected: Bool)
}

@IBDesignable
class RhbCheckBoxButton: UIButton {
  
  weak var delegate: RhbCheckBoxButtonDelegate?
  
  fileprivate var isCheckboxSelected: Bool = false {
    didSet {
      setup()
    }
  }
  
  fileprivate var shownImage: UIImage? {
    let imageName = isCheckboxSelected ? "b1-2-LoginPage-ic-box-selected" : "b1-1-LoginPage-ic-box"
    // Need to specify bundle to render image on designable
    let bundle = Bundle(for: type(of: self))
    return UIImage(named: imageName, in: bundle, compatibleWith: nil)
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    addTouchHandler()
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    addTouchHandler()
    setup()
  }
  
  func setState(isSelected value: Bool) {
    isCheckboxSelected = value
  }
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setup()
  }
  
  private func setup() {
    setTitle("", for: .normal)
    setImage(shownImage, for: .normal)
  }
  
  fileprivate func addTouchHandler() {
    addTarget(self, action: #selector(handleCheckboxSelection), for: .touchUpInside)
  }
  
  @objc fileprivate func handleCheckboxSelection() {
    isCheckboxSelected = !isCheckboxSelected
    delegate?.selectedStateChanged(withValue: isCheckboxSelected)
  }
}
