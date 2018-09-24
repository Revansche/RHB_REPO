//
//  PreRegisterFormViewController.swift
//  rhb registration
//
//  Created by Ghean Ginanjar on 23/09/18.
//  Copyright © 2018 RHB TradeSmart. All rights reserved.
//

import UIKit

class PreRegisterFormViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupNavigationBar(title: "Pre-Registration", backButtonItem: nil, optionalButtonItem: nil)
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
