//
//  AlertControllerHelper.swift
//  Kiosk
//
//  Created by Mehdi on 15/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

class AlertControllerHelper: NSObject {

  func showAlertWithDatePicker(viewController : UIViewController, completionHandler: @escaping (Date?) -> ()) {
    let alertController = UIAlertController(title: "Pickup date", message: "Choose your desired date", preferredStyle: .actionSheet)
    let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 40, width: viewController.view.frame.size.width-20, height: 270))
    datePicker.datePickerMode = .dateAndTime
    alertController.view.addSubview(datePicker)
    let action1 = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
      let currentDate = datePicker.date
      completionHandler(currentDate)
    }
    let action2 = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
      completionHandler(nil)
    }
    alertController.addAction(action1)
    alertController.addAction(action2)
    let height:NSLayoutConstraint = NSLayoutConstraint(item: alertController.view, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 410)
    alertController.view.addConstraint(height);
    viewController.present(alertController, animated: true, completion: nil)
  }
  
  func showAlertWithNumberPicker(viewController : UIViewController) {
    
  }
  
}
