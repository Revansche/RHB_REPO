//
//  SourceFunds.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 26/07/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//
/*
 "id_sumber_dana": "1",
 "nama_sumber_dana": "Lainnya",
 "keterangan": null,
 "is_active": "t",
 "modified_by": null,
 "modified_at": "2017-12-13 06:55:18.786764+00",
 "nama_sumber_dana_en": "Others",
 "kode_sumber_dana": "1"
 */

import UIKit
import EVReflection

class SourceFunds: EVObject {
    var id_sumber_dana: String = "0"
    var nama_sumber_dana: String = ""
    var keterangan: String = ""
    var is_active: String = ""
    var nama_sumber_dana_en: String = ""
    var kode_sumber_dana: String = ""
    
    func toPickerModel() -> PickerModel {
        return PickerModel(id: self.id_sumber_dana, title: self.nama_sumber_dana)
    }
}
