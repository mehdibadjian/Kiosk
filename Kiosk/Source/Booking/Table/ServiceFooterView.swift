//
//  ServiceFooterView.swift
//  Kiosk
//
//  Created by Mehdi on 16/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

class ServiceFooterView: UITableViewHeaderFooterView {
  var headerLabel : UILabel?
  var actionButton : UIButton?
  
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
    self.headerLabel = UILabel()
    self.headerLabel?.font = UIFont.boldSystemFont(ofSize: 15)
    self.headerLabel?.textColor = .black
    self.headerLabel?.textAlignment = NSTextAlignment.center
    self.headerLabel?.text = "Total price: RM 0"
    self.contentView.addSubview(self.headerLabel!)
    self.headerLabel?.isHidden = false
    
    self.actionButton = UIButton.init(frame: .zero)
    self.actionButton?.backgroundColor = .orange
    self.actionButton?.setTitleColor(.white, for: .normal)
    self.actionButton?.layer.cornerRadius = 10
    self.actionButton?.setTitle("Continue", for: .normal)
    self.contentView.addSubview(self.actionButton!)
    self.actionButton?.isHidden = false
    
    //setup constraints
    self.headerLabel!.translatesAutoresizingMaskIntoConstraints = false
    self.headerLabel?.bottomAnchor.constraint(
                                equalTo: self.actionButton!.topAnchor,
                                constant: -20).isActive = true
    self.headerLabel?.heightAnchor.constraint(greaterThanOrEqualToConstant: 60)
    self.headerLabel?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80).isActive = true
    self.headerLabel?.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80).isActive = true
    
    self.actionButton!.translatesAutoresizingMaskIntoConstraints = false
    self.actionButton?.bottomAnchor.constraint( equalTo: self.bottomAnchor, constant: -20).isActive = true
    self.actionButton?.heightAnchor.constraint(greaterThanOrEqualToConstant: 60)
    self.actionButton?.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 80).isActive = true
    self.actionButton?.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -80).isActive = true

  }
  
}
