//
//  RegistrationFormViewController.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 18/07/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//

import UIKit
import MobileCoreServices

class RegistrationFormViewController: UIViewController, PickerViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPasswordTF: UITextField!
    @IBOutlet weak var fullNameTF: UITextField!
    @IBOutlet weak var phoneNumberTF: UITextField!
    @IBOutlet weak var ektpTF: UITextField!
    @IBOutlet weak var npwpTF: UITextField!
    
    @IBOutlet weak var btnCitizenIndo: UIButton!
    @IBOutlet weak var btnForeign: UIButton!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var btnGreenCard: UIButton!
    @IBOutlet weak var btnAgreeToc: UIButton!
    @IBOutlet weak var btnKenalDari: UIButton!
    
    var formData: FormData = FormData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pre-Registration"
        
        setDoneOnKeyboard()
       
        btnCitizenIndo.isSelected = true
        btnGreenCard.isSelected = false
        btnAgreeToc.isSelected = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        formData = Constants.getFormData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func processBtnTap(_ sender: Any) {
        formData.email = emailTF.text!
        formData.nama_lengkap = fullNameTF.text!
        formData.no_hp = phoneNumberTF.text!
        formData.nomor_identitas = ektpTF.text!
        formData.no_npwp = npwpTF.text!
        formData.have_green_card = btnGreenCard.isSelected.description
        
        Constants.setFormData(withFormData: formData)
        
        DispatchQueue.main.async {
            let regVC = PersonalnfoViewController()
            self.navigationController?.pushViewController(regVC, animated: true)
        }
    }
    
    @IBAction func captureKtpTap(_ sender: Any) {
        CameraHandler.shared.showActionSheet(vc: self)
        CameraHandler.shared.imagePickedBlock = { (image) in
            let (ktpLocation, err) = FileService.saveImageToDocument(forImage: image, withTitle: "ektp")
            if err == nil {
                self.formData.img_ektp_url = (ktpLocation?.absoluteString)!
                print("eKTP", self.formData.img_ektp_url)
            } else {
                print("eKTP", err.debugDescription)
            }
            
        }
    }
    
    @IBAction func captureNpwpTap(_ sender: Any) {
        CameraHandler.shared.showActionSheet(vc: self)
        CameraHandler.shared.imagePickedBlock = { (image) in
            let (npwpLocation, err) = FileService.saveImageToDocument(forImage: image, withTitle: "npwp")
            if err == nil {
                self.formData.img_npwp_url = (npwpLocation?.absoluteString)!
                print("eKTP", self.formData.img_npwp_url)
            } else {
                print("eKTP", err.debugDescription)
            }
        }
    }
    
    @IBAction func selfieTap(_ sender: Any) {
        CameraHandler.shared.showActionSheet(vc: self)
        CameraHandler.shared.imagePickedBlock = { (image) in
            let (ektpSelfieLocation, err) = FileService.saveImageToDocument(forImage: image, withTitle: "ektp_selfie")
            if err == nil {
                self.formData.img_selfie_ektp_url = (ektpSelfieLocation?.absoluteString)!
                print("eKTP", self.formData.img_selfie_ektp_url)
            } else {
                print("eKTP", err.debugDescription)
            }
        }
    }
    
    @IBAction func threeSecondVideoTap(_ sender: Any) {
        VideoHelper.startMediaBrowser(delegate: self as UIViewController & UIImagePickerControllerDelegate & UINavigationControllerDelegate, sourceType: .camera)
    }
    
    @objc func video(_ videoPath: String, didFinishSavingWithError error: Error?, contextInfo info: AnyObject) {
        let title = (error == nil) ? "Success" : "Error"
        let message = (error == nil) ? "Video was saved" : "Video failed to save"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Citizenship
    @IBAction func btnForeignTapAction(_ sender: UIButton) {
        btnCitizenIndo.isSelected = false
        sender.isSelected = true
        let pickerVc = PickerViewController()
        pickerVc.modalPresentationStyle = .formSheet
        
        self.present(pickerVc, animated: true, completion: {
            pickerVc.pickerViewDelegate = self
            pickerVc.pickerTitle.text = "Country"
          pickerVc.getMasterData(forType: .negara, withSegmentID: nil)
        })
    }
    
    @IBAction func btnIndoTapAction(_ sender: UIButton) {
        formData.citizenship = "INDONESIAN"
        btnForeign.isSelected = false
        sender.isSelected = true
    }
    
    // MARK: - Mengenal RHB
    @IBAction func btnMengenalRHBAction(_ sender: UIButton) {
        let pickerVc = PickerViewController()
        pickerVc.modalPresentationStyle = .formSheet
        
        self.present(pickerVc, animated: true, completion: {
            pickerVc.pickerViewDelegate = self
            pickerVc.pickerTitle.text = "Mengenal RHB Dari"
          pickerVc.getMasterData(forType: .kenal, withSegmentID: nil)
        })
    }
    
    // MARK: - Agree statement
    @IBAction func btnGreenCardAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func btnAgreeTocAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    // MARK: - Segment NPWP
    @IBAction func segmentNpwpChanged(_ sender: UISwitch) {
        if sender.isOn {
            npwpTF.isEnabled = true
        }else {
            npwpTF.isEnabled = false
        }
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
        ektpTF.inputAccessoryView = keyboardToolbar
        confirmPasswordTF.inputAccessoryView = keyboardToolbar
        fullNameTF.inputAccessoryView = keyboardToolbar
        phoneNumberTF.inputAccessoryView = keyboardToolbar
        npwpTF.inputAccessoryView = keyboardToolbar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: Picker View Delegate
    func pickerViewDelegate(didSelectPickerView pickerView: UIPickerView, withData data: PickerModel, andMasterModel masterModel: MasterDataType) {
        if masterModel == .negara {
            formData.citizenship = data.title
            countryLabel.text = data.title
        } else if masterModel == .kenal {
            formData.kenal_dari = data.title
            btnKenalDari.setTitle(data.title, for: .normal)
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

// MARK: - UIImagePickerControllerDelegate

extension RegistrationFormViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        dismiss(animated: true, completion: nil)
        
        guard let mediaType = info[UIImagePickerControllerMediaType] as? String,
            mediaType == (kUTTypeMovie as String),
            let url = info[UIImagePickerControllerMediaURL] as? URL,
            UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(url.path)
            else { return }
        
        // Handle a movie capture
        UISaveVideoAtPathToSavedPhotosAlbum(url.path, self, #selector(video(_:didFinishSavingWithError:contextInfo:)), nil)
    }
}

extension RegistrationFormViewController: UINavigationControllerDelegate {
}



