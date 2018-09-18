//
//  Bank.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 26/07/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//
/*
 "id_bank": "1",
 "nama_bank": "BANK BCA",
 "is_active": "t",
 "modified_by": null,
 "keterangan": null,
 "modified_at": "2017-12-13 16:40:40.100903+00",
 "kode_bank": "14"
 */

import UIKit
import EVReflection

class Bank: EVObject {
    var id_bank: String = "0"
    var nama_bank: String = ""
    var is_active: String = ""
    var keterangan: String = ""
    var kode_bank: String = ""
    
    func toPickerModel() -> PickerModel {
        return PickerModel(id: self.id_bank, title: self.nama_bank)
    }
}
