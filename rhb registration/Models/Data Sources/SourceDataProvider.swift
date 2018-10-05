//
//  SourceDataProvider.swift
//  rhb registration
//
//  Created by Ghean Ginanjar on 04/10/18.
//  Copyright © 2018 RHB TradeSmart. All rights reserved.
//

import UIKit

class SourceDataProvider: NSObject {
  var objects: [PickerModel] = []
  var interface: SourceDataInterface
  let masterSourceType: MasterDataType
  
  init(withType type: MasterDataType, andInterface interface: SourceDataInterface) {
    self.interface = interface
    self.masterSourceType = type
    super.init()
  }
  
  func getMasterData() {
    interface.showLoader(withText: "Loading")
    
    let uri: String = Constants.getMasterURL(forType: masterSourceType)
    APIService.getMasterData(masterUrl: uri, param: nil) { [weak self] (json, err) in
      guard let `self` = self else {
        //If the VC already dealocated, halt everything
        return
      }
      if err == nil {
        self.objects = Constants.getPickersModel(fromArrayObject: json!, self.masterSourceType)
        self.interface.hideLoader()
      } else {
        self.interface.presentAlert(withMessage: "Getting response error from server")
      }
    }
  }
}

extension SourceDataProvider: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return objects.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "GenericCell")
    guard let existingCell = cell else {
      let newCell = UITableViewCell(style: .default, reuseIdentifier: "GenericCell")
      newCell.textLabel?.text = objects[indexPath.row].title
      return newCell
    }
    
    existingCell.textLabel?.text = objects[indexPath.row].title
    return existingCell
  }
}
