//
//  ServiceRepository.swift
//  Kiosk
//
//  Created by Mehdi on 17/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import Foundation

class ServicesRepository: ServicesRepositoryProtocol {
  func getServices(completion: @escaping ([ServiceModel]) -> ()) {
    APIAdaptor().get(urlString: "services") { (response, data, error) in
      do {
        let decoder = JSONDecoder()
        let services = try decoder.decode([ServiceModel].self, from: data!)
        completion(services)
      } catch {
        completion([])
      }
    }
  }
}
