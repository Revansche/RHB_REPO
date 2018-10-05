//
//  SecurityCodeInputView.swift
//  rhb registration
//
//  Created by Ghean on 24/9/18.
//  Copyright © 2018 RHB TradeSmart. All rights reserved.
//

import Foundation
import UIKit

class SecurityCodeInputView: UIView, UIKeyInput {
  var delegate: SecurityCodeInputViewDelegate?
  var nextTag = 1
  var prefixTagLine = 90
  var isSecure = true
  
  // MARK: - UIResponder
  override var canBecomeFirstResponder : Bool {
    return true
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
    drawTiles()
  }
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    drawTiles()
  }
  
  fileprivate func drawTiles() {
    let width = 32.5/320 * self.frame.width
    let widthSpace = 15/320 * self.frame.width
    let height: CGFloat = 50
    
    // Add six digitLabels
    var frame = CGRect(x: 0, y: 0, width: width, height: height)
    frame.origin.x = 25/320 * self.frame.width
    for index in 1...6 {
      drawLabel(withTag: index, viewFrame: frame)
      drawCover(withTag: index, viewFrame: frame)
      drawLine(withTag: index, lineHeight: height, lineWidth: width, viewFrame: frame)
      frame.origin.x += width + widthSpace
    }
  }
  
  fileprivate func drawLabel(withTag tag: Int, viewFrame frame: CGRect) {
    let digitLabel = UILabel(frame: frame)
    digitLabel.font = UIFont(name: "HelveticaNeue", size: 24)
    digitLabel.tag = tag
    digitLabel.text = ""
    digitLabel.textAlignment = .center
    digitLabel.isHidden = true
    self.addSubview(digitLabel)
  }
  
  fileprivate func drawCover(withTag tag: Int, viewFrame frame: CGRect) {
    let coverLabel = UILabel(frame: frame)
    coverLabel.tag = tag+10
    coverLabel.font = UIFont(name: "HelveticaNeue", size: 24)
    coverLabel.text = "•"
    coverLabel.textAlignment = .center
    coverLabel.isHidden = true
    self.addSubview(coverLabel)
  }
  
  fileprivate func drawLine(withTag tag: Int, lineHeight height: CGFloat, lineWidth width: CGFloat, viewFrame frame: CGRect) {
    let underline: UIView = UIView(frame: CGRect(x: frame.origin.x, y:(height-1) , width: width, height: 1))
    underline.tag = prefixTagLine + tag
    underline.backgroundColor = UIColor.darkGray
    self.addSubview(underline)
  }
  
  fileprivate func setup() {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SecurityCodeInputView.showKeyboard))
    self.addGestureRecognizer(tap)
  }
  
  @objc func showKeyboard() {
    self.becomeFirstResponder()
  }
  
  var hasText : Bool {
    return nextTag > 1 ? true : false
  }
  
  func insertText(_ text: String) {
    delegate?.codeInputViewDidBeginEditing()
    if nextTag < 7 {
      (self.viewWithTag(nextTag) as! UILabel).text = text
      (self.viewWithTag(nextTag + 10) as! UILabel).isHidden = false
      if !isSecure {
        (self.viewWithTag(nextTag + 10) as! UILabel).text = text
      }
      nextTag += 1
      
      if nextTag == 7 {
        var code = (self.viewWithTag(1) as! UILabel).text!
        for index in 2..<nextTag {
          code += (self.viewWithTag(index) as! UILabel).text!
        }
        delegate?.codeInputView(self, didFinishWithCode: code)
      }else{
        (self.viewWithTag(prefixTagLine + nextTag))!.backgroundColor = UIColor.gray
      }
    }
  }
  
  func deleteBackward() {
    if nextTag > 1 {
      if nextTag < 7 {
        (self.viewWithTag(prefixTagLine + nextTag))!.backgroundColor = UIColor.darkGray
      }
      nextTag -= 1
      (self.viewWithTag(nextTag) as! UILabel).text = ""
      (self.viewWithTag(nextTag + 10) as! UILabel).isHidden = true
      if !isSecure {
        (self.viewWithTag(nextTag + 10) as! UILabel).text = ""
        var code = (self.viewWithTag(1) as! UILabel).text!
        if code.count > 0 {
          for index in 2..<nextTag {
            code += (self.viewWithTag(index) as! UILabel).text!
          }
        }
        delegate?.codeInputViewEditing?(code)
      }
      if (nextTag == 1) {
        (self.viewWithTag(prefixTagLine + nextTag))!.backgroundColor = UIColor.gray
      }
    }
  }
  
  func clear() {
    while nextTag > 1 {
      deleteBackward()
    }
  }
  
  // MARK: - UITextInputTraits
  var keyboardType: UIKeyboardType { get { return .numberPad } set { } }
}

@objc protocol SecurityCodeInputViewDelegate {
  func codeInputView(_ codeInputView: SecurityCodeInputView, didFinishWithCode code: String)
  func codeInputViewDidBeginEditing()
  @objc optional func codeInputViewEditing(_ code:String)
}
