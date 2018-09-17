//
//  BookingConfirmationTableViewCell.swift
//  Kiosk
//
//  Created by Mehdi on 17/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

class BookingConfirmationTableViewCell: UITableViewCell {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var descLabel: UILabel!

  static var identifier: String {
    return String(describing: self)
  }
}

