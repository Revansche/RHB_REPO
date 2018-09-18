//
//  KepemilikanRumah.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 26/07/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//
/*
 "id_kepemilikan_rmh": "3",
 "s_kepemilikan_rmh": "Milik Suami/Istri",
 "keterangan": null,
 "is_active": "t",
 "modified_at": "2018-01-30 04:55:18.927327+00",
 "modified_by": null,
 "kode_kepemilikan_rmh": "S",
 "s_kepemilikan_rmh_en": "Spouse"
 */

import UIKit
import EVReflection

class KepemilikanRumah: EVObject {
    var id_kepemilikan_rmh: String = "0"
    var s_kepemilikan_rmh: String = ""
    var keterangan: String = ""
    var is_active: String = ""
    var kode_kepemilikan_rmh: String = ""
    var s_kepemilikan_rmh_en: String = ""

    func toPickerModel() -> PickerModel {
        return PickerModel(id: self.id_kepemilikan_rmh, title: self.s_kepemilikan_rmh)
    }
}
