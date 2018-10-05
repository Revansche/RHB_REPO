//
//  PopUpSelectionViewController.swift
//  rhb registration
//
//  Created by Ghean Ginanjar on 02/10/18.
//  Copyright © 2018 RHB TradeSmart. All rights reserved.
//

import UIKit

protocol SelectionViewControllerDelegate: class {
  func SelectionView(_ selectionViewController: PopUpSelectionViewController, returnPickerModel pickerModel: PickerModel)
}

class PopUpSelectionViewController: UIViewController {

  @IBOutlet weak var contentView: UIView!
  @IBOutlet weak var headerLabel: UILabel!
  
  @IBOutlet weak var containerView: UIView!
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
  
  fileprivate unowned var dataProvider: SourceDataProvider
  fileprivate unowned var delegate: SelectionViewControllerDelegate
  fileprivate var headerTextValue: String = ""
  fileprivate let defaultHeightConstant = 400
  fileprivate let tableCellHeight = 50
  
  init(header: String, sourceDataProvider: SourceDataProvider, delegate: SelectionViewControllerDelegate) {
    dataProvider = sourceDataProvider
    headerTextValue = header
    self.delegate = delegate
    super.init(nibName: nil, bundle: Bundle(for: PopUpSelectionViewController.self))
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupLayout()
    setupListener()
  }
  
  fileprivate func setupListener() {
    tableView.delegate = self
    tableView.dataSource = dataProvider
    
//    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissView))
//    contentView.addGestureRecognizer(tapGesture)
  }
  
  fileprivate func setupLayout() {
    containerView.layer.cornerRadius = 14
    headerLabel.text = headerTextValue
    calculateTableContent()
  }
  
  fileprivate func calculateTableContent() {
    let estimatedTableHeight = tableCellHeight * dataProvider.objects.count
    let usedHeightValue = min(defaultHeightConstant, estimatedTableHeight)
    
    tableView.isScrollEnabled = estimatedTableHeight > defaultHeightConstant
    tableViewHeight.constant = CGFloat(usedHeightValue)
  }
  
  @IBAction func cancelDidTapped(_ sender: Any) {
    dismissView()
  }
  
  @objc fileprivate func dismissView() {
    self.dismiss(animated: false, completion: nil)
  }
}

extension PopUpSelectionViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return CGFloat(tableCellHeight)
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //Fetch the item
    let selectedItem = dataProvider.objects[indexPath.row]
    //Send it to VC
    delegate.SelectionView(self, returnPickerModel: selectedItem)
    //Dismiss self
    dismissView()
  }
}
