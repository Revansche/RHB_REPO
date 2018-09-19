//
//  PersonalnfoViewController.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 18/07/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//

import UIKit

enum PersonalInfoPicker {
    case state, city, religion, relationship, bank, bankcountry, rdibank
}

class PersonalnfoViewController: UIViewController, PickerViewDelegate {
    
    @IBOutlet weak var dateBirthTF: UITextField!
    @IBOutlet weak var placeBirthTF: UITextField!
    @IBOutlet weak var streetTF: UITextField!
    @IBOutlet weak var postalCodeTF: UITextField!
    @IBOutlet weak var homePhoneTF: UITextField!
    @IBOutlet weak var emergencyNameTF: UITextField!
    @IBOutlet weak var emergencyPhoneTF: UITextField!
    @IBOutlet weak var bankHolderNameTF: UITextField!
    @IBOutlet weak var bankAccountNumberTF: UITextField!
    @IBOutlet weak var mataUangTF: UITextField!
    
    @IBOutlet weak var stateButton: UIButton!
    @IBOutlet weak var cityButton: UIButton!
    @IBOutlet weak var agamaButton: UIButton!
    @IBOutlet weak var relationshipButton: UIButton!
    
    @IBOutlet weak var namaBankButton: UIButton!
    @IBOutlet weak var bankCountryButton: UIButton!
    @IBOutlet weak var bankRDIButton: UIButton!
    
    
    @IBOutlet weak var investOthersTF: UITextField!
    @IBOutlet weak var educationOthersTF: UITextField!
    @IBOutlet weak var homeOthersTF: UITextField!
    
    @IBOutlet weak var maritalMarriedButton: UIButton!
    @IBOutlet weak var maritalSingleButton: UIButton!
    @IBOutlet weak var maritalDivorcedButton: UIButton!
    var maritalButtons: [UIButton]!
    
    @IBOutlet weak var genderManButton: UIButton!
    @IBOutlet weak var genderWomanButton: UIButton!
    var genderButtons: [UIButton]!
    
    @IBOutlet weak var homeOwnButton: UIButton!
    @IBOutlet weak var homeFamilyOwnButton: UIButton!
    @IBOutlet weak var homeOthersButton: UIButton!
    var homeButtons: [UIButton]!
    
    @IBOutlet weak var eduHighSchoolButton: UIButton!
    @IBOutlet weak var eduGraduateButton: UIButton!
    @IBOutlet weak var eduPostGraduateButton: UIButton!
    @IBOutlet weak var eduOthersButton: UIButton!
    var eduButtons: [UIButton]!
    
    @IBOutlet weak var investPriceApprButton: UIButton!
    @IBOutlet weak var investSpeculationButton: UIButton!
    @IBOutlet weak var investIncomeButton: UIButton!
    @IBOutlet weak var investLongButton: UIButton!
    @IBOutlet weak var investOthersButton: UIButton!
    var investButtons: [UIButton]!
    
    var formData: FormData!
    var pickerTrigger: PersonalInfoPicker!
    var provinceSelected: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pre-Registration"
        
        setDoneOnKeyboard()
        // Do any additional setup after loading the view.
        setMaritalButtonAction()
        setGenderButtonAction()
        setHomeButtonAction()
        setEducationButtonAction()
        setInvestButtonAction()
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
        
        // Personal Info
        formData.tgl_lahir = dateBirthTF.text! // 1987-05-12
        formData.tempat_lahir = placeBirthTF.text!
        formData.alamat_identitas = streetTF.text!
        formData.kodepos_identitas = postalCodeTF.text!
        formData.no_telp_rumah = homePhoneTF.text!
        
        // Emergency data
        formData.emergency_contact_name = emergencyNameTF.text!
        formData.emergency_contact_phone = emergencyPhoneTF.text!
        
        // Bank Info
        formData.cabang_bank = bankHolderNameTF.text!
        formData.nomor_rekening = bankAccountNumberTF.text!
        formData.currency_rdi = mataUangTF.text!
        
        Constants.setFormData(withFormData: formData)
        
