//
//  PickerModel.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 26/07/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//

import UIKit

class PickerModel: NSObject {

    var id: String!
    var title: String!
    
    init(id: String, title: String) {
        self.id = id
        self.title = title
    }
    
}
