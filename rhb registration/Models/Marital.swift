//
//  Marital.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 26/07/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//
/*
 "id_marital": "1",
 "status_perkawinan": "Sendiri",
 "keterangan": null,
 "modified_by": null,
 "modified_at": "2017-12-12 10:17:37.919014+00",
 "is_active": "t",
 "status_perkawinan_en": "Single",
 "kode_marital": "1"
 */

import UIKit
import EVReflection

class Marital: EVObject {
    var id_marital: String = "0"
    var status_perkawinan: String = ""
    var keterangan: String = ""
    var is_active: String = ""
    var status_perkawinan_en: String = ""
    var kode_marital: String = ""
    
    func toPickerModel() -> PickerModel {
        return PickerModel(id: self.id_marital, title: self.status_perkawinan)
    }
    
//    static func getId(from maritalStatus: MaritalStatus) -> String {
//        switch maritalStatus {
//        case .married:
//            return "2"
//        case .single:
//            return "1"
//        case .divorced:
//            return "3"
//        }
//    }
}

enum MaritalStatus: String {
    case married, single, divorced
    
    var code: String {
        switch self {
        case .married: return "2"
        case .single: return "1"
        case .divorced: return "3"
        }
    }
}
