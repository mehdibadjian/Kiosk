//
//  HistoryJSONModel.swift
//  Kiosk
//
//  Created by Mehdi on 14/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

class extraService : Codable {
  let name : String?
  let serviceId : Int?
  let quantity : Int?
  let price : Int?
  
  enum CodingKeys: String, CodingKey {
    case name
    case serviceId = "id"
    case quantity
    case price
  }
}

class HistoryJsonModel: Codable {
  let creationDate : Date? = nil
  let totalPrice: Int? = nil
  let bookingType : String? = nil
  let bookingId : Int? = nil
  let extraServices : [extraService]? = nil
  
  enum CodingKeys: String, CodingKey {
    case creationDate = "issued_date_time"
    case totalPrice = "total_price"
    case bookingType = "booking_type"
    case bookingId = "id"
  }
}
