//
//  ServiceModel.swift
//  Kiosk
//
//  Created by Mehdi on 17/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

struct ServiceModel: Decodable {
  var productId: Int?
  var name: String?
  var cost: Float?
}

extension ServiceModel {
  enum CodingKeys: String, CodingKey {
    case productId = "id"
    case name = "product_name"
    case cost = "price"
  }
}
