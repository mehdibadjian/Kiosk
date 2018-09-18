//
//  ServiceDomainModelSpec.swift
//  KioskTests
//
//  Created by Mehdi on 17/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import Quick
import Nimble
@testable import Kiosk

class ServicesUseCaseSpec: QuickSpec {
  override func spec() {
    describe("Service Domain Model") {
      var model: ServicesUseCase!
      
      beforeEach {
        model = ServicesUseCase(apiService: ServicesRepositoryMock())
      }
      
      it("returns a list of services") {
        var services: [ServiceModel]?
        
        model.services(completion: { s in
          services = s
        })
        
        expect(services?.count ?? 0).toEventually(equal(1))
        expect(services?.first?.name ?? "").toEventually(equal("name"))
      }
    }
  }
}

class ServicesRepositoryMock: ServicesRepositoryProtocol {
  func getServices(completion: @escaping ([ServiceModel]) -> ()) {
    completion([ServiceModel(productId: 0, name: "name", cost: 10.0)])
  }
}
