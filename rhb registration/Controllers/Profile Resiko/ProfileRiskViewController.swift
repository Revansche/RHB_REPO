//
//  ProfileRiskViewController.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 18/07/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//

import UIKit

class ProfileRiskViewController: UIViewController {

    @IBOutlet weak var jangkaPanjangButton: UIButton!
    @IBOutlet weak var jangkaMenengahButton: UIButton!
    @IBOutlet weak var jangkaPendekButton: UIButton!
    var jangkaButtons: [UIButton]!
    
    @IBOutlet weak var alokasiMoreSevenButton: UIButton!
    @IBOutlet weak var alokasiUnderThreeButton: UIButton!
    @IBOutlet weak var threeUntilSevenButton: UIButton!
    var alokasiButtons: [UIButton]!
    
    @IBOutlet weak var tujuanMasaDepanButton: UIButton!
    @IBOutlet weak var tujuanMenengahButton: UIButton!
    @IBOutlet weak var tujuanPendekButton: UIButton!
    var tujuanButtons: [UIButton]!
    
    var formData: FormData!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pre-Registration"

        // Do any additional setup after loading the view.
        setJangkaButtonAction()
        setTujuanButtonAction()
        setAlokasiButtonAction()
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
        let regVC = RegistrationSummaryViewController()
        self.navigationController?.pushViewController(regVC, animated: true)
    }
    
    // MARK: - JANGKA ACTION
    private func setJangkaButtonAction() {
        jangkaPendekButton.addTarget(self, action: #selector(jangkaButtonAction), for: .touchUpInside)
        jangkaPanjangButton.addTarget(self, action: #selector(jangkaButtonAction), for: .touchUpInside)
        jangkaMenengahButton.addTarget(self, action: #selector(jangkaButtonAction), for: .touchUpInside)
        
        jangkaButtons = [jangkaPendekButton, jangkaPanjangButton, jangkaMenengahButton]
    }
    
    @objc func jangkaButtonAction(_ sender: UIButton) {
        sender.isSelected = true
        for item in jangkaButtons {
            if item == sender {
                continue
            }
            
            item.isSelected = false
        }
    }
    
    // MARK: - ALOKASI ACTION
    private func setAlokasiButtonAction() {
        alokasiMoreSevenButton.addTarget(self, action: #selector(alokasiButtonAction), for: .touchUpInside)
        alokasiUnderThreeButton.addTarget(self, action: #selector(alokasiButtonAction), for: .touchUpInside)
        threeUntilSevenButton.addTarget(self, action: #selector(alokasiButtonAction), for: .touchUpInside)
        
        alokasiButtons = [alokasiMoreSevenButton, alokasiUnderThreeButton, threeUntilSevenButton]
    }
    
    @objc func alokasiButtonAction(_ sender: UIButton) {
        sender.isSelected = true
        for item in alokasiButtons {
            if item == sender {
                continue
            }
            
            item.isSelected = false
        }
    }
    
    // MARK: - TUJUAN ACTION
    private func setTujuanButtonAction() {
        tujuanPendekButton.addTarget(self, action: #selector(tujuanButtonAction), for: .touchUpInside)
        tujuanMenengahButton.addTarget(self, action: #selector(tujuanButtonAction), for: .touchUpInside)
        tujuanMasaDepanButton.addTarget(self, action: #selector(tujuanButtonAction), for: .touchUpInside)
        
        tujuanButtons = [tujuanPendekButton, tujuanMenengahButton, tujuanMasaDepanButton]
    }
    
    @objc func tujuanButtonAction(_ sender: UIButton) {
        sender.isSelected = true
        for item in tujuanButtons {
            if item == sender {
                continue
            }
            
            item.isSelected = false
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
