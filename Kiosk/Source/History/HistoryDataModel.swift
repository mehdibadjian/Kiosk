//
//  HistoryDataModel.swift
//  Kiosk
//
//  Created by Mehdi on 14/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

class HistoryDataModel: NSObject {
  var model : [HistoryJsonModel]?
  var apiAdaptor = APIAdaptor()
  func fetchHistoryServices(completionHandler: @escaping ([HistoryJsonModel]?, Error?) -> ()) {
    self.apiAdaptor.get(urlString: "history", completionHandler: { (response, data, error) in
      if let err = error {
        completionHandler(nil,err)
      }
      else {
        do {
          let decoder = JSONDecoder()
          decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Custom)
          self.model = try decoder.decode([HistoryJsonModel].self, from:
            data!)
          completionHandler(self.model,error)
        }
        catch let err {
          completionHandler(nil,err)
        }
      }
    })
  }
  
  func storeOrderWithObject(object : HistoryJsonModel, completionHandler: @escaping (HistoryJsonModel?, Error?) -> ()) {
    self.apiAdaptor.post(urlString: "history", object) { (response, data, error) in
      if let err = error {
        completionHandler(nil,err)
      }
      else {
        do {
          let decoder = JSONDecoder()
          decoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Custom)
          let responseModel = try decoder.decode(HistoryJsonModel.self, from:
            data!)
          completionHandler(responseModel,error)
        }
        catch let err {
          completionHandler(nil,err)
        }
      }
    }
  }
  
  func numberOfSections() -> Int {
    return 1
  }
  
  func numberOfRowForSection(section: Int) -> Int {
    return self.model!.count
  }
}

extension DateFormatter {
  static let iso8601Custom: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM/yyyy"
    formatter.calendar = Calendar(identifier: .iso8601)
    return formatter
  }()
}
