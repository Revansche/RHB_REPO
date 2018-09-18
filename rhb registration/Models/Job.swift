//
//  Job.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 26/07/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//
/*
 "id_occupation": "5",
 "nama_pekerjaan": "Pengusaha",
 "nama_pekerjaan_en": "Enterpreneur",
 "is_active": "t",
 "keterangan": null,
 "modified_at": "2017-12-13 06:56:32.649989+00",
 "modified_by": null,
 "kode_occupation": "5"
 */

import UIKit
import EVReflection

class Job: EVObject {
    var id_occupation: String = "0"
    var nama_pekerjaan: String = ""
    var nama_pekerjaan_en: String = ""
    var is_active: String = ""
    var keterangan: String = ""
    var kode_occupation: String = ""
    
    func toPickerModel() -> PickerModel {
        return PickerModel(id: self.id_occupation, title: self.nama_pekerjaan)
    }
}
