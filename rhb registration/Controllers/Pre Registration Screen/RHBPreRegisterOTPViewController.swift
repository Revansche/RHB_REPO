//
//  RHBPreRegisterOTPViewController.swift
//  rhb registration
//
//  Created by Ghean on 24/9/18.
//  Copyright © 2018 RHB TradeSmart. All rights reserved.
//

import UIKit
import JGProgressHUD

class RHBPreRegisterOTPViewController: UIViewController {
  
  @IBOutlet weak var securityCodeInputView: SecurityCodeInputView!
  
  @IBOutlet weak var didntReceiveLabel: UILabel!
  @IBOutlet weak var countdownView: UIView!
  @IBOutlet weak var countdownLabel: UILabel!
  @IBOutlet weak var verifyButton: RHBPrimaryButton!
  
  fileprivate var timerCounter: Int = 30
  fileprivate var timer: Timer!
  fileprivate var inputedSecurityCode: String = ""
  @IBOutlet weak var verifyButtonBottomConstraint: NSLayoutConstraint!
  
  var resendPhoneNumber: String = ""
  fileprivate var hud: JGProgressHUD!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupNavigationBar(title: "Phone Verification", optionalButtonItem: nil)
    // Do any additional setup after loading the view.
    setupFirstTimeLayout()
    setupListener()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    securityCodeInputView.becomeFirstResponder()
  }
  
  @IBAction func sendAnotherButtonDidTapped(_ sender: Any) {
    requestOTP()
    (self.view.viewWithTag(17) as! SecurityCodeInputView).clear()
    verifyButton.isEnabled = false
  }
  
  @IBAction func verifyButtonTapped(_ sender: Any) {
    verifyOTP()
  }
  
  @objc func updateTimerLabel() {
    if(timerCounter > 1) {
      timerCounter -= 1
      countdownLabel.text = "\(timerCounter)"
    }
    else {
      countdownView.isHidden = true
      timer.invalidate()
      timer = nil
    }
  }
  
  fileprivate func setupFirstTimeLayout() {
    hud = JGProgressHUD(style: .dark)
    verifyButton.isEnabled = false
    securityCodeInputView.delegate = self
    securityCodeInputView.tag = 17
    resetTimer()
  }
  
  fileprivate func setupListener() {
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name:NSNotification.Name.UIKeyboardWillShow, object: nil);
    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name:NSNotification.Name.UIKeyboardWillHide, object: nil);
  }
  
 fileprivate func resetTimer() {
    if let currentTimer = self.timer {
      if currentTimer.isValid {
        timer.invalidate()
        timer = nil
      }
    }
    timerCounter = 30
    countdownLabel.text = "\(timerCounter)"
    self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimerLabel), userInfo: nil, repeats: true)
    countdownView.isHidden = false
  }
  
  fileprivate func redirectToPreRegisterCompletion() {
    let preRegCompleteView = PreRegistrationCompleteViewController()
    let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    navigationItem.backBarButtonItem = backButton
    self.navigationController?.pushViewController(preRegCompleteView, animated: true)
  }
  
  // MARK: Keyboard Notification
  @objc fileprivate func keyboardWillShow(_ notification: Foundation.Notification) {
    let info = notification.userInfo!
    let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
    let keyboardSize = keyboardFrame.size
    verifyButtonBottomConstraint.constant = keyboardSize.height
  }
  
  @objc fileprivate func keyboardWillHide(_ notification: Foundation.Notification) {
    //    //Once keyboard disappears, restore original positions
    verifyButtonBottomConstraint.constant = 0
  }
}

extension RHBPreRegisterOTPViewController {
  func showLoader(withText text: String) {
    hud.textLabel.text = text
    hud.show(in: self.view)
  }
  func requestOTP() {
    guard !resendPhoneNumber.isEmpty else {
      print("we haven't send the phone number to this view")
      return
    }
    showLoader(withText: "Requesting New OTP")
    APIService.requestOTP(withPhoneNumber: resendPhoneNumber) {[weak self] (dict, err) in
      guard let `self` = self else {
        return
      }
      if err == nil {
        let status: String = dict!["status"] as! String
        if status == "success" {
          self.hud.dismiss()
          //Should show the countdown
          self.resetTimer()
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
  
  func verifyOTP() {
    guard !resendPhoneNumber.isEmpty, !inputedSecurityCode.isEmpty else {
      return
    }
    showLoader(withText: "Verifiying ...")
    APIService.verifyOTP(withPhoneNumber: resendPhoneNumber, securityCode: inputedSecurityCode) {[weak self] (dict, err) in
      guard let `self` = self else {
        return
      }
      if err == nil {
        let status: String = dict!["status"] as! String
        if status == "success" {
          self.hud.dismiss()
          //Should proceed to next view
          self.redirectToPreRegisterCompletion()
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

extension RHBPreRegisterOTPViewController: SecurityCodeInputViewDelegate {
  
  func updateValue(_ string: String) {
    print(string + " is the OTP Code")
    inputedSecurityCode = string
    view.endEditing(true)
    verifyButton.isEnabled = true
  }
  
  func codeInputView(_ codeInputView: SecurityCodeInputView, didFinishWithCode code: String) {
    let delay = 0.1 * Double(NSEC_PER_SEC)
    let time = DispatchTime.now() + Double(Int64(delay)) / Double(NSEC_PER_SEC)
    DispatchQueue.main.asyncAfter(deadline: time) {
      self.updateValue(code)
    }
  }
  
  func codeInputViewDidBeginEditing() {
    // do whatever the first time field is active
  }
}
