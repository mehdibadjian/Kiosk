//
//  BookingConvertor.swift
//  Kiosk
//
//  Created by Mehdi on 18/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

class BookingConvertor : BookingConversionProtocol {
  func convertServicesModelToBookingModel(models: [ServiceModel]) -> [BookingModel] {
    var bookingModels : [BookingModel]! = []
    for model in models {
      var bookingModel : BookingModel! = BookingModel()
      bookingModel.cost = model.cost
      bookingModel.quantity = 0
      bookingModel.name = model.name
      bookingModel.productId = model.productId
      bookingModels.append(bookingModel)
    }
    return bookingModels
  }
}
