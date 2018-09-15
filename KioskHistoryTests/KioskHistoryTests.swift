//
//  KioskHistoryTests.swift
//  KioskHistoryTests
//
//  Created by Mehdi on 14/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import XCTest
@testable import Kiosk

var historyDataModel : HistoryDataModel!

class KioskHistoryTests: XCTestCase {
  override func setUp() {
    super.setUp()
    historyDataModel = HistoryDataModel()
  }

  override func tearDown() {
    super.tearDown()
    historyDataModel = nil
  }
  
  func testCallToFetchHistory() {
    let promise = expectation(description: "History API Call Completion Handler")
    var urlError : Error?
    var response : [HistoryJsonModel]?
    historyDataModel.fetchHistoryServices { (res, error) in
      urlError = error
      response = res
      promise.fulfill()
    }
    waitForExpectations(timeout: 5) { (error) in
      if let err = error {
        XCTFail("Failed \(err.localizedDescription)")
      }
    }
    XCTAssertNil(urlError)
    XCTAssertNotEqual(response?.count, 0, "Count of objects is 0")
  }
  
  func testCallToStoreOrder() {
    let promise = expectation(description: "History API Call Completion Handler")
    var urlError : Error?
    var response : HistoryJsonModel?
    let request = HistoryJsonModel()
    request.creationDate = Date.init(timeIntervalSinceNow: 0)
    request.bookingType = "express"
    request.totalPrice = "100"
    var service = ExtraService()
    service.name = "test"
    service.price = 10
    service.quantity = 10
    service.serviceId = 1
    request.extraServices = [service]
    historyDataModel.storeOrderWithObject(object: request) { (res, error) in
      urlError = error
      response = res
      promise.fulfill()
    }
    waitForExpectations(timeout: 5) { (error) in
      if let err = error {
        XCTFail("Failed \(err.localizedDescription)")
      }
    }
    XCTAssertNil(urlError)
    XCTAssertNotEqual(response?.bookingId, nil, "Order failed to store")
  }
}
