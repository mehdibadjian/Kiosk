//
//  BookingConfirmationDataModel.swift
//  Kiosk
//
//  Created by Mehdi on 17/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

class BookingConfirmationDataModel: NSObject {
  func storeBookingServices(model:ServicesDataModel, completionHandler: @escaping (Error?) -> ()) {
    
    let request = HistoryJsonModel()
    request.creationDate = DateFormatter.iso8601Custom.string(from: Date.init(timeIntervalSinceNow: 0))
    request.bookingType = "express"
    request.totalPrice = "100"
    request.extraServices = []
    for data in model.model! {
      var service = ExtraService()
      service.name = data.productName
      service.price = data.productPrice
      service.quantity = data.productQuantity
      service.serviceId = data.productId
      request.extraServices?.append(service)
    }
    HistoryDataModel().storeOrderWithObject(object: request) { (res, error) in
      completionHandler(error)
    }
  }
}
