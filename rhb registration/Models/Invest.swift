//
//  Invest.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 26/07/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//
/*
 "id_investment_obj": "1",
 "tujuan_investasi": "Lainnya",
 "tujuan_investasi_en": "Others",
 "is_active": "t",
 "keterangan": null,
 "modified_by": null,
 "modified_at": "2017-12-12 10:44:36.47259+00",
 "kode_investment_obj": "1"
 */

import UIKit
import EVReflection

class Invest: EVObject {
    var id_investment_obj: String = "0"
    var tujuan_investasi: String = ""
    var tujuan_investasi_en: String = ""
    var is_active: String = ""
    var keterangan: String = ""
    var kode_investment_obj: String = "0"
    
    func toPickerModel() -> PickerModel {
        return PickerModel(id: self.id_investment_obj, title: self.tujuan_investasi)
    }
}
