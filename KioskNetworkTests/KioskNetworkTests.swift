//
//  KioskNetworkTests.swift
//  KioskNetworkTests
//
//  Created by Mehdi on 14/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import XCTest
@testable import Kiosk

var apiAdaptor : APIAdaptor?
class KioskNetworkTests: XCTestCase {
  override func setUp() {
    super.setUp()
    apiAdaptor = APIAdaptor()
  }
  
  override func tearDown() {
    super.tearDown()
    apiAdaptor = nil
  }
  
  func testGet() {
    let url = "services"
    let promise = expectation(description: "Success Completion Handlers")
    var urlError : Error?
    var statusCode : Int?
    
    apiAdaptor?.get(urlString: url, completionHandler: { (response, dara, error) in
      urlError = error
      statusCode = (response as? HTTPURLResponse)?.statusCode
      promise.fulfill()
    })
    waitForExpectations(timeout: 5) { (error) in
      if let err = error {
        XCTFail("Failed \(err.localizedDescription)")
      }
    }
    XCTAssertNil(urlError)
    XCTAssertEqual(statusCode, 200, "Status code is not 200")
  }
  
  func testPost() {

  }
}

