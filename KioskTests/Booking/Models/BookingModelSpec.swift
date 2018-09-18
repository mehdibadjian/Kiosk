//
//  BookingModelSpec.swift
//  KioskTests
//
//  Created by Mehdi on 17/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import Quick
import Nimble
@testable import Kiosk

class BookingModelSpec: QuickSpec {
  override func spec() {
    describe("Booking Model") {
      var bookingModel: BookingModel!
      
      beforeEach {
        bookingModel = BookingModel(productId: 0, name: "name", cost: 10.0, quantity: 2)
      }
      
      it("has a product ID") {
        expect(bookingModel.productId).to(equal(0))
      }
      
      it("has a name") {
        expect(bookingModel.name).to(equal("name"))
      }
      
      it("has a cost") {
        expect(bookingModel.cost).to(equal(10.0))
      }
      
      it("has a quantity") {
        expect(bookingModel.quantity).to(equal(2))
      }
    }
  }
}
