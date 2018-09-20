//
//  PreRegistrationViewController.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 19/06/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//

import UIKit

class PreRegistrationViewController: UIViewController {
    @IBOutlet weak var fillDataSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        title = "Pre-Registration"
        fillDataSegment.selectedSegmentIndex = -1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segmentDidChange(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
            
        } else if(sender.selectedSegmentIndex == 1) {
            Constants.removeFormData()
            let regVC = RegistrationFormViewController()
            self.navigationController?.pushViewController(regVC, animated: true)
        }
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
