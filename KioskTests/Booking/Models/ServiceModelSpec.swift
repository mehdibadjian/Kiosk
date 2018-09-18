//
//  ServiceModelSpec.swift
//  KioskTests
//
//  Created by Mehdi on 17/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import Quick
import Nimble
@testable import Kiosk

class ServiceModelSpec: QuickSpec {
  override func spec() {
    describe("Booking Model") {
      var model: ServiceModel!
    
      beforeEach {
        model = ServiceModel(productId: 0, name: "name", cost: 10.0)
      }
    
      it("has a product ID") {
        expect(model.productId).to(equal(0))
      }
    
      it("has a name") {
        expect(model.name).to(equal("name"))
      }
    
      it("has a cost") {
        expect(model.cost).to(equal(10.0))
      }
    }
  }
}
