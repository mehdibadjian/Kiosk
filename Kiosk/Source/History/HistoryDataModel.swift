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
  
  func numberOfSections() -> Int {
    return 1
  }
  
  func numberOfRowForSection(section: Int) -> Int {
    return self.model!.count
  }
}
