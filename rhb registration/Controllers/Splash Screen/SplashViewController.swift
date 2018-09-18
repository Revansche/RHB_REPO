//
//  SplashViewController.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 19/06/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.perform(#selector(performOpenPage), with: nil, afterDelay: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func performOpenPage(){
        let initialViewController: RegisterNavigationViewController = RegisterNavigationViewController()
        UIApplication.shared.delegate!.window!!.rootViewController = initialViewController
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
