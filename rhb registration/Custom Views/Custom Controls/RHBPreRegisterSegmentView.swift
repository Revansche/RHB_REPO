//
//  RHBPreRegisterSegmentView.swift
//  rhb registration
//
//  Created by Ghean Ginanjar on 16/09/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//

import UIKit

protocol RHBPreRegisterSegmentViewDelegate: class {
  func didTapLeftButton()
  func didTapRightButton()
}

@IBDesignable
class RHBPreRegisterSegmentView: UIView {

  
  @IBOutlet var view: UIView!
  @IBOutlet weak var leftButton: UIButton!
  @IBOutlet weak var rightButton: UIButton!
  
  weak var delegate: RHBPreRegisterSegmentViewDelegate?
  
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
  
  fileprivate func setup() {
    view = loadViewFromNib()
    // Add our border here and every custom setup
    layer.cornerRadius = bounds.height / 4
    layer.borderWidth = 1
    layer.borderColor = UIColor.lightGray.cgColor
    clipsToBounds = true
    
    addSubview(view)
  }
  
  fileprivate func loadViewFromNib() -> UIView {
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
    let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
    view.frame = bounds
    view.autoresizingMask = [UIViewAutoresizing.flexibleWidth,
                             UIViewAutoresizing.flexibleHeight]
    
    return view
  }
 
  @IBAction func leftButtonTapped(_ sender: Any) {
    delegate?.didTapLeftButton()
  }
  
  @IBAction func rightButtonTapped(_ sender: Any) {
    delegate?.didTapRightButton()
  }
}
