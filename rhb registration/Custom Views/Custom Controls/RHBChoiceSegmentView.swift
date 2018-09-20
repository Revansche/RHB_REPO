//
//  RHBChoiceSegmentView.swift
//  rhb registration
//
//  Created by Ghean Ginanjar on 16/09/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//

import UIKit

protocol RHBChoiceSegmentViewDelegate: class {
  func didTapLeftButton()
  func didTapRightButton()
}

@IBDesignable
class RHBChoiceSegmentView: UIView {

  @IBOutlet weak var leftButton: UIButton!
  @IBOutlet weak var rightButton: UIButton!
  
  // all outlet are briged because the outlet only wired to the instantiated proxyView. there is no file owner
  @IBInspectable public var leftButtonText: String = "" {
    didSet {
      proxyView?.leftButton.setTitle(leftButtonText, for: .normal)
    }
  }
  
  @IBInspectable public var rightButtonText: String = "" {
    didSet {
      proxyView?.rightButton.setTitle(rightButtonText, for: .normal)
    }
  }
  
  @IBInspectable public var leftButtonSelected: Bool = false {
    didSet {
     leftButtonSelected ? setupLeftButtonFilled() : setupRightButtonFilled()
    }
  }
  
  // birdge the delegate to subview because the action is tied to instantiated proxyView
  weak var delegate: RHBChoiceSegmentViewDelegate? {
    didSet {
      self.proxyView?.delegate = delegate
    }
  }
  fileprivate var proxyView: RHBChoiceSegmentView?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  // initialize things before being used
  override func awakeAfter(using aDecoder: NSCoder) -> Any? {
    if self.subviews.count == 0 {
      let view = loadViewFromNib()
      self.proxyView = view
      return self
    }
    return self
  }
  // setups are done in here after everything is initialized
  override func awakeFromNib() {
    super.awakeFromNib()
    if proxyView != nil {
      setupShape()
      addSubview(proxyView!)
    }
  }
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
    setupShape()
  }
  
  fileprivate func setup() {
    proxyView = loadViewFromNib()
    // Add our border here and every custom setup
    setupShape()
    addSubview(proxyView!)
  }
  
  fileprivate func setupShape() {
    proxyView!.layer.cornerRadius = bounds.height / 4
    proxyView!.layer.borderWidth = 1
    proxyView!.layer.borderColor = UIColor.lightGray.cgColor
    proxyView!.clipsToBounds = true
  }
  
  fileprivate func loadNib() -> RHBChoiceSegmentView {
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
    let view = nib.instantiate(withOwner: nil, options: nil)[0] as! RHBChoiceSegmentView
    return view
  }
  
  fileprivate func loadViewFromNib() -> RHBChoiceSegmentView {
    let view = loadNib()
    view.frame = bounds
    view.autoresizingMask = [UIViewAutoresizing.flexibleWidth,
                             UIViewAutoresizing.flexibleHeight]
    
    return view
  }
  
  fileprivate func setupLeftButtonFilled() {
    proxyView?.leftButton.backgroundColor = Colors.rhbMainBlue
    proxyView?.leftButton.setTitleColor(UIColor.white, for: .normal)
    
    proxyView?.rightButton.backgroundColor = UIColor.white
    proxyView?.rightButton.setTitleColor(Colors.rhbMainBlue, for: .normal)
  }
  
  fileprivate func setupRightButtonFilled() {
    proxyView?.leftButton.backgroundColor = UIColor.white
    proxyView?.leftButton.setTitleColor(Colors.rhbMainBlue, for: .normal)
    
    proxyView?.rightButton.backgroundColor = Colors.rhbMainBlue
    proxyView?.rightButton.setTitleColor(UIColor.white, for: .normal)
  }
 
  @IBAction func leftButtonTapped(_ sender: Any) {
    delegate?.didTapLeftButton()
  }
  
  @IBAction func rightButtonTapped(_ sender: Any) {
    delegate?.didTapRightButton()
  }
}
