//
//  ServicesJsonModel.swift
//  Kiosk
//
//  Created by Mehdi on 13/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

class ServicesJsonModel: Codable {
  let productId : Int?
  let productName: String?
  let productPrice : Int?
  enum CodingKeys: String, CodingKey {
    case productId = "id"
    case productName = "product_name"
    case productPrice = "price"
  }
}

extension ServicesJsonModel {

}
