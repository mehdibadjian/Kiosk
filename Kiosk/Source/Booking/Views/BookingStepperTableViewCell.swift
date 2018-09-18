//
//  BookingStepperTableViewCell.swift
//  Kiosk
//
//  Created by Mehdi on 16/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

class BookingStepperTableViewCell: UITableViewCell {

  @IBOutlet weak var iconView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var stepperView: CustomStepper!
  
  static var identifier: String {
    return String(describing: self)
  }
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
}
