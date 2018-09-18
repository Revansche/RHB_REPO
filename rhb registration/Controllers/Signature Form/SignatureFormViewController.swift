//
//  SignatureFormViewController.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 21/07/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//

import UIKit
import JGProgressHUD

class SignatureFormViewController: UIViewController {
    @IBOutlet weak var fullSignatureView: YPDrawSignatureView!
    
    @IBOutlet weak var initialSignatureView: YPDrawSignatureView!
    
    var formData: FormData!
    var hud: JGProgressHUD!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pre-Registration"
        hud = JGProgressHUD(style: .dark)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        formData = Constants.getFormData()
    }
    
    @IBAction func clearFullSignatureAction(_ sender: Any) {
        fullSignatureView.clear()
    }
    
    @IBAction func clearInitialSignatureAction(_ sender: Any) {
        initialSignatureView.clear()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func processBtnTap(_ sender: Any) {
        let regVC = RegistrationCompleteViewController()
        self.navigationController?.pushViewController(regVC, animated: true)
        hud.textLabel.text = "Loading"
        hud.show(in: self.view)
        
        saveSignatureImage()
        
        APIService.postImageData(formData: formData) { (dict, err) in
            if err == nil {
                self.hud.dismiss(afterDelay: 3)
                if let code: Int = dict!["code"] as? Int {
                    self.alertMessage(message: "success upload image with code" + String(code))
                }else{
                    self.alertMessage(message: "failed upload image")
                }
            } else {
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
    
    private func saveSignatureImage() {
        // Full Signature
        let (fullSignature, err) = FileService.saveImageToDocument(forImage: fullSignatureView.getSignature()!, withTitle: "full_signature")
        if err == nil {
            self.formData.full_signature_url = (fullSignature?.absoluteString)!
        } else {
            alertMessage(message: err.debugDescription)
        }
        
        // Initial Signature
        let (initialSignature, errs) = FileService.saveImageToDocument(forImage: initialSignatureView.getSignature()!, withTitle: "initial_signature")
        if errs == nil {
            self.formData.initial_signature_url = (initialSignature?.absoluteString)!
        } else {
            alertMessage(message: errs.debugDescription)
        }
        
        Constants.setFormData(withFormData: formData)
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
