//
//  ServicesViewModelSpec.swift
//  KioskTests
//
//  Created by Mehdi on 18/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import Quick
import Nimble
@testable import Kiosk

class ServicesViewModelSpec: QuickSpec {
  override func spec() {
    describe("Services View Model") {
      var model : ServicesViewModel!
      
      beforeEach {
        let protocolMock: BookingConversionProtocolMock! = BookingConversionProtocolMock()
        model = ServicesViewModel(protocolConversion: protocolMock)
        model.bookingModel = protocolMock.convertServicesModelToBookingModel(models: [ServiceModel(productId: 0, name: "name", cost: 10.0)])
      }
  
      it("has a booking model") {
        expect(model.bookingModel).notTo(beNil())
      }

      it("has a booking model that has a product id") {
        expect(model.bookingModel?.first?.productId).to(equal(0))
      }

      it("has a booking model that has a product name") {
        expect(model.bookingModel?.first?.name).to(equal("name"))
      }

      it("has a booking model that has a product cost") {
        expect(model.bookingModel?.first?.cost).to(equal(10.0))
      }

      it("has a booking model that has a product quantity") {
        expect(model.bookingModel?.first?.quantity).to(equal(0))
      }

      it("returns number of rows") {
        expect(model.numberOfRows()).notTo(beNil())
      }

      it("returns object at index") {
        expect(model.objectAtIndex(index: 0)).to(beAnInstanceOf(BookingModel.self))
      }

      it("returns replace quantity at index") {
        model.replaceCountAtIndex(index: 0, count: 1)
        expect(model.bookingModel?.first?.quantity).to(equal(1))
      }
    }
  }
}

class BookingConversionProtocolMock: BookingConversionProtocol {
  func convertServicesModelToBookingModel(models: [ServiceModel]) -> [BookingModel] {
    var bookingModels : [BookingModel]! = []
    for model in models {
      var bookingModel : BookingModel! = BookingModel()
      bookingModel.cost = model.cost
      bookingModel.quantity = 0
      bookingModel.name = model.name
      bookingModel.productId = model.productId
      bookingModels.append(bookingModel)
    }
    return bookingModels
  }
}
