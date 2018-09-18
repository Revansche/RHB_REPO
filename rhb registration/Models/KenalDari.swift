//
//  KenalDari.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 26/07/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//
/*
 "id_kenal_dari": "1",
 "s_kenal_dari": "Teman/Keluarga",
 "is_active": "t",
 "keterangan": null,
 "modified_at": "2017-12-06 07:01:26.174135+00",
 "modified_by": null
 */

import UIKit
import EVReflection

class KenalDari: EVObject {
    var id_kenal_dari: String = "0"
    var s_kenal_dari: String = ""
    var is_active: String = ""
    var keterangan: String = ""
    
    func toPickerModel() -> PickerModel {
        return PickerModel(id: self.id_kenal_dari, title: self.s_kenal_dari)
    }
}
