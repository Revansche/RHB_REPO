//
//  RHBLoginViewController.swift
//  rhb registration
//
//  Created by Ghean Ginanjar on 17/09/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//

import UIKit
import JGProgressHUD

class RHBLoginViewController: UIViewController {
  
  @IBOutlet weak var contentView: UIView!
  @IBOutlet weak var emailTextField: RHBUnderlinedTextField!
  @IBOutlet weak var passwordTextField: RHBUnderlinedTextField!
  @IBOutlet weak var checkboxButton: RHBCheckBoxButton!
  @IBOutlet weak var eyeIcon: UIImageView!
  
  var hud: JGProgressHUD!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    hud = JGProgressHUD(style: .dark)
    registerDelegates()
    addTapGestureToContentView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    setupNavigationBar(title: "Login", optionalButtonItem: nil)
    navigationItem.hidesBackButton = true
  }
  
  @IBAction func loginButtonTapped(_ sender: Any) {
    doLogin()
  }
  
  fileprivate func addTapGestureToContentView() {
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(contentViewTapped))
    contentView.addGestureRecognizer(tapGesture)
  }
  
  fileprivate func registerDelegates() {
    checkboxButton.delegate = self
    emailTextField.delegate = self
    passwordTextField.delegate = self
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
  
  @objc fileprivate func contentViewTapped() {
    view.endEditing(true)
  }
  
  @IBAction func showPasswordTextPressed(_ sender: Any) {
    passwordTextField.isSecureTextEntry = false
  }
  
  @IBAction func showPasswordTextReleased(_ sender: Any) {
    passwordTextField.isSecureTextEntry = true
  }
}

extension RHBLoginViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField.tag == 0 {
      let passField = view.viewWithTag(1) as! UITextField
      passField.becomeFirstResponder()
    } else {
      view.endEditing(true)
    }
    return true
  }
}

extension RHBLoginViewController: RHBCheckBoxButtonDelegate {
  func selectedStateChanged(withValue isSelected: Bool) {
    print("if true, should store user account to the local data")
    print(( isSelected ? "True" : "False" ))
  }
}
