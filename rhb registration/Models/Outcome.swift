//
//  Outcome.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 26/07/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//
/*
 "id_pengeluaran": "5",
 "s_pengeluaran": "Above Rp 500 million and below Rp 1 billion",
 "is_active": "t",
 "keterangan": null,
 "modified_ by": null,
 "modified_at": "2017-12-18 14:52:36.335986+00"
 */

import UIKit
import EVReflection

class Outcome: EVObject {
    var id_pengeluaran: String = "0"
    var s_pengeluaran: String = ""
    var is_active: String = ""
    var keterangan: String = ""
    
    func toPickerModel() -> PickerModel {
        return PickerModel(id: self.id_pengeluaran, title: self.s_pengeluaran)
    }
}
