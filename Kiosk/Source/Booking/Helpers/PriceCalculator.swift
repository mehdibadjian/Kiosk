//
//  PriceCalculator.swift
//  Kiosk
//
//  Created by Mehdi on 16/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

class PriceCalculator: NSObject {
  func CalculatePriceWithObject(objects: [BookingModel]) -> CGFloat {
    var price : CGFloat = 0.0
    for object in objects {
      if let quantity = object.quantity {
        price = price + CGFloat(object.cost! * Float(quantity))
      }
    }
    return price
  }
}
