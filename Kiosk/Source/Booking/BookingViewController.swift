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
  var services: ServicesViewModel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.configureView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    let bookingConversion = BookingConvertor()
    services = ServicesViewModel(protocolConversion: bookingConversion)
    services?.delegate = self
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    let footer = self.tableView.footerView(forSection: 0) as? ServiceFooterView
    footer?.delegate = nil
  }
  
  func configureView() {
    self.title = "Booking"
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.tableView.separatorStyle = .singleLine
    //tegister custom cell nib to tableview
    let nib = UINib(nibName: BookingStepperTableViewCell.identifier, bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: BookingStepperTableViewCell.identifier)
    self.tableView.register(ServiceFooterView.self, forHeaderFooterViewReuseIdentifier: ServiceFooterView.identifier)
    self.view.addSubview(self.tableView)
  }
}

extension BookingViewController : UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return  services!.numberOfRows()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell:BookingStepperTableViewCell? = tableView.dequeueReusableCell(withIdentifier: BookingStepperTableViewCell.identifier, for: indexPath) as? BookingStepperTableViewCell
    cell?.stepperView.delegate = self;
    
    if let service = services?.objectAtIndex(index: indexPath.row) {
      cell?.titleLabel.text = service.name
      cell?.iconView.image = UIImage(named: "\(service.productId ?? 0).png")
    }
    
    cell?.stepperView.tag = indexPath.row
    cell?.stepperView.value = 0
    cell?.stepperView.valueLabel?.text = "0"
    
    return cell!
  }
}

extension BookingViewController : UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 48
  }
  
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 100
  }
  
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: ServiceFooterView.identifier) as! ServiceFooterView
    view.configureView()
    view.delegate = self
    return view;
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}

extension BookingViewController : StepperDelegate {
  func stepperUpdated(stepper: CustomStepper, value: CGFloat) {
//    self.dataModel!.replaceCountAtIndex(index: stepper.tag, count: Int(stepper.value))
    self.priceUpdate()
  }
  
  func priceUpdate() {
//    let price = PriceCalculator().CalculatePriceWithObject(objects: (self.dataModel?.model)!)
    let footer = self.tableView.footerView(forSection: 0) as! ServiceFooterView
//    self.tableView.beginUpdates()
    let price = 0
    footer.headerLabel?.text = "Total price: RM \(price)"
    self.tableView.endUpdates()
  }
}

extension BookingViewController : ServiceFooterViewDelegate {
  func btnConfirmSelected() {
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let confirmationVC = storyBoard.instantiateViewController(withIdentifier: "BookingConfirmationViewController") as! BookingConfirmationViewController
//    confirmationVC.dataModel = self.dataModel!
    confirmationVC.footer = self.tableView.footerView(forSection: 0) as? ServiceFooterView
    self.navigationController?.pushViewController(confirmationVC, animated: true)
  }
}

extension BookingViewController : ServiceViewModelDelegate {
  func modelUpdated() {
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }
}
