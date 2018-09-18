//
//  LoginViewController.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 19/06/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//

import UIKit
import JGProgressHUD

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    
    var hud: JGProgressHUD!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        title = "Login"
        // Do any additional setup after loading the view.
        hud = JGProgressHUD(style: .dark)
        setDoneOnKeyboard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonAction(_ sender: Any) {
        let userName = emailTF.text!
        let password = passwordTF.text!
        
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
    
    private func alertMessage(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
                
            }}))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Keyboard toolbar
    private func setDoneOnKeyboard() {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        
        emailTF.inputAccessoryView = keyboardToolbar
        passwordTF.inputAccessoryView = keyboardToolbar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
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
