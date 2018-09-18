//
//  ConfirmationViewModel.swift
//  Kiosk
//
//  Created by Mehdi on 18/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import Foundation

protocol ConfirmationConversionProtocol {
  func convertBookingModelToConfirmationModel(models: [BookingModel]) -> ConfirmationModel
}

class ConfirmationViewModel {
  var confirmationModel: ConfirmationModel?
  var protocolConversion: ConfirmationConversionProtocol!

  init(protocolConversion: ConfirmationConversionProtocol, bookingModel: [BookingModel]){
    self.protocolConversion = protocolConversion
    self.convertProtocol(models: bookingModel)
  }

  func numberOfRows(index: Int) -> Int {
    switch index {
    case 0:
      return 1
    default:
      return confirmationModel == nil ? 0 : confirmationModel!.extraServices!.count
    }
  }
  
  func objectAtIndex(index: IndexPath) -> Any? {
    switch index.section {
    case 0:
      return confirmationModel?.creationDate ?? nil
    default:
      return confirmationModel?.extraServices![index.row] ?? nil
    }
  }
  
  func updateDate(date: Date) {
    confirmationModel?.creationDate = DateFormatter.iso8601Custom.string(from: date)
  }
  
  func convertProtocol(models: [BookingModel]) {
    confirmationModel = self.protocolConversion.convertBookingModelToConfirmationModel(models: models)
  }
  
  func postConfirmation(model: ConfirmationModel, completion: @escaping (Error?) -> ()) {
    let confirmationRepository = ConfirmationRepository()
    let confirmationUseCase = ConfirmationUseCase(apiService: confirmationRepository, model: confirmationModel!)
    confirmationUseCase.bookingConfirmation { (error) in
      completion(error)
    }
  }
}
