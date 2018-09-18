//
//  Income.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 26/07/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//
/*
 "id_pendapatan_per_tahun": "1",
 "s_pendapatan_per_tahun": "Below Rp 10 million",
 "is_active": "t",
 "keterangan": null,
 "modified_by": null,
 "modified_at": "2017-12-12 10:38:20.165066+00",
 "kode_pendapatan_per_tahun": "1"
 */

import UIKit
import EVReflection

class Income: EVObject {
    var id_pendapatan_per_tahun: String = "0"
    var s_pendapatan_per_tahun: String = ""
    var is_active: String = ""
    var keterangan: String = ""
    var kode_pendapatan_per_tahun: String = ""
    
    func toPickerModel() -> PickerModel {
        return PickerModel(id: self.id_pendapatan_per_tahun, title: self.s_pendapatan_per_tahun)
    }
}
