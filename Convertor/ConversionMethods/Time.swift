//
//  Time.swift
//  Convertor
//
//  Created by JFJ on 11/01/2020.
//  Copyright © 2020 JFJ. All rights reserved.
//

import Foundation

enum Time: Conversion {
    typealias SecondType = Time
    
    case second
    case hour
    case day
    
    init?(from value: String) {
        switch value {
        case "second":
            self = .second
        case "hour":
            self = .hour
        case "day":
            self = .day
        default:
            return nil
        }
    }
    
    func convert(input: String, second: Time) -> Double? {
        guard let time = Int(input) else {
            return nil
        }
        switch (self, second) {
        case (.second, .second), (.hour, .hour), (.day, .day):
            return Double(time)
        case (.day, .second):
            return Double(time * 86400)
        case (.day, .hour):
            return Double(time * 24)
        case (.hour, .second):
            return Double(time * 3600)
        case (.hour, .day):
            return Double(time / 24)
        case (.second, .hour):
            return Double(time / 3600)
        case (.second, .day):
            return Double(time / 86400)
        }
    }
}
