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
  var services: [BookingModel]?
  var dataModel: ConfirmationViewModel?
  var footer: ServiceFooterView?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.configureView()
    
    let bookingConversion = ConfirmationAdaptor()
    dataModel = ConfirmationViewModel(protocolConversion: bookingConversion, bookingModel: services!)
  }
  
  func configureView() {
    self.title = "Booking Confirmation"
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorStyle = .singleLine
    //tegister custom cell nib to tableview
    let nib = UINib(nibName: BookingConfirmationTableViewCell.identifier, bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: BookingConfirmationTableViewCell.identifier)
    tableView.register(ServiceFooterView.self, forHeaderFooterViewReuseIdentifier: ServiceFooterView.identifier)
    self.view.addSubview(tableView)
  }
}

extension BookingConfirmationViewController : UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataModel!.numberOfRows(index: section)
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell:BookingConfirmationTableViewCell? = tableView.dequeueReusableCell(withIdentifier: BookingConfirmationTableViewCell.identifier, for: indexPath) as? BookingConfirmationTableViewCell
    
    if let data = dataModel!.objectAtIndex(index: indexPath) as? ExtraService  {
      cell?.titleLabel?.text = "\(data.name!) x \(data.quantity == nil ? 0 : data.quantity!)"
      cell?.descLabel?.text = "RM \(data.quantity == nil ? 0 : Float(data.quantity!) * data.price!)"
    }
    else if let data = dataModel!.objectAtIndex(index: indexPath) as? String {
      cell?.titleLabel.text = "Selected Date"
      cell?.descLabel?.text = data
    }

    return cell!
  }
}

extension BookingConfirmationViewController : UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 48
  }
  
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    if section == 1 {
      return 100
    } else {
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    footer?.actionButton?.setTitle("Book", for: .normal)
    footer?.delegate = self;
    return footer;
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    if indexPath.section == 0 {
      AlertControllerHelper().showAlertWithDatePicker(viewController: self) { (date) in
        self.dataModel?.updateDate(date: date!)
        DispatchQueue.main.async {
          tableView.reloadData()
        }
      }
    }
  }
}

extension BookingConfirmationViewController : ServiceFooterViewDelegate {
  func btnConfirmSelected() {
    
    dataModel?.postConfirmation(model: (dataModel?.confirmationModel)!, completion: { (error) in
      if error != nil {
        //error handle
      }
      else {
        DispatchQueue.main.async {
          self.navigationController?.popViewController(animated: true)
        }
      }
    })
  }
}
