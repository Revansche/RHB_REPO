//
//  Country.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 26/07/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//
/*
 "id_country": "1",
 "nama_negara": "ÅALAND ISLANDS",
 "is_active": "t",
 "modified_by": null,
 "keterangan": null,
 "nama_negara_en": null,
 "alpha_2": "AX",
 "modified_at": "2017-12-13 11:02:23.493689+00",
 "nationality": "Åaland Islands"
 */

import UIKit
import EVReflection

class Country: EVObject {
    var id_country: String = "0"
    var nama_negara: String = ""
    var is_active: String = ""
    var keterangan: String = ""
    var nama_negara_en: String = ""
    var nationality: String = ""
    
    func toPickerModel() -> PickerModel {
        return PickerModel(id: self.id_country, title: self.nama_negara)
    }
}
