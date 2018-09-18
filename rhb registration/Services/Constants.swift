//
//  Constants.swift
//  Igo App
//
//  Created by Alam Yudi on 8/3/16.
//  Copyright © 2016 Alam Yudi. All rights reserved.
//

import UIKit

class Constants: NSObject {
    
    static let kFormDataKey = "form_data"
    static let kRegistrationDataKey = "registration_data"
    
    static let kDefaultAuth = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZCI6IjEifQ.GX-o9Fq7VKDAxSJh4LjPp8NLYa2OwFt56hJXL_d3Ey0"
    static let kBaseUrl = "http://35.240.199.167:8080/rhb-api/"
    
    static let kMasterBank = "master/bank/"
    static let kMasterAgama = "master/agama/"
    static let kMasterNegara = "master/negara/"
    static let kMasterKota = "master/kabupaten/"
    static let kMasterProvinsi = "master/provinsi/"
    static let kMasterTujuanInvestasi = "master/tujuan_investasi/"
    static let kMasterJabatan = "master/jabatan/"
    static let kMasterKenalDari = "master/kenal_dari/"
    static let kMasterKepemilikanRumah = "master/kepemilikan_rmh/"
    static let kMasterMarital = "master/marital/"
    static let kMasterPekerjaan = "master/pekerjaan/"
    static let kMasterPendapatanPerTahun = "master/pendapatan_per_thn/"
    static let kMasterPengeluaranPerTahun = "master/pengeluaran_per_thn/"
    static let kMasterHubungan = "master/hubungan/"
    static let kMasterSales = "master/sales/"
    static let kMasterSumberDana = "master/sumber_dana/"
    static let kMasterTypeBisnis = "master/tipe_bisnis/"
    
    static let kLoginUrl = kBaseUrl + "auth/token"
    static let kSendFormDataUrl = kBaseUrl + "registration/form_data"
    static let kSendImageDataUrl = kBaseUrl + "registration/image_video_base64"
    
    static func getMasterURL(_ masterModel: MasterModel) -> String? {
        switch masterModel {
        case .negara:
            return kBaseUrl + kMasterNegara
        case .bank:
            return kBaseUrl + kMasterBank
        case .agama:
            return kBaseUrl + kMasterAgama
        case .kota:
            return kBaseUrl + kMasterKota
        case .provinsi:
            return kBaseUrl + kMasterProvinsi
        case .investasi:
            return kBaseUrl + kMasterTujuanInvestasi
        case .jabatan:
            return kBaseUrl + kMasterJabatan
        case .kenal:
            return kBaseUrl + kMasterKenalDari
        case .rumah:
            return kBaseUrl + kMasterKepemilikanRumah
        case .marital:
            return kBaseUrl + kMasterMarital
        case .jobs:
            return kBaseUrl + kMasterPekerjaan
        case .income:
            return kBaseUrl + kMasterPendapatanPerTahun
        case .outcome:
            return kBaseUrl + kMasterPengeluaranPerTahun
        case .relationship:
            return kBaseUrl + kMasterHubungan
        case .funds:
            return kBaseUrl + kMasterSumberDana
        case .bisnis:
            return kBaseUrl + kMasterTypeBisnis
        }
    }
    
