//
//  PriceCalculator.swift
//  Kiosk
//
//  Created by Mehdi on 16/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

class PriceCalculator: NSObject {
  func CalculatePriceWithObject(objects: [ServicesJsonModel]) -> CGFloat {
    var price : CGFloat = 0.0
    for object in objects {
      if let quantity = object.productQuantity {
        price = price + CGFloat(object.productPrice! * quantity)
      }
    }
    return price
  }
}
