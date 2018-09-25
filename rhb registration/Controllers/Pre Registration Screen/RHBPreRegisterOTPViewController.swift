//
//  RHBPreRegisterOTPViewController.swift
//  rhb registration
//
//  Created by Ghean on 24/9/18.
//  Copyright © 2018 RHB TradeSmart. All rights reserved.
//

import UIKit

class RHBPreRegisterOTPViewController: UIViewController {
  
  @IBOutlet weak var securityCodeInputView: SecurityCodeInputView!
  
  @IBOutlet weak var didntReceiveLabel: UILabel!
  @IBOutlet weak var countdownView: UIView!
  @IBOutlet weak var countdownLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationBar(title: "Phone Verification", optionalButtonItem: nil)
    // Do any additional setup after loading the view.
  }
  
  @IBAction func sendAnotherButtonDidTapped(_ sender: Any) {
    
  }
  
  @IBAction func verifyButtonTapped(_ sender: Any) {
    
    let preRegCompleteView = PreRegistrationCompleteViewController()
    let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    navigationItem.backBarButtonItem = backButton
    self.navigationController?.pushViewController(preRegCompleteView, animated: true)
  }
}
