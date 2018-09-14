//
//  ServivesDataModel.swift
//  Kiosk
//
//  Created by Mehdi on 14/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

var model : [ServicesJsonModel]?

class ServivesDataModel: NSObject {
  func fetchBookingServices(completionHandler: @escaping ([ServicesJsonModel]?, Error?) -> ()) {
    APIAdaptor().get(urlString: "services") { (response, data, error) in
      if let err = error {
        completionHandler(nil,err)
      }
      else {
        do {
          let decoder = JSONDecoder()
          model = try decoder.decode([ServicesJsonModel].self, from:
            data!)
          completionHandler(model,error)
        }
        catch let err {
          completionHandler(nil,err)
        }
      }
    }
  }
  
  func numberOfSections() -> Int {
    return 2
  }
  
  func numberOfRowForSection(section: Int) -> Int {
    switch section {
    case 0:
      return 1
    default:
      return model!.count
    }
  }
}

