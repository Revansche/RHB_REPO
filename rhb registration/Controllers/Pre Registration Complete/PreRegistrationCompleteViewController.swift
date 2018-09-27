//
//  PreRegistrationCompleteViewController.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 18/07/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//

import UIKit

class PreRegistrationCompleteViewController: UIViewController {

  @IBOutlet weak var fillFormOptionSegment: RHBChoiceSegmentView!
  
  override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar(title: "Pre-Registration", optionalButtonItem: nil)
        fillFormOptionSegment.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PreRegistrationCompleteViewController: RHBChoiceSegmentViewDelegate {
  func didTapLeftButton() {
    
  }
  
  func didTapRightButton() {
    let registrationFormVC = RegistrationFormViewController()
    let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    navigationItem.backBarButtonItem = backButton
    self.navigationController?.pushViewController(registrationFormVC, animated: true)
  }
}
