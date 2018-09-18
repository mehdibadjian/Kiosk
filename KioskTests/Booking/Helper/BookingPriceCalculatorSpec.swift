//
//  BookingPriceCalculatorSpec.swift
//  KioskTests
//
//  Created by Mehdi on 18/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import Quick
import Nimble
@testable import Kiosk
class BookingPriceCalculatorSpec: QuickSpec {
  override func spec() {
    describe("Price Calculator") {
      var priceCalculator : PriceCalculator!
      
      beforeEach {
        priceCalculator = PriceCalculator()
      }
      
      it("is a valid object") {
        expect(priceCalculator).notTo(beNil())
      }
      
      it("calculated price correctly") {
        expect(priceCalculator.CalculatePriceWithObject(objects: [BookingModel(productId: 0, name: "name", cost: 10.0, quantity: 10)])).to(equal(100.0))
      }
    }
  }
}
