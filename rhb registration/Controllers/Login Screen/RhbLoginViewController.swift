//
//  RhbLoginViewController.swift
//  rhb registration
//
//  Created by Ghean Ginanjar on 17/09/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//

import UIKit
import JGProgressHUD

class RhbLoginViewController: UIViewController {
  
  @IBOutlet weak var contentView: UIView!
  @IBOutlet weak var emailTextField: RhbUnderlinedTextField!
  @IBOutlet weak var passwordTextField: RhbUnderlinedTextField!
  @IBOutlet weak var checkboxButton: RhbCheckBoxButton!
  
  var hud: JGProgressHUD!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    hud = JGProgressHUD(style: .dark)
    checkboxButton.delegate = self
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func loginButtonTapped(_ sender: Any) {
    doLogin()
  }
  
  fileprivate func doLogin() {
    let userName = emailTextField.text!
    let password = passwordTextField.text!
    
    hud.textLabel.text = "Loading"
    hud.show(in: self.view)
    
    APIService.postLoginData(userName: userName, password: password) { (dict, err) in
      if err == nil {
        print(dict ?? "empty")
        self.hud.dismiss()
        let status: String = dict!["status"] as! String
        if status == "success" {
          if let msg = dict!["token"] {
            self.alertMessage(message: msg as! String)
          }
        }else{
          if let msg = dict!["message"] {
            self.alertMessage(message: msg as! String)
          }
        }
      } else {
        print(err.debugDescription)
        self.alertMessage(message: err.debugDescription)
        self.hud.dismiss(afterDelay: 1.0)
      }
    }
  }
  
  fileprivate func alertMessage(message: String) {
    let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
      switch action.style{
      case .default:
        print("default")
        
      case .cancel:
        print("cancel")
        
      case .destructive:
        print("destructive")
      }
    }))
    self.present(alert, animated: true, completion: nil)
  }
  
  @IBAction func showPasswordTextPressed(_ sender: Any) {
    passwordTextField.isSecureTextEntry = false
  }
  
  @IBAction func showPasswordTextReleased(_ sender: Any) {
    passwordTextField.isSecureTextEntry = true
  }
}

extension RhbLoginViewController: RhbCheckBoxButtonDelegate {
  func selectedStateChanged(withValue isSelected: Bool) {
    print("if true, should store user account to the local data")
    print(( isSelected ? "True" : "False" ))
  }
}
