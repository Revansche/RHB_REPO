//
//  RHBCitizenshipContainerView.swift
//  rhb registration
//
//  Created by Ghean Ginanjar on 29/09/18.
//  Copyright © 2018 RHB TradeSmart. All rights reserved.
//

import UIKit

@IBDesignable
class RHBCitizenshipContainerView: UIView {
  
  @IBOutlet weak var localeButton: UIButton!
  @IBOutlet weak var foreignButton: UIButton!
  @IBOutlet weak var countryLabel: UILabel!
  
  fileprivate var containerView: RHBCitizenshipContainerView?
  
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
  
  fileprivate func loadViewFromNib() -> RHBCitizenshipContainerView {
    let view = loadNib()
    view.frame = bounds
    view.autoresizingMask = [UIViewAutoresizing.flexibleWidth,
                             UIViewAutoresizing.flexibleHeight]
    return view
  }
  
  fileprivate func loadNib() -> RHBCitizenshipContainerView {
    let bundle = Bundle(for: type(of: self))
    let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
    let view = nib.instantiate(withOwner: nil, options: nil)[0] as! RHBCitizenshipContainerView
    return view
  }

}
