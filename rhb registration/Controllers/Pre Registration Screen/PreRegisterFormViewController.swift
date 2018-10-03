//
//  PreRegisterFormViewController.swift
//  rhb registration
//
//  Created by Ghean Ginanjar on 23/09/18.
//  Copyright © 2018 RHB TradeSmart. All rights reserved.
//

import UIKit

class PreRegisterFormViewController: UIViewController {

  @IBOutlet weak var emailField: RHBUnderlinedTextField!
  @IBOutlet weak var fullNameField: RHBUnderlinedTextField!
  @IBOutlet weak var mobileNumberField: RHBUnderlinedTextField!
  
  @IBOutlet weak var proceedButton: RHBPrimaryButton!
  @IBOutlet weak var emailValidationWarningView: UIView!
  @IBOutlet weak var phoneValidationWarningView: UIView!
  @IBOutlet weak var scrollView: UIScrollView!
  
  @IBOutlet weak var proceedButtonBottomConstraint: NSLayoutConstraint!
  
  fileprivate let scrollOffsetMargin: CGFloat = 40
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationBar(title: "Pre-Registration", optionalButtonItem: nil)
    // Do any additional setup after loading the view.
    setupFirstTimeViewState()
    setupListeners()
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
  
  fileprivate func setupFirstTimeViewState() {
    proceedButton.isEnabled = false
  }
  
  fileprivate func setupListeners() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
    
    emailField.delegate = self
    fullNameField.delegate = self
    mobileNumberField.delegate = self
    
    scrollView.delegate = self
  }
  
  // MARK: Keyboard Notification
  @objc fileprivate func keyboardWillShow(_ notification: Foundation.Notification) {
    let info = notification.userInfo!
    let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
    let keyboardSize = keyboardFrame.size
    self.scrollView.isScrollEnabled = true
    let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize.height, 0.0)
    proceedButtonBottomConstraint.constant = keyboardFrame.size.height
    self.scrollView.contentInset = contentInsets
  }
  
  @objc fileprivate func keyboardWillHide(_ notification: Foundation.Notification) {
    proceedButtonBottomConstraint.constant = 0
//    //Once keyboard disappears, restore original positions
    var info = notification.userInfo!
    let keyboardSize = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue.size
    let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, -keyboardSize.height, 0.0)
    self.scrollView.contentInset = contentInsets
  }
  
  
}

extension PreRegisterFormViewController: UIScrollViewDelegate {
  func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
    view.endEditing(true)
  }
}

extension PreRegisterFormViewController: UITextFieldDelegate {
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    if string.isEmpty {
      return true
    }
    if textField === fullNameField {
      let regex = "[A-Za-z ]{1,}"
      return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: string)
    }
    //Should prepare the editing to listen to validation
    return true
  }
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    scrollView.contentOffset = CGPoint(x: 0, y: textField.frame.origin.y + scrollOffsetMargin)
    if textField === mobileNumberField {
      phoneFieldBeginEditing()
    } else if textField === emailField {
      emailFieldBeginEditing()
    }
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    if textField === mobileNumberField {
      phoneFieldEndEditing()
    } else if textField === emailField {
      emailFieldEndEditing()
    }
  }
  
  fileprivate func phoneFieldBeginEditing() {
    phoneValidationWarningView.isHidden = true
  }
  
  fileprivate func emailFieldBeginEditing() {
    emailValidationWarningView.isHidden = true
  }
  
  fileprivate func phoneFieldEndEditing() {
    guard let numberInText = mobileNumberField.text, RHBFormValidator.phoneNumberValidation(input: numberInText) else {
      print("This means the phone regex failed, do something about it")
      emailValidationWarningView.isHidden = false
      return
    }
    evaluateForm()
  }
  
  fileprivate func emailFieldEndEditing() {
    guard let mailInText = emailField.text, RHBFormValidator.emailValidation(input: mailInText) else {
      print("This means the email regex failed, do something about it")
      emailValidationWarningView.isHidden = false
      return
    }
    evaluateForm()
  }
  
  fileprivate func evaluateForm() {
    //Make sure every mandatory field have value
    guard let mailInText = emailField.text, let numberInText = mobileNumberField.text, let fullNameInText = fullNameField.text, !fullNameInText.isEmpty else {
      proceedButton.isEnabled = false
      return
    }
    //Make sure every field is in valid format
    guard RHBFormValidator.phoneNumberValidation(input: numberInText), RHBFormValidator.emailValidation(input: mailInText) else {
      proceedButton.isEnabled = false
      return
    }
    // Now we sure everything is right, we can proceed
    proceedButton.isEnabled = true
  }
}
