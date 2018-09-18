//
//  Province.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 26/07/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//
/*
 "id_province": "1",
 "nama_provinsi": "BALI",
 "is_active": "t",
 "keterangan": null,
 "modified_by": null,
 "modified_at": "2017-12-13 12:23:14.678475+00",
 "kode_provinsi": "1"
 */

import UIKit
import EVReflection

class Province: EVObject {
    var id_province: String = "0"
    var nama_provinsi: String = ""
    var is_active: String = ""
    var keterangan: String = ""
    var kode_provinsi: String = "0"
    
    func toPickerModel() -> PickerModel {
        return PickerModel(id: self.id_province, title: self.nama_provinsi)
    }
}
