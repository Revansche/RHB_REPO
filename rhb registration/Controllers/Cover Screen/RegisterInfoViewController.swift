//
//  RegisterInfoViewController.swift
//  rhb registration
//
//  Created by Alam Yudi Aryanto on 19/06/18.
//  Copyright © 2018 Alam Yudi Aryanto. All rights reserved.
//

import UIKit

class RegisterInfoViewController: UIViewController {

    @IBOutlet weak var bottomRhbColorImage: UIImageView!    
    @IBOutlet weak var TnCLabel: MLOLabel!
    @IBOutlet weak var preRegisterSegment: RHBChoiceSegmentView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
        prepareMLOLabelDataSource()
        preRegisterSegment.delegate = self
    }
  
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.hideNavigationBar()
    }

    override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()        
    }
}

extension RegisterInfoViewController: RHBChoiceSegmentViewDelegate {
  func didTapLeftButton() {
    let preRegView = PreRegisterFormViewController()
    let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    navigationItem.backBarButtonItem = backButton
    self.navigationController?.pushViewController(preRegView, animated: true)
  }
  
  func didTapRightButton() {
    let loginView = RHBLoginViewController()    
    self.navigationController?.pushViewController(loginView, animated: true)
  }
}

//MARK: prepare for MLO datasource
extension RegisterInfoViewController{
  func prepareMLOLabelDataSource() {
    //Prepare primary text
    let mloText = MLOText(
      word: "by using this app, you are agreed with our Terms & Conditions",
      color: Colors.rhbMainBlue,
      font: UIFont.boldSystemFont(ofSize: 12)
    )
    let dataSource = MLOData(withMLOText: mloText)
    //Prepare for links
    let linkColor = UIColor(red: (233/255.0), green: (160/255.0), blue: (0/255.0), alpha: 1)
    let linkFont = UIFont.boldSystemFont(ofSize: 14)
    dataSource.appendLink(link: MLOLink(
      word: "Terms",
      color: linkColor,
      font: linkFont,
      link: "http://rhb.com"))
    dataSource.appendLink(link: MLOLink(
      word: "Conditions",
      color: linkColor,
      font: linkFont,
      link: "http://rhb.com"))
    TnCLabel.dataSource = dataSource
  }
}
