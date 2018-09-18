//
//  Relationship.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 26/07/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//
/*
 "id_relationship": "1",
 "nama_relationship": "Ayah Kandung",
 "nama_relationship_en": "Father",
 "is_active": "t",
 "modified_by": null,
 "modified_at": "2017-12-21 20:23:11.88487+00",
 "keterangan": null
 */


import UIKit
import EVReflection

class Relationship: EVObject {
    var id_relationship: String = "0"
    var nama_relationship: String = ""
    var nama_relationship_en: String = ""
    var is_active: String = ""
    var keterangan: String = ""
    
    func toPickerModel() -> PickerModel {
        return PickerModel(id: self.id_relationship, title: self.nama_relationship)
    }
}
