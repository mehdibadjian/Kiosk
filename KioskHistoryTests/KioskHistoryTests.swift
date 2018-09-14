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
    HistoryDataModel().fetchHistoryServices { (res, error) in
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
    XCTAssertEqual(response?.count, 2, "Count of objects are not 2")
  }
}
