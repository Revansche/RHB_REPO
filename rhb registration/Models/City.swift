//
//  City.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 26/07/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//
/*
 "id_district": "1",
 "nama_kabupaten": "JEMBRANA",
 "is_active": "t",
 "keterangan": null,
 "modified_by": null,
 "kode_provinsi": "1",
 "modified_at": "2017-12-13 12:31:38.538294+00",
 "kode_kabupaten": "256"
 */

import UIKit
import EVReflection

class City: EVObject {
    var id_district: String = "0"
    var nama_kabupaten: String = ""
    var is_active: String = ""
    var keterangan: String = ""
    var kode_provinsi: String = "0"
    var kode_kabupaten: String = "0"
    
    func toPickerModel() -> PickerModel {
        return PickerModel(id: self.id_district, title: self.nama_kabupaten)
    }
}
