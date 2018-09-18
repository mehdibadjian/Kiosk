//
//  ConfirmationModel.swift
//  Kiosk
//
//  Created by Mehdi on 18/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//


struct ExtraService : Codable {
  var name : String?
  var serviceId : Int?
  var quantity : Int?
  var price : Float?
  
  enum CodingKeys: String, CodingKey {
    case name
    case serviceId = "id"
    case quantity
    case price
  }
}

class ConfirmationModel: Codable {
  var creationDate : String?
  var totalPrice: String?
  var bookingType : String?
  var bookingId : Float?
  var extraServices : [ExtraService]? = []
  
  enum CodingKeys: String, CodingKey {
    case creationDate = "issued_date_time"
    case totalPrice = "total_price"
    case bookingType = "booking_type"
    case bookingId = "id"
    case extraServices = "extra_services"
  }
}
