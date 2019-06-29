//
//  ShouldBuyCar.swift
//  Car
//
//  Created by Sam Meech-Ward on 2018-01-22.
//  Copyright © 2018 lighthouse-labs. All rights reserved.
//

import Foundation

class CarBuyer {
  
  func shouldBuy(car: Car) -> Bool {
    if let type = car.type, type.lowercased() == "hatchback" {
      return false
    }
    
    if let color = car.color, color.lowercased() == "pink" {
      return true
    }
    
    guard let litresPer100km = car.litresPer100km else {
      return false
    }
    guard let price = car.price else {
      return false
    }
    
    let goodLitres = litresPer100km >= 6 && litresPer100km <= 11
    let goodPrice = price <= 5000
    
    if goodLitres && goodPrice {
      return true
    }
    
    return false
  }
  
}
