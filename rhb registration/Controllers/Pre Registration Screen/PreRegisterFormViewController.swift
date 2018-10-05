//
//  PreRegisterFormViewController.swift
//  rhb registration
//
//  Created by Ghean Ginanjar on 23/09/18.
//  Copyright © 2018 RHB TradeSmart. All rights reserved.
//

import UIKit
import JGProgressHUD

class PreRegisterFormViewController: UIViewController {

  @IBOutlet weak var emailField: RHBUnderlinedTextField!
  @IBOutlet weak var fullNameField: RHBUnderlinedTextField!
  @IBOutlet weak var mobileNumberField: RHBUnderlinedTextField!
  @IBOutlet weak var kenalDariField: RHBUnderlinedTextField!
  
  @IBOutlet weak var proceedButton: RHBPrimaryButton!
  @IBOutlet weak var emailValidationWarningView: UIView!
  @IBOutlet weak var phoneValidationWarningView: UIView!
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var tncCheckBox: RHBCheckBoxButton!
  
  @IBOutlet weak var proceedButtonBottomConstraint: NSLayoutConstraint!
  
  fileprivate let scrollOffsetMargin: CGFloat = 40
  fileprivate var hud: JGProgressHUD!
  fileprivate var kenalDariDataProvider: SourceDataProvider?
  fileprivate var selectedDataId: String = ""
  fileprivate var checkBoxState: Bool = false
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationBar(title: "Pre-Registration", optionalButtonItem: nil)
    // Do any additional setup after loading the view.
    hud = JGProgressHUD(style: .dark)
    setupListeners()
    setupFirstTimeViewState()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }

  @IBAction func proceedButtonTapped(_ sender: Any) {
    checkMobileNumber()
  }
  
  fileprivate func setupFirstTimeViewState() {
    proceedButton.isEnabled = false
    kenalDariDataProvider = SourceDataProvider(withType: .kenal, andInterface: self)
    kenalDariDataProvider?.getMasterData()
  }
  
  fileprivate func setupListeners() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
    
    emailField.delegate = self
    fullNameField.delegate = self
    mobileNumberField.delegate = self
    kenalDariField.delegate = self
    tncCheckBox.delegate = self
    
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
  
  @objc fileprivate func showSelection() {
    guard let dataProvider = kenalDariDataProvider else {
      return
    }
    let selectionVC = PopUpSelectionViewController(header: "Kenal Dari", sourceDataProvider: dataProvider, delegate: self)
    selectionVC.modalPresentationStyle = .overCurrentContext
    
    self.present(selectionVC, animated: true, completion: nil)
  }
  
  fileprivate func redirectToOTPView() {
      let preRegOTPView = RHBPreRegisterOTPViewController()
      let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
      navigationItem.backBarButtonItem = backButton
      preRegOTPView.resendPhoneNumber = mobileNumberField.text!
      self.navigationController?.pushViewController(preRegOTPView, animated: true)
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
  
  func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
    if textField === kenalDariField {
      view.endEditing(true)
      showSelection()
      return false
    }
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
    guard let _ = kenalDariField.text, checkBoxState else {
      proceedButton.isEnabled = false
      return
    }
    // Now we sure everything is right, we can proceed
    proceedButton.isEnabled = true
  }
}

extension PreRegisterFormViewController: SourceDataInterface, SelectionViewControllerDelegate, RHBCheckBoxButtonDelegate {
  func selectedStateChanged(withValue isSelected: Bool) {
    print(( isSelected ? "True" : "False" ))
    checkBoxState = isSelected
    evaluateForm()
  }
  
  func SelectionView(_ selectionViewController: PopUpSelectionViewController, returnPickerModel pickerModel: PickerModel) {
    kenalDariField.text = pickerModel.title
    selectedDataId = pickerModel.id
    evaluateForm()
  }
  
  func refreshView() {
    //Will see the use of this
  }
  
  func presentAlert(withMessage message: String) {
    hideLoader()
    let alert = UIAlertController(title: "Server Error", message: message, preferredStyle: UIAlertControllerStyle.alert)
    
    alert.addAction(
      UIAlertAction(title: "Ok", style: .default, handler: { (action) in
        self.dismiss(animated: true, completion: nil)
      })
    )
    self.present(alert, animated: true, completion: nil)
  }
  
  func showLoader(withText text: String) {
    hud.textLabel.text = text
    hud.show(in: self.view)
  }
  
  func hideLoader() {
    hud.dismiss(afterDelay: 1.0)
  }
}

//MARK: API Handling
extension PreRegisterFormViewController {
  func checkMobileNumber() {
    guard let phoneNumber = mobileNumberField.text else {
      return
    }
    showLoader(withText: "Checking Phone Number")
    APIService.postPhoneNumberData(phoneNumber: phoneNumber) {[weak self] (dict, err) in
      guard let `self` = self else {
        return
      }
      if err == nil {
        let status: String = dict!["status"] as! String
        if status == "success" {
          self.hud.textLabel.text = "Checking Email Address"
          self.checkEmailAddress()
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
  
  func checkEmailAddress() {
    guard let emailAddress = emailField.text else {
      return
    }
    APIService.postEmailData(email: emailAddress) {[weak self] (dict, err) in
      guard let `self` = self else {
        return
      }
      if err == nil {
        let status: String = dict!["status"] as! String
        if status == "success" {
          self.hud.textLabel.text = "Sending OTP..."
          //Should trigger OTP API
          self.requestOTP()
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
  
  func requestOTP() {
    guard let phoneNumber = mobileNumberField.text else {
      return
    }
    APIService.requestOTP(withPhoneNumber: phoneNumber) {[weak self] (dict, err) in
      guard let `self` = self else {
        return
      }
      if err == nil {
        let status: String = dict!["status"] as! String
        if status == "success" {
          self.hud.dismiss()
          self.redirectToOTPView()
          //Should trigger OTP API
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
}
