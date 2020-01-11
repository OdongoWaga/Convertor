//
//  Temperature.swift
//  Convertor
//
//  Created by JFJ on 11/01/2020.
//  Copyright © 2020 JFJ. All rights reserved.
//


import Foundation

enum Temperature: Conversion {
    public typealias SecondType = Temperature
    
    case celsius
    case fahrenheit
    case kelvin
    
    init?(from value: String) {
        switch value {
        case "ºC":
            self = .celsius
        case "ºF":
            self = .fahrenheit
        case "K":
            self = .kelvin
        default:
            return nil
        }
    }

    
    func convert(input: String, second: Temperature) -> Double? {
        guard let temperature = Double(input) else {
            return nil
        }
        switch (self, second) {
        case (.celsius, .celsius), (.fahrenheit, .fahrenheit), (.kelvin, .kelvin):
            return temperature
        case (.kelvin, .celsius):
            return temperature - 273
        case (.kelvin, .fahrenheit):
            return (temperature - 273.15) * (9/5) + 32
        case (.fahrenheit, .celsius):
            return (temperature - 32) * (5/9)
        case (.fahrenheit, .kelvin):
            return (temperature - 32) * (5/9) + 273.15
        case (.celsius, .fahrenheit):
            return (temperature * (9/5)) + 32
        case (.celsius, .kelvin):
            return temperature + 273
        }
    }
}
