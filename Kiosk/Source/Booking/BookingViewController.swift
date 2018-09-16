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
    self.title = "Booking"
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.tableView.separatorStyle = .singleLine
    //tegister custom cell nib to tableview
    let nib = UINib(nibName: "BookingStepperTableViewCell", bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: "BookingStepperTableViewCell")
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
    let cell:BookingStepperTableViewCell? = tableView.dequeueReusableCell(withIdentifier: BookingStepperTableViewCell.identifier, for: indexPath) as? BookingStepperTableViewCell
    let data = self.dataModel!.objectAtIndex(index: indexPath)
    cell?.titleLabel.text = data.productName!
    cell?.iconView.image = UIImage(named: String(data.productId!) + ".png")
    return cell!
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
