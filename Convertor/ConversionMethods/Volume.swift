//
//  Volume.swift
//  Convertor
//
//  Created by JFJ on 11/01/2020.
//  Copyright © 2020 JFJ. All rights reserved.
//

import Foundation

enum Volume: Conversion {
    typealias SecondType = Volume
    
    case milliliters
    case liters
    case cups
    case pints
    case galoon
    
   init?(from value: String) {
        switch value {
        case "ml":
            self = .milliliters
        case "l":
            self = .liters
        case "cups":
            self = .cups
        case "pints":
            self = .pints
        case "galoon":
            self = .galoon
        default:
            return nil
        }
    }
    
    func convert(input: String, second: Volume) -> Double? {
         guard let volume = Double(input) else {
             return nil
         }
         switch (self, second) {
         case (.milliliters, .milliliters), (.liters, .liters), (.cups, .cups), (.pints, .pints), (.galoon, .galoon):
             return volume
         
         case (.galoon, .milliliters):
            return volume * 3785.412
         case (.galoon, .liters):
            return volume * 3.785
         case (.galoon, .cups):
            return volume * 16
         case (.galoon, .pints):
            return volume * 8
         case (.pints, .milliliters):
            return volume * 473.176
         case (.pints, .liters):
            return volume / 2.113
         case (.pints, .cups):
            return volume * 2
         case (.pints, .galoon):
            return volume / 8
         case (.cups, .milliliters):
            return volume * 236.588
         case (.cups, .liters):
            return volume / 4.227
         case (.cups, .pints):
            return volume / 2
         case (.cups, .galoon):
            return volume / 16
         case (.liters, .milliliters):
            return volume * 1000
         case (.liters, .cups):
            return volume * 4.227
         case (.liters, .pints):
            return volume * 2.113
         case (.liters, .galoon):
            return volume / 3.785
         case (.milliliters, .liters):
            return volume / 1000
         case (.milliliters, .cups):
            return volume / 236.588
         case (.milliliters, .pints):
            return volume / 473.176
         case (.milliliters, .galoon):
            return volume / 3785.412
        }
     }
}
