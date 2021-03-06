//
//  ServicesJsonModel.swift
//  Kiosk
//
//  Created by Mehdi on 13/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

class ServicesJsonModel: Codable {
  var productId : Float?
  var productName: String?
  var productPrice : Float?
  var productQuantity: Float?
}

extension ServicesJsonModel {
  enum CodingKeys: String, CodingKey {
    case productId = "id"
    case productName = "product_name"
    case productPrice = "price"
  }
}
