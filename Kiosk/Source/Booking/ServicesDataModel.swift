//
//  ServivesDataModel.swift
//  Kiosk
//
//  Created by Mehdi on 14/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

class ServicesDataModel: NSObject {
  var model : [ServicesJsonModel]?
  
  func fetchBookingServices(completionHandler: @escaping ([ServicesJsonModel]?, Error?) -> ()) {
    APIAdaptor().get(urlString: "services") { (response, data, error) in
      if let err = error {
        completionHandler(nil,err)
      }
      else {
        do {
          let decoder = JSONDecoder()
         self.model = try decoder.decode([ServicesJsonModel].self, from:
            data!)
          completionHandler(self.model,error)
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
    return self.model == nil ? 0 : self.model!.count
  }
}

