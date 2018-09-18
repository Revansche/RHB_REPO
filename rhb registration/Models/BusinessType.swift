//
//  BusinessType.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 26/07/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//
/*
 "id_tipe_bisnis": "1",
 "tipe_bisnis": "Lainnya",
 "tipe_bisnis_en": "Others",
 "is_active": "t",
 "modified_by": null,
 "keterangan": null,
 "modified_at": "2017-12-12 10:54:41.880217+00"
 */

import UIKit
import EVReflection

class BusinessType: EVObject {
    var id_tipe_bisnis: String = "0"
    var tipe_bisnis: String = ""
    var tipe_bisnis_en: String = ""
    var is_active: String = ""
    var keterangan: String = ""
    
    func toPickerModel() -> PickerModel {
        return PickerModel(id: self.id_tipe_bisnis, title: self.tipe_bisnis)
    }
}
