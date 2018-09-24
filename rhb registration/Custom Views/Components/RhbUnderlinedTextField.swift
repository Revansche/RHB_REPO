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
  
  //MARK: Placeholder vars
  fileprivate let customPlaceholderLabel = UILabel()
  fileprivate let customPlaceholderFontScale: CGFloat = 0.85
  fileprivate var activePlaceholderPoint: CGPoint = CGPoint.zero
  fileprivate var textFieldInsets = CGPoint(x: 0, y: 10)
  
  // Sets the underline color
  @IBInspectable public var underLineColor: UIColor = .groupTableViewBackground {
    didSet {
      updateUnderLineUI()
    }
  }
  
  fileprivate var placeholderInset = CGPoint(x: 0, y: 4) {
    didSet {
      layoutSubviews()
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
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setup()
  }
    
  override func layoutSubviews() {
    super.layoutSubviews()
    setup()
  }
  
  override func draw(_ rect: CGRect) {
    drawViewsForRect(rect)
  }
  
  fileprivate func drawViewsForRect(_ rect: CGRect) {
    let frame = CGRect(origin: CGPoint.zero, size: CGSize(width: rect.size.width, height: rect.size.height))
    
    customPlaceholderLabel.frame = frame.insetBy(dx: placeholderInset.x, dy: placeholderInset.y)
    customPlaceholderLabel.font = placeholderFontFromFont(font!)
    
    updatePlaceholder()
    addSubview(customPlaceholderLabel)
  }
  
  private func setup() {
    applyUnderLine()
    if let placeholder = placeholder {
      let attributedPlaceholder = NSMutableAttributedString(string: placeholder)
      attributedPlaceholder.addAttribute(.foregroundColor, value: UIColor.clear, range: NSMakeRange(0, attributedPlaceholder.length))
      self.attributedPlaceholder = attributedPlaceholder
    }
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
  
  // MARK: - UITextField Observing
  
  override func willMove(toSuperview newSuperview: UIView!) {
    if newSuperview != nil {
      NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidEndEditing), name:NSNotification.Name.UITextFieldTextDidEndEditing, object: self)
      
      NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidBeginEditing), name:NSNotification.Name.UITextFieldTextDidBeginEditing, object: self)
      
    } else {
      NotificationCenter.default.removeObserver(self)
    }
  }
  
  /**
   The textfield has started an editing session.
   */
  @objc func textFieldDidBeginEditing() {
    if self.keyboardType != .numberPad && self.keyboardType != .emailAddress{
      self.keyboardType = .asciiCapable
    }
    animateViewsForTextEntry()
  }
  
  /**
   The textfield has ended an editing session.
   */
  @objc func textFieldDidEndEditing() {
    animateViewsForTextDisplay()
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.offsetBy(dx: textFieldInsets.x, dy: textFieldInsets.y)
  }
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.offsetBy(dx: textFieldInsets.x, dy: textFieldInsets.y)
  }
}

//MARK: Handling placeholder
extension RhbUnderlinedTextField {
  
  fileprivate func updatePlaceholder() {
    customPlaceholderLabel.text = placeholder
    customPlaceholderLabel.textColor = UIColor.lightGray
    customPlaceholderLabel.sizeToFit()
    layoutPlaceholderInTextRect()
    
    if isFirstResponder || !text!.isEmpty {
      animateViewsForTextEntry()
    }
  }
  
  fileprivate func placeholderFontFromFont(_ font: UIFont) -> UIFont! {
    let smallerFont = UIFont(name: font.fontName, size: font.pointSize * customPlaceholderFontScale)
    return smallerFont
  }
  
  fileprivate func layoutPlaceholderInTextRect() {
    let textRect = self.textRect(forBounds: bounds)
    var originX = placeholderInset.x
    switch self.textAlignment {
    case .center:
      originX += textRect.size.width/2 - customPlaceholderLabel.bounds.width/2
    case .right:
      originX += textRect.size.width - customPlaceholderLabel.bounds.width
    default:
      break
    }
    customPlaceholderLabel.frame = CGRect(x: originX, y: (textRect.height/2)-placeholderInset.y,
                                          width: customPlaceholderLabel.bounds.width, height: customPlaceholderLabel.bounds.height)
    activePlaceholderPoint = CGPoint(x: customPlaceholderLabel.frame.origin.x, y: customPlaceholderLabel.frame.origin.y - customPlaceholderLabel.frame.size.height - placeholderInset.y)
    
  }
  
  fileprivate func animateViewsForTextEntry() {
    if text!.isEmpty {
      UIView.animate(withDuration: 0.3, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1.0, options: .beginFromCurrentState, animations: ({ [unowned self] in
        self.customPlaceholderLabel.frame.origin = CGPoint(x: 10, y: self.customPlaceholderLabel.frame.origin.y)
        self.customPlaceholderLabel.alpha = 0
      }), completion:{ [unowned self] (_) in
        self.updatePlaceholderPositionToActiveState()
      })
    } else {
      updatePlaceholderPositionToActiveState()
    }
  }
  
  fileprivate func animateViewsForTextDisplay() {
    if text!.isEmpty {
      UIView.animate(withDuration: 0.35, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 2.0, options: UIViewAnimationOptions.beginFromCurrentState, animations: ({ [unowned self] in
        self.layoutPlaceholderInTextRect()
        self.customPlaceholderLabel.alpha = 1.0
      }), completion: nil)
    }
  }
  
  fileprivate func updatePlaceholderPositionToActiveState() {
    layoutPlaceholderInTextRect()
    customPlaceholderLabel.frame.origin = activePlaceholderPoint
    
    UIView.animate(withDuration: 0.2, animations: {
      self.customPlaceholderLabel.alpha = 1
    })
  }
}
