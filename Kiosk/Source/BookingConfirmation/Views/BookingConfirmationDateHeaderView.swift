//
//  BookingConfirmationDateHeader.swift
//  Kiosk
//
//  Created by Mehdi on 17/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

protocol BookingConfirmationDateHeaderViewDelegate {
  func selectDateSelected()
}

class BookingConfirmationDateHeaderView: UITableViewHeaderFooterView {
  var headerLabel : UILabel?
  var dateLabel : UILabel?
  var delegate : BookingConfirmationDateHeaderViewDelegate?
  
  override init(reuseIdentifier: String?) {
    super.init(reuseIdentifier: reuseIdentifier)
  }
  static var identifier: String {
    return String(describing: self)
  }
  
  var cell : UITableViewCell? {
    willSet {
      cell?.removeFromSuperview()
    }
    didSet {
      cell = UITableViewCell()
      if let cell = cell {
        cell.frame = self.bounds
        cell.autoresizingMask = [UIViewAutoresizing.flexibleHeight, UIViewAutoresizing.flexibleWidth]
        self.contentView.backgroundColor = .white
        self.contentView .addSubview(cell)
        self.configureView()
      }
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configureView() {
    if self.headerLabel == nil {
      //user interaction enable
      self.isUserInteractionEnabled = true
      let tap = UITapGestureRecognizer(target: self, action: #selector(headerTapped))
      tap.numberOfTapsRequired = 1
      self.addGestureRecognizer(tap)
      
      //ui component setup
      self.headerLabel = UILabel()
      self.headerLabel?.font = UIFont.boldSystemFont(ofSize: 15)
      self.headerLabel?.minimumScaleFactor = 0.7;
      self.headerLabel?.adjustsFontSizeToFitWidth = true;
      self.headerLabel?.textColor = .black
      self.headerLabel?.textAlignment = NSTextAlignment.left
      self.addSubview(self.headerLabel!)
      
      self.dateLabel = UILabel()
      self.dateLabel?.font = UIFont.boldSystemFont(ofSize: 15)
      self.dateLabel?.minimumScaleFactor = 0.7;
      self.dateLabel?.adjustsFontSizeToFitWidth = true;
      self.dateLabel?.textColor = .black
      self.dateLabel?.textAlignment = NSTextAlignment.right
      self.addSubview(self.dateLabel!)
    }
    //setup constraints
    self.headerLabel!.translatesAutoresizingMaskIntoConstraints = false
    self.headerLabel?.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
    self.headerLabel?.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    self.headerLabel?.heightAnchor.constraint(greaterThanOrEqualToConstant: 40).isActive = true
    self.headerLabel?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
    self.headerLabel?.trailingAnchor.constraint(equalTo: (self.dateLabel?.leadingAnchor)!, constant: -20).isActive = true
    
    self.dateLabel!.translatesAutoresizingMaskIntoConstraints = false
    self.dateLabel?.centerYAnchor.constraint(equalTo: self.headerLabel!.centerYAnchor).isActive = true
    self.dateLabel?.heightAnchor.constraint(greaterThanOrEqualToConstant: 60).isActive = true
    self.dateLabel?.leadingAnchor.constraint(equalTo: (self.headerLabel?.trailingAnchor)!, constant: 20).isActive = true
    self.dateLabel?.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
  }
  @objc func headerTapped() {
    self.delegate?.selectDateSelected()
  }
}
