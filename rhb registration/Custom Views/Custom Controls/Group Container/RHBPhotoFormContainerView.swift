//
//  RHBPhotoFormContainerView.swift
//  rhb registration
//
//  Created by Ghean Ginanjar on 29/09/18.
//  Copyright © 2018 RHB TradeSmart. All rights reserved.
//

import UIKit

@IBDesignable
class RHBPhotoFormContainerView: UIView {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var buttonLabel: UILabel!
  @IBOutlet weak var cameraIconAsButton: UIImageView!
  
  fileprivate var containerView: RHBPhotoFormContainerView?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func prepareForInterfaceBuilder() {
    super.prepareForInterfaceBuilder()
  }
  
  @IBAction func localeButtonTapped(_ sender: Any) {
    
  }
  
  @IBAction func foreignButtonTapped(_ sender: Any) {
    
  }
  
  fileprivate func setup() {
    containerView = loadViewFromNib()
    // Add our border here and every custom setup
    addSubview(containerView!)
  }
  
  fileprivate func loadViewFromNib() -> RHBPhotoFormContainerView {
    let view = loadNib()
    view.frame = bounds
    view.autoresizingMask = [UIViewAutoresizing.flexibleWidth,
                             UIViewAutoresizing.flexibleHeight]
    return view
  }
  
  fileprivate func loadNib() -> RHBPhotoFormContainerView {
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
    let view = nib.instantiate(withOwner: nil, options: nil)[0] as! RHBPhotoFormContainerView
    return view
  }

}
