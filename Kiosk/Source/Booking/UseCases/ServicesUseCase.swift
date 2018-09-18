//
//  ServiceDomainModel.swift
//  Kiosk
//
//  Created by Mehdi on 17/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

protocol ServicesRepositoryProtocol {
  func getServices(completion: @escaping ([ServiceModel]) -> ())
}

class ServicesUseCase {
  var apiService: ServicesRepositoryProtocol!
  
  init(apiService: ServicesRepositoryProtocol) {
    self.apiService = apiService
  }
  
  func services(completion: @escaping ([ServiceModel]) -> ()) {
    apiService.getServices { services in
      completion(services)
    }
  }
}