    static func getPickersModel(fromArrayObject arrayObject: [Any], _ masterModel: MasterModel) -> [PickerModel]? {
        switch masterModel {
        case .negara:
            let country = [Country](dictionaryArray: arrayObject as! [NSDictionary])
            var pickers = [PickerModel]()
            for item in country {
                pickers.append(item.toPickerModel())
            }
            return pickers
        case .bank:
            let bank = [Bank](dictionaryArray: arrayObject as! [NSDictionary])
            var pickers = [PickerModel]()
            for item in bank {
                pickers.append(item.toPickerModel())
            }
            return pickers
        case .agama:
            let agama = [Religion](dictionaryArray: arrayObject as! [NSDictionary])
            var pickers = [PickerModel]()
            for item in agama {
                pickers.append(item.toPickerModel())
            }
            return pickers
        case .kota:
            let kota = [City](dictionaryArray: arrayObject as! [NSDictionary])
            var pickers = [PickerModel]()
            for item in kota {
                pickers.append(item.toPickerModel())
            }
            return pickers
        case .provinsi:
            let province = [Province](dictionaryArray: arrayObject as! [NSDictionary])
            var pickers = [PickerModel]()
            for item in province {
                pickers.append(item.toPickerModel())
            }
            return pickers
        case .investasi:
            let invest = [Invest](dictionaryArray: arrayObject as! [NSDictionary])
            var pickers = [PickerModel]()
            for item in invest {
                pickers.append(item.toPickerModel())
            }
            return pickers
        case .jabatan:
            let jabatan = [Jabatan](dictionaryArray: arrayObject as! [NSDictionary])
            var pickers = [PickerModel]()
            for item in jabatan {
                pickers.append(item.toPickerModel())
            }
            return pickers
        case .kenal:
            let kenal = [KenalDari](dictionaryArray: arrayObject as! [NSDictionary])
            var pickers = [PickerModel]()
            for item in kenal {
                pickers.append(item.toPickerModel())
            }
            return pickers
        case .rumah:
            let rumah = [KepemilikanRumah](dictionaryArray: arrayObject as! [NSDictionary])
            var pickers = [PickerModel]()
            for item in rumah {
                pickers.append(item.toPickerModel())
            }
            return pickers
        case .marital:
            let marital = [Marital](dictionaryArray: arrayObject as! [NSDictionary])
            var pickers = [PickerModel]()
            for item in marital {
                pickers.append(item.toPickerModel())
            }
            return pickers
        case .jobs:
            let jobs = [Job](dictionaryArray: arrayObject as! [NSDictionary])
            var pickers = [PickerModel]()
            for item in jobs {
                pickers.append(item.toPickerModel())
            }
            return pickers
        case .income:
            let income = [Income](dictionaryArray: arrayObject as! [NSDictionary])
            var pickers = [PickerModel]()
            for item in income {
                pickers.append(item.toPickerModel())
            }
            return pickers
        case .outcome:
            let outcome = [Outcome](dictionaryArray: arrayObject as! [NSDictionary])
            var pickers = [PickerModel]()
            for item in outcome {
                pickers.append(item.toPickerModel())
            }
            return pickers
        case .relationship:
            let relationship = [Relationship](dictionaryArray: arrayObject as! [NSDictionary])
            var pickers = [PickerModel]()
            for item in relationship {
                pickers.append(item.toPickerModel())
            }
            return pickers
        case .funds:
            let funds = [SourceFunds](dictionaryArray: arrayObject as! [NSDictionary])
            var pickers = [PickerModel]()
            for item in funds {
                pickers.append(item.toPickerModel())
            }
            return pickers
        case .bisnis:
            let bisnis = [BusinessType](dictionaryArray: arrayObject as! [NSDictionary])
            var pickers = [PickerModel]()
            for item in bisnis {
                pickers.append(item.toPickerModel())
            }
            return pickers
        }
        
    }
    
    // MARK: - Form Data
    static func setFormData(withFormData formData: FormData!) {
        print(formData)
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: formData)
        let preferences = UserDefaults.standard
        preferences.set(encodedData, forKey: kFormDataKey)
        preferences.synchronize()
    }
    
    static func getFormData() -> FormData {
        let preferences = UserDefaults.standard
        guard let formData: Data = preferences.object(forKey: kFormDataKey) as? Data else {
            return FormData()
        }
        let decodedFormData = NSKeyedUnarchiver.unarchiveObject(with: formData) as! FormData

        return decodedFormData
    }
    
    static func removeFormData() {
        let preferences = UserDefaults.standard
        preferences.removeObject(forKey: kFormDataKey)
    }
    
    // MARK: - Registration Data
    static func setRegistrationData(withRegData regData: String!) {
        let preferences = UserDefaults.standard
        preferences.set(regData, forKey: kRegistrationDataKey)
        preferences.synchronize()
    }
    
    static func getRegistrationData() -> String? {
        let preferences = UserDefaults.standard
        guard let regData: String = preferences.object(forKey: kRegistrationDataKey) as? String else {
            return nil
        }
        
        return regData
    }
    
    static func removeRegistrationData() {
        let preferences = UserDefaults.standard
        preferences.removeObject(forKey: kRegistrationDataKey)
    }
    
}

enum MasterModel {
    case negara, bank, agama, kota, provinsi, investasi, jabatan, kenal, rumah, marital, jobs, income, outcome, relationship, funds, bisnis
}

