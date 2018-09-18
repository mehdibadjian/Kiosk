//
//  ConfirmationConvertor.swift
//  Kiosk
//
//  Created by Mehdi on 18/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

class ConfirmationAdaptor: ConfirmationConversionProtocol {
  func convertBookingModelToConfirmationModel(models: [BookingModel]) -> ConfirmationModel {
    let confirmationModel : ConfirmationModel! = ConfirmationModel()
    confirmationModel.bookingType = "express"
    confirmationModel.creationDate = "Not Selected"
    let extraServices : [ExtraService]? = []
    confirmationModel.extraServices = extraServices
    for model in models {
      var extraService = ExtraService()
      extraService.price = model.cost
      extraService.quantity = model.quantity
      extraService.name = model.name
      extraService.serviceId = model.productId
      confirmationModel.extraServices?.append(extraService)
    }
    return confirmationModel
  }
}
