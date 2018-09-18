//
//  ServiceViewModel.swift
//  Kiosk
//
//  Created by Mehdi on 18/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import Foundation

protocol BookingConversionProtocol {
  func convertServicesModelToBookingModel(models: [ServiceModel]) -> [BookingModel]
}

protocol ServiceViewModelDelegate {
  func modelUpdated()
}

class ServicesViewModel {
  var bookingModel : [BookingModel]?
  var protocolConversion: BookingConversionProtocol!
  var delegate: ServiceViewModelDelegate?
  
  init(protocolConversion: BookingConversionProtocol){
    self.protocolConversion = protocolConversion
    updateModel { (error) in
      if error == nil {
        self.delegate?.modelUpdated()
      }
    }
  }
  
  func numberOfRows() -> Int {
    return bookingModel == nil ? 0 : bookingModel!.count
  }
  
  func objectAtIndex(index: Int) -> BookingModel {
    return bookingModel![index]
  }
  
  func replaceCountAtIndex(index: Int, count: Int) {
    bookingModel![index].quantity = count
  }
  
  func convertProtocol(models: [ServiceModel]) {
    bookingModel = self.protocolConversion.convertServicesModelToBookingModel(models: models)
  }
  
  func updateModel(completion: @escaping (Error?)->()) {
    let servicesRespository = ServicesRepository()
    let servicesModel = ServicesUseCase(apiService: servicesRespository)
    servicesModel.services(completion: { [weak self] services in
      self!.convertProtocol(models: services)
      completion(nil)
    })
  }
}
