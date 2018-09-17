//
//  BookingConfirmationViewController.swift
//  Kiosk
//
//  Created by Mehdi on 16/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

class BookingConfirmationViewController: UIViewController {
  @IBOutlet weak var tableView: UITableView!
  var dataModel : ServicesDataModel?
  var footer : ServiceFooterView?
  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureView()
  }
  func configureView() {
    self.title = "Booking Confirmation"
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.tableView.separatorStyle = .singleLine
    //tegister custom cell nib to tableview
    let nib = UINib(nibName: BookingConfirmationTableViewCell.identifier, bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: BookingConfirmationTableViewCell.identifier)
    self.tableView.register(ServiceFooterView.self, forHeaderFooterViewReuseIdentifier: ServiceFooterView.identifier)
    self.tableView.register(BookingConfirmationDateHeaderView.self, forHeaderFooterViewReuseIdentifier: BookingConfirmationDateHeaderView.identifier)
    self.view.addSubview(self.tableView)
  }
}

extension BookingConfirmationViewController : UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return self.dataModel!.numberOfSections()
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.dataModel!.numberOfRowForSection(section: section)
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell:BookingConfirmationTableViewCell? = tableView.dequeueReusableCell(withIdentifier: BookingConfirmationTableViewCell.identifier, for: indexPath) as? BookingConfirmationTableViewCell
    let data = self.dataModel!.objectAtIndex(index: indexPath)
    cell?.titleLabel?.text = "\(data.productName!) x \(data.productQuantity == nil ? 0 : data.productQuantity!)"
    cell?.descLabel?.text = "RM \(data.productQuantity == nil ? 0 : data.productQuantity! * data.productPrice!)"
    return cell!
  }
}

extension BookingConfirmationViewController : UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 48
  }
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 100
  }
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    self.footer?.actionButton?.setTitle("Book", for: .normal)
    self.footer?.delegate = self;
    return self.footer;
  }
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 40
  }
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: BookingConfirmationDateHeaderView.identifier) as! BookingConfirmationDateHeaderView
    view.configureView()
    view.headerLabel?.text = "Select prefered date"
    view.dateLabel?.text = "Date not selected"
    view.delegate = self
    return view;
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}

extension BookingConfirmationViewController : ServiceFooterViewDelegate {
  func btnConfirmSelected() {
    BookingConfirmationDataModel().storeBookingServices(model: self.dataModel!) { (error) in
      if error != nil {
        //error handle
      }
      else {
        DispatchQueue.main.async {
          self.navigationController?.popToRootViewController(animated: true)
        }
      }
    }
  }
}

extension BookingConfirmationViewController : BookingConfirmationDateHeaderViewDelegate {
  func selectDateSelected() {
    AlertControllerHelper().showAlertWithDatePicker(viewController: self) { (date) in
      (self.tableView.headerView(forSection: 0) as! BookingConfirmationDateHeaderView).dateLabel?.text = DateFormatter.iso8601Custom.string(from: date!)
    }
  }
}
