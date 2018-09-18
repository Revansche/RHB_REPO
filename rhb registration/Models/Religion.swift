//
//  Religion.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 26/07/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//
/*
 "id_agama": "1",
 "kode_agama": "M",
 "nama_agama": "Islam",
 "keterangan": null,
 "is_active": "t",
 "modified_by": null,
 "modified_at": "2017-12-13 05:27:21.075896+00"
 */

import UIKit
import EVReflection

class Religion: EVObject {
    var id_agama: String = "0"
    var kode_agama: String = ""
    var nama_agama: String = ""
    var keterangan: String = ""
    var is_active: String = ""
    
    func toPickerModel() -> PickerModel {
        return PickerModel(id: self.kode_agama, title: self.nama_agama)
    }
}
