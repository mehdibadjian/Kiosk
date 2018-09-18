//
//  ConfirmationUseCase.swift
//  Kiosk
//
//  Created by Mehdi on 18/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

protocol ConfirmationRepositoryProtocol {
  func postBookingConfirmation(model:ConfirmationModel, completion: @escaping (Error?) -> ())
}

class ConfirmationUseCase {
  var apiService: ConfirmationRepositoryProtocol!
  var model: ConfirmationModel
  init(apiService: ConfirmationRepositoryProtocol, model : ConfirmationModel) {
    self.apiService = apiService
    self.model = model
  }
  
  func bookingConfirmation(completion: @escaping (Error?) -> ()) {
    apiService.postBookingConfirmation(model: self.model) { (error) in
      completion(error)
    }
  }

}
