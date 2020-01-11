//
//  Length.swift
//  Convertor
//
//  Created by JFJ on 11/01/2020.
//  Copyright © 2020 JFJ. All rights reserved.
//

import Foundation

enum Length: Conversion {
    public typealias SecondType = Length
    
    case meters
    case kilometers
    case feet
    case yards
    case miles
    
    func convert(input: String, second: Length) -> Double? {
        guard let lenght = Double(input) else {
            return nil
        }
        switch (self, second) {
        case (.meters, .meters), (.kilometers, .kilometers), (.feet, .feet), (.yards, .yards), (.miles, .miles):
            return lenght
     
        case (.miles, .meters):
            return lenght * 1609.344
        case (.miles, .kilometers):
            return lenght * 1.609
        case (.miles, .feet):
            return lenght * 5280
        case (.miles, .yards):
            return lenght * 1760
        case (.yards, .meters):
            return lenght / 1.094
        case (.yards, .kilometers):
            return lenght / 1093.613
        case (.yards, .feet):
            return lenght * 3
        case (.yards, .miles):
            return lenght / 1760
        case (.feet, .meters):
            return lenght / 3.281
        case (.feet, .kilometers):
            return lenght / 3280.84
        case (.feet, .yards):
            return lenght / 3
        case (.feet, .miles):
            return lenght / 5280
        case (.kilometers, .meters):
            return lenght * 1000
        case (.kilometers, .feet):
            return lenght * 3280.84
        case (.kilometers, .yards):
            return lenght * 1093.613
        case (.kilometers, .miles):
            return lenght / 1.609
        case (.meters, .kilometers):
            return lenght / 1000
        case (.meters, .feet):
            return lenght * 3.281
        case (.meters, .yards):
            return lenght * 1.094
        case (.meters, .miles):
            return lenght / 1609.344
        }
    }
    
    init?(from value: String) {
        switch value {
        case "km":
            self = .kilometers
        case "m":
            self = .meters
        case "ft":
            self = .feet
        case "yd":
            self = .yards
        case "miles":
            self = .miles
        default:
            return nil
        }
    }
    
    
}
