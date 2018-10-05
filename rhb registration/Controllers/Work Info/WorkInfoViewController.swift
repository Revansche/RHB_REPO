//
//  WorkInfoViewController.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 18/07/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//

import UIKit

enum WorkInfoPicker {
    case occupation, country, state, city, nature_bisnis, position, source_funds
}

class WorkInfoViewController: UIViewController, PickerViewDelegate {
    
    @IBOutlet weak var companyNameTF: UITextField!
    @IBOutlet weak var companyAddressTF: UITextField!
    @IBOutlet weak var postalCodeTF: UITextField!
    @IBOutlet weak var companyPhoneNoTF: UITextField!
    @IBOutlet weak var companyFaxNoTF: UITextField!
    @IBOutlet weak var periodeServiceTF: UITextField!
    
    @IBOutlet weak var occupationButton: UIButton!
    @IBOutlet weak var coutryButton: UIButton!
    @IBOutlet weak var stateButton: UIButton!
    @IBOutlet weak var cityButton: UIButton!
    @IBOutlet weak var positionButton: UIButton!
    @IBOutlet weak var natureBisnisButton: UIButton!
    @IBOutlet weak var sourceFundsButton: UIButton!
    
    // INCOME
    @IBOutlet weak var underMillionButton: UIButton!
    @IBOutlet weak var millionTwoButton: UIButton!
    @IBOutlet weak var twoMillionThreeButton: UIButton!
    @IBOutlet weak var moreThreeMillionButton: UIButton!
    var incomeButtons: [UIButton]!
    
    // funds
    @IBOutlet weak var hibahButton: UIButton!
    @IBOutlet weak var gajiButton: UIButton!
    @IBOutlet weak var usahaButton: UIButton!
    @IBOutlet weak var bungaButton: UIButton!
    @IBOutlet weak var warisanButton: UIButton!
    @IBOutlet weak var hibahOrtuButton: UIButton!
    @IBOutlet weak var pensiunButton: UIButton!
    @IBOutlet weak var lotereButton: UIButton!
    @IBOutlet weak var investasiButton: UIButton!
    @IBOutlet weak var depositoButton: UIButton!
    @IBOutlet weak var modalButton: UIButton!
    @IBOutlet weak var pinjamanButton: UIButton!
    @IBOutlet weak var othersButton: UIButton!
    
    var formData: FormData!
    var pickerTrigger: WorkInfoPicker!
    var sumberPenghasilan: [String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pre-Registration"
        sumberPenghasilan = [String]()
        
        setDoneOnKeyboard()
        // Do any additional setup after loading the view.
        setIncomeButtonAction()
        setFundsButtonAction()
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
        
        // Bank Info
        formData.nama_instansi = companyNameTF.text!
        formData.alamat_instansi = companyAddressTF.text!
//        formData.kode = postalCodeTF.text!
        formData.telp_instansi = companyPhoneNoTF.text!
        formData.fax_instansi = companyFaxNoTF.text!
//        formData. = periodeServiceTF.text!
        
        Constants.setFormData(withFormData: formData)
        
        DispatchQueue.main.async {
            let regVC = ProfileRiskViewController()
            self.navigationController?.pushViewController(regVC, animated: true)
        }
        
    }
    
    // MARK: Picker View
    @IBAction func occupationAction(_ sender: UIButton) {
        let pickerVc = PickerViewController()
        pickerVc.modalPresentationStyle = .formSheet
        
        self.present(pickerVc, animated: true, completion: {
            self.pickerTrigger = .occupation
            pickerVc.pickerViewDelegate = self
            pickerVc.pickerTitle.text = "Occupation"
          pickerVc.getMasterData(forType: .jobs, withSegmentID: nil)
        })
    }
    
    @IBAction func companyCountryAction(_ sender: UIButton) {
        let pickerVc = PickerViewController()
        pickerVc.modalPresentationStyle = .formSheet
        
        self.present(pickerVc, animated: true, completion: {
            self.pickerTrigger = .country
            pickerVc.pickerViewDelegate = self
            pickerVc.pickerTitle.text = "Country"
          pickerVc.getMasterData(forType: .negara, withSegmentID: nil)
        })
    }
    
    @IBAction func companyStateAction(_ sender: UIButton) {
        let pickerVc = PickerViewController()
        pickerVc.modalPresentationStyle = .formSheet
        
        self.present(pickerVc, animated: true, completion: {
            self.cityButton.setTitle("", for: .normal)
            self.formData.kab_instansi = ""
            self.pickerTrigger = .state
            pickerVc.pickerViewDelegate = self
            pickerVc.pickerTitle.text = "State"
          pickerVc.getMasterData(forType: .provinsi, withSegmentID: nil)
        })
    }
    
    @IBAction func companyCityAction(_ sender: UIButton) {
        let pickerVc = PickerViewController()
        pickerVc.modalPresentationStyle = .formSheet
        
        self.present(pickerVc, animated: true, completion: {
            self.pickerTrigger = .city
            pickerVc.pickerViewDelegate = self
            pickerVc.pickerTitle.text = "City"
          pickerVc.getMasterData(forType: .kota, withSegmentID: nil)
        })
    }
    
    @IBAction func companyTypeAction(_ sender: UIButton) {
        let pickerVc = PickerViewController()
        pickerVc.modalPresentationStyle = .formSheet
        
        self.present(pickerVc, animated: true, completion: {
            self.pickerTrigger = .nature_bisnis
            pickerVc.pickerViewDelegate = self
            pickerVc.pickerTitle.text = "Business Type"
          pickerVc.getMasterData(forType: .bisnis, withSegmentID: nil)
        })
    }
    
