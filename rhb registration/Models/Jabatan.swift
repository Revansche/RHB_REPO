//
//  Jabatan.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 26/07/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//
/*
 "id_jabatan": "1",
 "nama_jabatan": "Pemilik",
 "nama_jabatan_en": "Owner",
 "is_active": "t",
 "keterangan": null,
 "modified_at": "2017-11-23 12:52:10.295632+00",
 "modified_by": null
 */

import UIKit
import EVReflection

class Jabatan: EVObject {
    var id_jabatan: String = "0"
    var nama_jabatan: String = ""
    var nama_jabatan_en: String = ""
    var is_active: String = ""
    var keterangan: String = ""
    
    func toPickerModel() -> PickerModel {
        return PickerModel(id: self.id_jabatan, title: self.nama_jabatan)
    }
}