        DispatchQueue.main.async {
            let regVC = WorkInfoViewController()
            self.navigationController?.pushViewController(regVC, animated: true)
        }
        
    }
    
    @IBAction func stateAction(_ sender: UIButton) {
        let pickerVc = PickerViewController()
        pickerVc.modalPresentationStyle = .formSheet
        
        self.present(pickerVc, animated: true, completion: {
            self.pickerTrigger = .state
            pickerVc.pickerViewDelegate = self
            pickerVc.pickerTitle.text = "Province"
            pickerVc.getMasterData(forModel: .provinsi, withSegmentID: nil)
        })
    }
    
    @IBAction func cityAction(_ sender: UIButton) {
        let pickerVc = PickerViewController()
        pickerVc.modalPresentationStyle = .formSheet
        
        self.present(pickerVc, animated: true, completion: {
            self.pickerTrigger = .city
            pickerVc.pickerViewDelegate = self
            pickerVc.pickerTitle.text = "City"
            pickerVc.getMasterData(forModel: .kota, withSegmentID: self.provinceSelected)
        })
    }
    
    @IBAction func religionAction(_ sender: UIButton) {
        let pickerVc = PickerViewController()
        pickerVc.modalPresentationStyle = .formSheet
        
        self.present(pickerVc, animated: true, completion: {
            self.pickerTrigger = .religion
            pickerVc.pickerViewDelegate = self
            pickerVc.pickerTitle.text = "Religion"
            pickerVc.getMasterData(forModel: .agama, withSegmentID: nil)
        })
    }
    
    @IBAction func relationshipAction(_ sender: UIButton) {
        let pickerVc = PickerViewController()
        pickerVc.modalPresentationStyle = .formSheet
        
        self.present(pickerVc, animated: true, completion: {
            self.pickerTrigger = .relationship
            pickerVc.pickerViewDelegate = self
            pickerVc.pickerTitle.text = "Relationship"
            pickerVc.getMasterData(forModel: .relationship, withSegmentID: nil)
        })
    }
    
    @IBAction func bankNameAction(_ sender: UIButton) {
        let pickerVc = PickerViewController()
        pickerVc.modalPresentationStyle = .formSheet
        
        self.present(pickerVc, animated: true, completion: {
            self.pickerTrigger = .bank
            pickerVc.pickerViewDelegate = self
            pickerVc.pickerTitle.text = "Bank Name"
            pickerVc.getMasterData(forModel: .bank, withSegmentID: nil)
        })
    }
    
    @IBAction func bankCountryAction(_ sender: UIButton) {
        let pickerVc = PickerViewController()
        pickerVc.modalPresentationStyle = .formSheet
        
        self.present(pickerVc, animated: true, completion: {
            self.pickerTrigger = .bankcountry
            pickerVc.pickerViewDelegate = self
            pickerVc.pickerTitle.text = "Bank Country"
            pickerVc.getMasterData(forModel: .negara, withSegmentID: nil)
        })
    }
    
    @IBAction func bankRDIAction(_ sender: UIButton) {
        let pickerVc = PickerViewController()
        pickerVc.modalPresentationStyle = .formSheet
        
        self.present(pickerVc, animated: true, completion: {
            self.pickerTrigger = .rdibank
            pickerVc.pickerViewDelegate = self
            pickerVc.pickerTitle.text = "Bank RDI"
            pickerVc.getMasterData(forModel: .bank, withSegmentID: nil)
        })
    }
    
    // MARK: - MARITAL ACTION
    private func setMaritalButtonAction() {
        formData.status_perkawinan = "1"
        maritalMarriedButton.addTarget(self, action: #selector(maritalButtonAction), for: .touchUpInside)
        maritalSingleButton.addTarget(self, action: #selector(maritalButtonAction), for: .touchUpInside)
        maritalDivorcedButton.addTarget(self, action: #selector(maritalButtonAction), for: .touchUpInside)
        maritalButtons = [maritalMarriedButton, maritalSingleButton, maritalDivorcedButton]
    }
    
    @objc func maritalButtonAction(_ sender: UIButton) {
        sender.isSelected = true
        if sender == maritalSingleButton {
            formData.status_perkawinan = "1"
            formData.status_perkawinan_string = "Single"
        } else if sender == maritalMarriedButton {
            formData.status_perkawinan = "2"
            formData.status_perkawinan_string = "Married"
        } else {
            formData.status_perkawinan = "3"
            formData.status_perkawinan_string = "Divorced"
        }
        
        for item in maritalButtons {
            if item == sender {
                continue
            }
            
            item.isSelected = false
        }
    }
    
    // MARK: - GENDER ACTION
    private func setGenderButtonAction() {
        formData.jenis_kelamin = "1"
        genderManButton.addTarget(self, action: #selector(genderButtonAction), for: .touchUpInside)
        genderWomanButton.addTarget(self, action: #selector(genderButtonAction), for: .touchUpInside)
        genderButtons = [genderManButton, genderWomanButton]
    }
    
    @objc func genderButtonAction(_ sender: UIButton) {
        sender.isSelected = true
        if sender == genderManButton {
            formData.jenis_kelamin_string = "Laki-laki"
            formData.jenis_kelamin = "1"
        }else{
            formData.jenis_kelamin_string = "Perempuan"
            formData.jenis_kelamin = "2"
        }
        
        for item in genderButtons {
            if item == sender {
                continue
            }
            
            item.isSelected = false
        }
    }
    
    // MARK: - HOME ACTION
    private func setHomeButtonAction() {
        formData.kepemilikan_rmh = "1"
        formData.kepemilikan_rmh_string = "Family own"
        homeOwnButton.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        homeFamilyOwnButton.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        homeOthersButton.addTarget(self, action: #selector(homeButtonAction), for: .touchUpInside)
        homeButtons = [homeOwnButton, homeFamilyOwnButton, homeOthersButton]
    }
    
    @objc func homeButtonAction(_ sender: UIButton) {
        sender.isSelected = true
        if sender == homeOwnButton {
            formData.kepemilikan_rmh = "2"
            formData.kepemilikan_rmh_string = "My own"
        } else if sender == homeFamilyOwnButton {
            formData.kepemilikan_rmh = "1"
            formData.kepemilikan_rmh_string = "Family own"
        } else{
            formData.kepemilikan_rmh = "3"
            formData.kepemilikan_rmh_string = "Others"
        }
        
        for item in homeButtons {
            if item == sender {
                continue
            }
            
            item.isSelected = false
        }
        
    }
    
    // MARK: - EDUCATION ACTION
    private func setEducationButtonAction() {
        formData.pendidikan = "1"
        formData.pendidikan_string = "High School"
        eduOthersButton.addTarget(self, action: #selector(educationButtonAction), for: .touchUpInside)
        eduGraduateButton.addTarget(self, action: #selector(educationButtonAction), for: .touchUpInside)
        eduHighSchoolButton.addTarget(self, action: #selector(educationButtonAction), for: .touchUpInside)
        eduPostGraduateButton.addTarget(self, action: #selector(educationButtonAction), for: .touchUpInside)
        eduButtons = [eduOthersButton, eduGraduateButton, eduHighSchoolButton, eduPostGraduateButton]
    }
    
    @objc func educationButtonAction(_ sender: UIButton) {
        formData.pendidikan = "1"
        sender.isSelected = true
        if sender == eduGraduateButton {
            formData.pendidikan = "2"
            formData.pendidikan_string = "Graduate"
        } else if sender == eduHighSchoolButton {
            formData.pendidikan = "1"
            formData.pendidikan_string = "High School"
        } else if sender == eduPostGraduateButton {
            formData.pendidikan = "3"
            formData.pendidikan_string = "Post graduate"
        } else{
            formData.pendidikan = "4"
            formData.pendidikan_string = "Others"
        }
        
        for item in eduButtons {
            if item == sender {
                continue
            }
            
            item.isSelected = false
        }
    }
    
    
    // MARK: - INVESTMENT ACTION
    private func setInvestButtonAction() {
        formData.tujuan_investasi = "1"
        formData.tujuan_investasi_string = "Long term investment"
        investLongButton.addTarget(self, action: #selector(investmentButtonAction), for: .touchUpInside)
        investIncomeButton.addTarget(self, action: #selector(investmentButtonAction), for: .touchUpInside)
        investPriceApprButton.addTarget(self, action: #selector(investmentButtonAction), for: .touchUpInside)
        investSpeculationButton.addTarget(self, action: #selector(investmentButtonAction), for: .touchUpInside)
        investOthersButton.addTarget(self, action: #selector(investmentButtonAction), for: .touchUpInside)
        investButtons = [investLongButton, investIncomeButton, investPriceApprButton, investSpeculationButton, investOthersButton]
    }
    
    @objc func investmentButtonAction(_ sender: UIButton) {
        sender.isSelected = true
        if sender == investPriceApprButton {
            formData.tujuan_investasi = "1"
            formData.tujuan_investasi_string = "Price appreciation"
        } else if sender == investSpeculationButton {
            formData.tujuan_investasi = "2"
            formData.tujuan_investasi_string = "Speculation"
        } else if sender == investIncomeButton {
            formData.tujuan_investasi = "3"
            formData.tujuan_investasi_string = "Income"
        } else if sender == investLongButton {
            formData.tujuan_investasi = "4"
            formData.tujuan_investasi_string = "Long term investment"
        } else{
            formData.tujuan_investasi = "5"
            formData.tujuan_investasi_string = "Others"
        }
        
        for item in investButtons {
            if item == sender {
                continue
            }
            
            item.isSelected = false
        }
    }

    
    // MARK: - TOC Statement
    @IBAction func haveFamilyAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func haveBeiFamilyAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func leadCompanyAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func brokerAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    // MARK: - Keyboard toolbar
    private func setDoneOnKeyboard() {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        
        dateBirthTF.inputAccessoryView = keyboardToolbar
        placeBirthTF.inputAccessoryView = keyboardToolbar
        streetTF.inputAccessoryView = keyboardToolbar
        postalCodeTF.inputAccessoryView = keyboardToolbar
        homePhoneTF.inputAccessoryView = keyboardToolbar
        emergencyNameTF.inputAccessoryView = keyboardToolbar
        emergencyPhoneTF.inputAccessoryView = keyboardToolbar
        bankHolderNameTF.inputAccessoryView = keyboardToolbar
        bankAccountNumberTF.inputAccessoryView = keyboardToolbar
        mataUangTF.inputAccessoryView = keyboardToolbar
        
        investOthersTF.inputAccessoryView = keyboardToolbar
        educationOthersTF.inputAccessoryView = keyboardToolbar
        homeOthersTF.inputAccessoryView = keyboardToolbar

    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - Picker View
    func pickerViewDelegate(didSelectPickerView pickerView: UIPickerView, withData data: PickerModel, andMasterModel masterModel: MasterModel) {
        switch pickerTrigger! {
        case .state:
            provinceSelected = data.id
            formData.provinsi_identitas = data.title
            formData.kabupaten_identitas = ""
            stateButton.setTitle(data.title, for: .normal)
            cityButton.setTitle("", for: .normal)
        case .city:
            formData.kabupaten_identitas = data.title
            cityButton.setTitle(data.title, for: .normal)
        case .religion:
            formData.agama = data.id
            formData.agama_string = data.title
            agamaButton.setTitle(data.title, for: .normal)
        case .relationship:
            formData.emergency_contact_relationship = data.title
            relationshipButton.setTitle(data.title, for: .normal)
        case .bank:
            formData.nama_bank = data.title
            namaBankButton.setTitle(data.title, for: .normal)
        case .bankcountry:
            formData.negara_bank = data.title
            bankCountryButton.setTitle(data.title, for: .normal)
        case .rdibank:
            formData.bank_rdi = data.title
            bankRDIButton.setTitle(data.title, for: .normal)
//        case .none:
//            break
//        case .some(_):
//            break
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
