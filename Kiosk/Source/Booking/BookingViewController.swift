//
//  BookingViewController.swift
//  Kiosk
//
//  Created by Mehdi on 13/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

class BookingViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  var dataModel : ServicesDataModel?
  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureView()
    self.dataModel = ServicesDataModel()
    //Update booking services model
    self.dataModel!.fetchBookingServices { (model, error) in
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
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.tableView.separatorStyle = .none
//    tableView.register(SubcategorySearchCollectionTableViewCell.self, forCellReuseIdentifier: SubcategorySearchCollectionTableViewCell.identifier)
//    self.tableView.register(HeaderView.self, forHeaderFooterViewReuseIdentifier: HeaderView.identifier)
    self.view.addSubview(self.tableView)
  }
}

extension BookingViewController : UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return self.dataModel!.numberOfSections()
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.dataModel!.numberOfRowForSection(section: section)
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
}

extension BookingViewController : UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 48
  }
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 0
  }
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    return UIView.init()
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
