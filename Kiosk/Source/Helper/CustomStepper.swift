//
//  CustomStepper.swift
//  Kiosk
//
//  Created by Mehdi on 16/09/2018.
//  Copyright © 2018 Mehdi. All rights reserved.
//

import UIKit

class CustomStepper: UIStackView {
  var stepperDecrease : UIButton?
  var valueLabel : UILabel?
  var stepperIncrease : UIButton?
  
  @IBInspectable var maxValue: CGFloat = 100 {
    didSet {
      self.setState()
    }
  }
  @IBInspectable var minValue: CGFloat = 15 {
    didSet {
      self.setState()
    }
  }
  @IBInspectable public var value: CGFloat = 0 {
    didSet {
      if value > maxValue || value < minValue {
      } else if oldValue != value {
        self.setState()
      }
    }
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  required init(coder: NSCoder) {
    super.init(coder: coder)
    self.setupStepper()
  }
  func setupStepper() {
    //decrease btn
    stepperDecrease = UIButton()
    stepperDecrease?.backgroundColor = .clear
    //decrease btn label autolayout
    stepperDecrease?.translatesAutoresizingMaskIntoConstraints = false
    stepperDecrease?.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
    stepperDecrease?.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
    stepperDecrease?.setTitle("-", for: .normal)
    stepperDecrease?.setTitleColor(UIColor.darkGray, for: .normal)
    //corner radius setup
    stepperDecrease?.layer.cornerRadius = 10
    stepperDecrease?.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
    //border setup
    stepperDecrease?.layer.borderColor = UIColor.darkGray.cgColor
    stepperDecrease?.layer.borderWidth = 1
    stepperDecrease?.addTarget(self, action: #selector(decrease(_:)), for: [.touchUpInside, .touchCancel])
    self.addArrangedSubview(stepperDecrease!)
    
    //value label
    valueLabel = UILabel(frame: .zero)
    valueLabel?.font = UIFont.systemFont(ofSize: 12)
    valueLabel?.textColor = .black
    valueLabel?.lineBreakMode = .byWordWrapping
    valueLabel?.textAlignment = .center
    valueLabel?.numberOfLines = 1
    valueLabel?.text = "0";
    //border setup
    valueLabel?.layer.borderColor = UIColor.darkGray.cgColor
    valueLabel?.layer.borderWidth = 1
    //value label autolayout
    valueLabel?.translatesAutoresizingMaskIntoConstraints = false
    valueLabel?.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
    valueLabel?.widthAnchor.constraint(equalToConstant: 40.0).isActive = true
    self.addArrangedSubview(valueLabel!)
    
    //increase btn
    stepperIncrease = UIButton()
    stepperIncrease?.backgroundColor = .clear
    //increase btn label autolayout
    stepperIncrease?.translatesAutoresizingMaskIntoConstraints = false
    stepperIncrease?.heightAnchor.constraint(equalToConstant: 30.0).isActive = true
    stepperIncrease?.widthAnchor.constraint(equalToConstant: 30.0).isActive = true
    stepperIncrease?.setTitle("+", for: .normal)
    stepperIncrease?.setTitleColor(UIColor.darkGray, for: .normal)
    //corner radius setup
    stepperIncrease?.layer.cornerRadius = 10
    stepperIncrease?.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
    //border setup
    stepperIncrease?.layer.borderColor = UIColor.darkGray.cgColor
    stepperIncrease?.layer.borderWidth = 1
    stepperIncrease?.addTarget(self, action: #selector(increase(_:)), for: [.touchUpInside, .touchCancel])
    self.addArrangedSubview(stepperIncrease!)
  }
  private func setState() {
    if value >= maxValue {
      stepperIncrease?.isEnabled = false
      stepperIncrease?.alpha = 0.5
    } else if value <= minValue {
      stepperDecrease?.isEnabled = false
      stepperDecrease?.alpha = 0.5
    } else {
      stepperDecrease?.isEnabled = true
      stepperDecrease?.alpha = 1
      stepperIncrease?.isEnabled = true
      stepperIncrease?.alpha = 1
    }
  }
  @objc func decrease(_ sender: UIButton) {
    if value > minValue {
      value = value - 1
      valueLabel?.text = String(describing: value)
    }
  }
  @objc func increase(_ sender: UIButton) {
    if value < maxValue {
      value = value + 1
      valueLabel?.text = String(describing: value)
    }
  }
}
