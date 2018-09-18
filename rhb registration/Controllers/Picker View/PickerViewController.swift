//
//  PickerViewController.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 26/07/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//

import UIKit

protocol PickerViewDelegate {
    func pickerViewDelegate(didSelectPickerView pickerView: UIPickerView, withData data: PickerModel, andMasterModel masterModel: MasterModel)
}

class PickerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var pickerTitle: UILabel!
    
    var pickerDataSource: [PickerModel] = [PickerModel]()
    var pickerViewDelegate: PickerViewDelegate!
    var pickerModelSelected: PickerModel!
    
    private var masterModel: MasterModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - PickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row].title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerModelSelected = pickerDataSource[row]
//        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeButtonTapAction(_ sender: Any) {
        if pickerViewDelegate != nil {
            pickerViewDelegate.pickerViewDelegate(didSelectPickerView: pickerView, withData: pickerModelSelected, andMasterModel: masterModel)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func getMasterData(forModel model: MasterModel, withSegmentID segment: String?) {
        self.masterModel = model
        
        var uri: String = Constants.getMasterURL(model)!
        if let uriseg = segment {
            uri += uriseg
        }

        APIService.getMasterData(masterUrl: uri, param: nil) { (json, err) in
            if err == nil {
                self.pickerDataSource = Constants.getPickersModel(fromArrayObject: json!, model)!
                self.pickerView.reloadAllComponents()
                if self.pickerDataSource.count > 0 {
                    self.pickerModelSelected = self.pickerDataSource[0]
                }
            } else {
                let alert = UIAlertController(title: "Server Error", message: "Getting response error from server", preferredStyle: UIAlertControllerStyle.alert)
                
                alert.addAction(
                    UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                        self.dismiss(animated: true, completion: nil)
                    })
                )
                self.present(alert, animated: true, completion: nil)
            }
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
