//
//  ConfirmationRepository.swift
//  Kiosk
//
//  Created by Mehdi on 18/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

class ConfirmationRepository : ConfirmationRepositoryProtocol {
  func postBookingConfirmation(model: ConfirmationModel, completion: @escaping (Error?) -> ()) {
    APIAdaptor().post(urlString: "history", model) { (response, data, error) in
      if let err = error {
        completion(err)
      }
    }
  }
}
