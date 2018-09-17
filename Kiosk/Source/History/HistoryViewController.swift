//
//  HistoryViewController.swift
//  Kiosk
//
//  Created by Mehdi on 13/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  var dataModel : HistoryDataModel?
  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureView()
    self.dataModel = HistoryDataModel()
  }
  override func viewWillAppear(_ animated: Bool) {
    //Update history model
    self.dataModel!.fetchHistoryServices { (model, error) in
      if error != nil {
        //handle error
      }
      else {
        //reload tableview on main thread
        DispatchQueue.main.async {
          self.tableView.reloadData()
        }
      }
    }
  }
  func configureView() {
    self.title = "History"
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.tableView.separatorStyle = .none
    //tegister custom cell nib to tableview
    let nib = UINib(nibName: HistoryTableViewCell.identifier, bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: HistoryTableViewCell.identifier)
  }
}

extension HistoryViewController : UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return self.dataModel!.numberOfSections()
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.dataModel!.numberOfRowForSection(section: section)
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell:HistoryTableViewCell? = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as? HistoryTableViewCell
    let data = self.dataModel!.objectAtIndex(index: indexPath)
    cell?.amountTitleValue.text = "RM \(data.totalPrice ?? "0")"
    cell?.dateLabel.text = data.creationDate
    cell?.typeLabel.text = "express"
    return cell!
  }
}

extension HistoryViewController : UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 132
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
