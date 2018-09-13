//
//  ServicesJsonModel.swift
//  Kiosk
//
//  Created by Mehdi on 13/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

class ServicesJsonModel: Codable {
  let id : Int?
  let product_name: String?
  let price : Int?
  
  enum CodingKeys: String, CodingKey {
    case id = "productId"
    case product_name = "productName"
    case price = "productPrice"
  }
}
