//
//  HistoryTableViewCell.swift
//  Kiosk
//
//  Created by Mehdi on 17/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
  @IBOutlet weak var holderView: UIView!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var typeLabel: UILabel!
  @IBOutlet weak var amountTitlelabel: UILabel!
  @IBOutlet weak var amountTitleValue: UILabel!
  static var identifier: String {
    return String(describing: self)
  }
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
}
