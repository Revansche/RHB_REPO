//
//  RhbUnderlinedTextField.swift
//  rhb registration
//
//  Created by Ghean Ginanjar on 16/09/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//

import UIKit

@IBDesignable
class RhbUnderlinedTextField: UITextField {
  
  // Sets the underline color
  @IBInspectable public var underLineColor: UIColor = .groupTableViewBackground {
    didSet {
      updateUnderLineUI()
    }
  }
  
  // Applies underline to the text view with the specified width
  @IBInspectable public var underLineWidth: CGFloat = 0.0 {
    didSet {
      updateUnderLineFrame()
    }
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    setup()
  }
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setup()
  }
    
  override func layoutSubviews() {
    super.layoutSubviews()
    setup()
  }
  
  private func setup() {
    applyUnderLine()
  }
  
  // MARK: - Underline
  private var underLineLayer = CALayer()
  private func applyUnderLine() {
    // Apply underline only if the text view's has no borders
    if borderStyle == UITextBorderStyle.none {
      underLineLayer.removeFromSuperlayer()
      updateUnderLineFrame()
      updateUnderLineUI()
      layer.addSublayer(underLineLayer)
      layer.masksToBounds = true
    }
  }
  
  private func updateUnderLineFrame() {
    var rect = bounds
    rect.origin.y = bounds.height - underLineWidth
    rect.size.height = underLineWidth
    underLineLayer.frame = rect
  }
  
  private func updateUnderLineUI() {
    underLineLayer.backgroundColor = underLineColor.cgColor
  }
}
