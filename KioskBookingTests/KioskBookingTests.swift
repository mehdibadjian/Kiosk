//
//  KioskBookingTests.swift
//  KioskBookingTests
//
//  Created by Mehdi on 14/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import XCTest
@testable import Kiosk

var servicesDataModel : ServivesDataModel!

class KioskBookingTests: XCTestCase {
    
  override func setUp() {
    super.setUp()
    servicesDataModel = ServivesDataModel()
  }

  override func tearDown() {
    super.tearDown()
    servicesDataModel = nil
  }
  
  func testCallToFetchServices() {
    let promise = expectation(description: "Services API Call Completion Handler")
    var urlError : Error?
    var response : [ServicesJsonModel]?
    servicesDataModel.fetchBookingServices { (res, error) in
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
    XCTAssertEqual(response?.count, 5, "Count of objects are not 5")
  }
    
}
