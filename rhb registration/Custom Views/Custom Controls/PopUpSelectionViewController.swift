//
//  PopUpSelectionViewController.swift
//  rhb registration
//
//  Created by Ghean Ginanjar on 02/10/18.
//  Copyright © 2018 RHB TradeSmart. All rights reserved.
//

import UIKit

class PopUpSelectionViewController: UIViewController {

  @IBOutlet weak var contentView: UIView!
  @IBOutlet weak var headerLabel: UILabel!
  
  @IBOutlet weak var containerView: UIView!
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupLayout()
    setupListener()
  }
  
  fileprivate func setupListener() {
    tableView.delegate = self
    tableView.dataSource = self
    
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissView))
    contentView.addGestureRecognizer(tapGesture)
  }
  
  fileprivate func setupLayout() {
    self.containerView.layer.cornerRadius = 14
  }
  
  @IBAction func cancelDidTapped(_ sender: Any) {
    dismissView()
  }
  
  @objc fileprivate func dismissView() {
    self.dismiss(animated: false, completion: nil)
  }
}

extension PopUpSelectionViewController: UITableViewDelegate, UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
}
