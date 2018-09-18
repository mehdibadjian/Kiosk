//
//  ServiceRepositorySpec.swift
//  KioskTests
//
//  Created by Mehdi on 17/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import Quick
import Nimble
import Mockingjay

@testable import Kiosk

class ServicesRepositorySpec: QuickSpec {
  override func spec() {
    describe("Services Respository") {
      var repository: ServicesRepository!
      
      beforeEach {
        repository = ServicesRepository()
        let body = [["id": 1,"product_name": "Manpower","price": 60]]
        self.stub(http(.get, uri: "/services"), json(body))
      }
      
      it("retrieves services") {
        var services: [ServiceModel]?
        
        repository.getServices(completion: { (s) in
          services = s
        })
        
        expect(services?.count).toEventually(equal(1))
        expect(services?.first?.name).toEventually(equal("Manpower"))
        expect(services?.first?.productId).toEventually(equal(1))
        expect(services?.first?.cost).toEventually(equal(60))
      }
    }
  }
}