    @IBAction func companyJabatanAction(_ sender: UIButton) {
        let pickerVc = PickerViewController()
        pickerVc.modalPresentationStyle = .formSheet
        
        self.present(pickerVc, animated: true, completion: {
            self.pickerTrigger = .position
            pickerVc.pickerViewDelegate = self
            pickerVc.pickerTitle.text = "Position"
          pickerVc.getMasterData(forType: .jabatan, withSegmentID: nil)
        })
    }
    
    @IBAction func sourceFundsAction(_ sender: UIButton) {
        let pickerVc = PickerViewController()
        pickerVc.modalPresentationStyle = .formSheet
        
        self.present(pickerVc, animated: true, completion: {
            self.pickerTrigger = .source_funds
            pickerVc.pickerViewDelegate = self
            pickerVc.pickerTitle.text = "Source Funds"
          pickerVc.getMasterData(forType: .funds, withSegmentID: nil)
        })
    }
    
    // MARK: - Agreement Statement
    @IBAction func wajibPajakAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func wajibPajakForeignAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    // MARK: - INCOME ACTION
    private func setIncomeButtonAction() {
        formData.rata_penghasilan = "1"
        underMillionButton.addTarget(self, action: #selector(incomeButtonAction), for: .touchUpInside)
        twoMillionThreeButton.addTarget(self, action: #selector(incomeButtonAction), for: .touchUpInside)
        millionTwoButton.addTarget(self, action: #selector(incomeButtonAction), for: .touchUpInside)
        moreThreeMillionButton.addTarget(self, action: #selector(incomeButtonAction), for: .touchUpInside)
        incomeButtons = [underMillionButton, twoMillionThreeButton, millionTwoButton, moreThreeMillionButton]
    }
    
    @objc func incomeButtonAction(_ sender: UIButton) {
        sender.isSelected = true
        
        if sender == underMillionButton {
            formData.rata_penghasilan = "1"
        } else if sender == millionTwoButton  {
            formData.rata_penghasilan = "2"
        } else if sender == twoMillionThreeButton {
            formData.rata_penghasilan = "3"
        } else {
            formData.rata_penghasilan = "4"
        }
        
        for item in incomeButtons {
            if item == sender {
                continue
            }
            
            item.isSelected = false
        }
    }
    
    // MARK: - FUNDS ACTION
    private func setFundsButtonAction() {
        hibahButton.addTarget(self, action: #selector(fundsButtonAction), for: .touchUpInside)
        gajiButton.addTarget(self, action: #selector(fundsButtonAction), for: .touchUpInside)
        usahaButton.addTarget(self, action: #selector(fundsButtonAction), for: .touchUpInside)
        bungaButton.addTarget(self, action: #selector(fundsButtonAction), for: .touchUpInside)
        warisanButton.addTarget(self, action: #selector(fundsButtonAction), for: .touchUpInside)
        hibahOrtuButton.addTarget(self, action: #selector(fundsButtonAction), for: .touchUpInside)
        pensiunButton.addTarget(self, action: #selector(fundsButtonAction), for: .touchUpInside)
        lotereButton.addTarget(self, action: #selector(fundsButtonAction), for: .touchUpInside)
        investasiButton.addTarget(self, action: #selector(fundsButtonAction), for: .touchUpInside)
        depositoButton.addTarget(self, action: #selector(fundsButtonAction), for: .touchUpInside)
        modalButton.addTarget(self, action: #selector(fundsButtonAction), for: .touchUpInside)
        pinjamanButton.addTarget(self, action: #selector(fundsButtonAction), for: .touchUpInside)
        othersButton.addTarget(self, action: #selector(fundsButtonAction), for: .touchUpInside)
    }
    
    @objc func fundsButtonAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sumberPenghasilan.append(String(sender.tag))
        
        var penghasilan = sumberPenghasilan
        if !sender.isSelected {
            penghasilan = sumberPenghasilan.filter{$0 != String(sender.tag)}
        }
        
        sumberPenghasilan = penghasilan
        
        formData.sumber_penghasilan = sumberPenghasilan.joined(separator: ",")
    }
    
    // MARK: - Keyboard toolbar
    private func setDoneOnKeyboard() {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
        keyboardToolbar.items = [flexBarButton, doneBarButton]
        
        companyNameTF.inputAccessoryView = keyboardToolbar
        companyAddressTF.inputAccessoryView = keyboardToolbar
        postalCodeTF.inputAccessoryView = keyboardToolbar
        companyPhoneNoTF.inputAccessoryView = keyboardToolbar
        companyFaxNoTF.inputAccessoryView = keyboardToolbar
        periodeServiceTF.inputAccessoryView = keyboardToolbar
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - Pickerview Delegate
    
    func pickerViewDelegate(didSelectPickerView pickerView: UIPickerView, withData data: PickerModel, andMasterModel masterModel: MasterDataType) {
        switch pickerTrigger! {
        case .occupation:
            occupationButton.setTitle(data.title, for: .normal)
            formData.pekerjaan = data.id
            formData.pekerjaan_string = data.title
        case .country:
            coutryButton.setTitle(data.title, for: .normal)
            formData.negara_instansi = data.title
        case .state:
            stateButton.setTitle(data.title, for: .normal)
//            formData.state
        case .city:
            cityButton.setTitle(data.title, for: .normal)
            formData.kab_instansi = data.title
        case .nature_bisnis:
            natureBisnisButton.setTitle(data.title, for: .normal)
            formData.bidang_usaha = data.id
            formData.bidang_usaha_string = data.title
        case .position:
            positionButton.setTitle(data.title, for: .normal)
            formData.jabatan = data.id
        case .source_funds:
            sourceFundsButton.setTitle(data.title, for: .normal)
            formData.sumber_dana = data.id
            formData.sumber_dana_string = data.title
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
