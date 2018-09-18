//
//  RegistrationSummaryViewController.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 18/07/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//

import UIKit
import JGProgressHUD

class RegistrationSummaryViewController: UIViewController {
    
    // Personal Info
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var maritalLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var zipCodeLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var citizenshipLabel: UILabel!
    @IBOutlet weak var homeOwnershipLabel: UILabel!
    @IBOutlet weak var educationLabel: UILabel!
    
    // Emergency Contact
    @IBOutlet weak var emergencyNameLabel: UILabel!
    @IBOutlet weak var emergencyPhoneLabel: UILabel!
    
    @IBOutlet weak var spouseNameLabel: UILabel!
    @IBOutlet weak var spouseRelationshipLabel: UILabel!
    @IBOutlet weak var spouseIdNumberLabel: UILabel!
    @IBOutlet weak var spouseOccupationLabel: UILabel!
    @IBOutlet weak var spouseCompanyNameLabel: UILabel!
    @IBOutlet weak var spouseMotherMaidenNameLabel: UILabel!
    
    @IBOutlet weak var sidNumberLabel: UILabel!
    @IBOutlet weak var investmentObjectiveLabel: UILabel!
    
    // Work Info
    @IBOutlet weak var workOccupationLabel: UILabel!
    @IBOutlet weak var workCompanyNameLabel: UILabel!
    @IBOutlet weak var workCountryLabel: UILabel!
    @IBOutlet weak var workStateLabel: UILabel!
    @IBOutlet weak var workCityLabel: UILabel!
    @IBOutlet weak var workStreetLabel: UILabel!
    @IBOutlet weak var workZipCodeLabel: UILabel!
    @IBOutlet weak var workCompanyPhoneLabel: UILabel!
    @IBOutlet weak var workNatureOfBusinessLabel: UILabel!
    @IBOutlet weak var workCompanyFaxLabel: UILabel!
    @IBOutlet weak var workPositionLabel: UILabel!
    @IBOutlet weak var workPeriodeOfServiceLabel: UILabel!
    @IBOutlet weak var workAverageAnnualIncomeLabel: UILabel!
    @IBOutlet weak var workSourceOfFundsLabel: UILabel!
    
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
        setSummaryLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func processBtnTap(_ sender: Any) {
        hud.textLabel.text = "Loading"
        hud.show(in: self.view)
        
        // MARK: - send form data
        let formDataDict = formData.toDictionary()
        APIService.postFormData(param: formDataDict) { (dict, err) in
            if err == nil {
                print(dict ?? "empty")
                self.hud.dismiss(afterDelay: 3)
                let status: String = dict!["status"] as! String
                if status == "success" {
                    // get id_registrasi
                    var isDataRegistrasiFound = false
                    if let dataRegistrasi: NSDictionary = dict!["data"] as? NSDictionary {
                        if let idReg: String = dataRegistrasi["id_registrasi"] as? String {
                            Constants.setRegistrationData(withRegData: idReg)
                            isDataRegistrasiFound = true
                        }
                    }
                    
                    if !isDataRegistrasiFound {
                        self.alertMessage(message: "id_registration not found")
                    } else {
                        let regVC = SignatureFormViewController()
                        self.navigationController?.pushViewController(regVC, animated: true)
                    }
                }else{
                    if let msg = dict!["message"] {
                        self.alertMessage(message: msg as! String)
                    }
                }
            } else {
                self.alertMessage(message: err.debugDescription)
                self.hud.dismiss(afterDelay: 1.0)
            }
        }
    }
    
    // MARK: - Agree Statement
    
    @IBAction func correctInformationAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func agreeTocAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
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
    
    // MARK: - Bind form data
    private func setSummaryLabel() {
        // Personal Info
        fullNameLabel.text = formData.nama_lengkap
        dateOfBirthLabel.text = formData.tgl_lahir
        maritalLabel.text = formData.status_perkawinan_string
        countryLabel.text = formData.citizenship
        stateLabel.text = formData.provinsi_identitas
        cityLabel.text = formData.kabupaten_identitas
        streetLabel.text = formData.alamat_identitas
        zipCodeLabel.text = formData.kodepos_identitas
        phoneNumberLabel.text = formData.no_hp
        notesLabel.text = "" // formData.
        genderLabel.text = formData.jenis_kelamin_string
        citizenshipLabel.text = formData.citizenship
        homeOwnershipLabel.text = formData.kepemilikan_rmh_string
        educationLabel.text = formData.pendidikan_string
        
        // Emergency Contact
        emergencyNameLabel.text = formData.emergency_contact_name
        emergencyPhoneLabel.text = formData.emergency_contact_phone
        
        spouseNameLabel.text = formData.spouse_parents_name
        spouseRelationshipLabel.text = "" // formData
        spouseIdNumberLabel.text = "" // formData
        spouseOccupationLabel.text = formData.spouse_parents_occupation
        spouseCompanyNameLabel.text = formData.spouse_parents_company
        spouseMotherMaidenNameLabel.text = "" // formData.spou
        
        sidNumberLabel.text = formData.nomor_identitas
        investmentObjectiveLabel.text = formData.tujuan_investasi_string
        
        // Work Info
        workOccupationLabel.text = formData.pekerjaan_string
        workCompanyNameLabel.text = formData.nama_instansi
        workCountryLabel.text = formData.negara_instansi
        workStateLabel.text = "" // formData.insta
        workCityLabel.text = formData.kab_instansi
        workStreetLabel.text = formData.alamat_instansi
        workZipCodeLabel.text = "" // formData.
        workCompanyPhoneLabel.text = formData.telp_instansi
        workNatureOfBusinessLabel.text = formData.bidang_usaha_string
        workCompanyFaxLabel.text = formData.fax_instansi
        workPositionLabel.text = formData.jabatan
        workPeriodeOfServiceLabel.text = "" // formData.
        workAverageAnnualIncomeLabel.text = formData.rata_penghasilan
        workSourceOfFundsLabel.text = formData.sumber_dana_string
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
