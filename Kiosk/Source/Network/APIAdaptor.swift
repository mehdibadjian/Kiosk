//
//  APIAdaptor.swift
//  Kiosk
//
//  Created by Mehdi on 13/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

let baseUrl = "http://localhost:3000/"

class APIAdaptor: NSObject {
  func get(urlString: String, completionHandler: @escaping (URLResponse?, Data?, Error?) -> ()) {
    let url = URL(string: baseUrl+urlString)!
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
      if let error = error {
        completionHandler(nil,nil,error)
        return
      }
      if let response = response as? HTTPURLResponse,
        (200...299).contains(response.statusCode) {
        completionHandler(response,data,error)
      }
      else {
        completionHandler(response,data,error)
      }
    }
    task.resume()
  }
  
  func post(urlString: String, parameters: Encodable, completionHandler: @escaping (URLResponse?, Error?) -> ()) {
    let url = URL(string: baseUrl+urlString)!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    let jsonData = try? JSONSerialization.data(withJSONObject:parameters)
    let task = URLSession.shared.uploadTask(with: request, from: jsonData) { data, response, error in
      if let error = error {
        completionHandler(nil,error)
        return
      }
      if let response = response as? HTTPURLResponse,
        (200...299).contains(response.statusCode) {
        completionHandler(response,error)
      }
      else {
        completionHandler(response,error)
      }
    }
    task.resume()
  }
}
