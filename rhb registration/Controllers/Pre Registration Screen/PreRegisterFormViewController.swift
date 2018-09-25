//
//  PreRegisterFormViewController.swift
//  rhb registration
//
//  Created by Ghean Ginanjar on 23/09/18.
//  Copyright © 2018 RHB TradeSmart. All rights reserved.
//

import UIKit

class PreRegisterFormViewController: UIViewController {

  @IBOutlet weak var proceedButtonBottomConstraint: NSLayoutConstraint!
  override func viewDidLoad() {
        super.viewDidLoad()
    setupNavigationBar(title: "Pre-Registration", optionalButtonItem: nil)
        // Do any additional setup after loading the view.
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  @IBAction func proceedButtonTapped(_ sender: Any) {
    let preRegOTPView = RHBPreRegisterOTPViewController()
    let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    navigationItem.backBarButtonItem = backButton
    self.navigationController?.pushViewController(preRegOTPView, animated: true)
  }
}
