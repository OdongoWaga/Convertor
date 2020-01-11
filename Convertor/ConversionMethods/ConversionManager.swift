//
//  ConversionManager.swift
//  Convertor
//
//  Created by JFJ on 11/01/2020.
//  Copyright © 2020 JFJ. All rights reserved.
//

import Foundation

protocol Conversion {
    associatedtype SecondType
    func convert(input: String, second: SecondType) -> Double?
}

enum ConversionManager: String {
    case temperature = "Temperature"
    case lenght = "Lenght"
    case time = "Time"
    case volume = "Volume"
    
    var units: [String] {
        switch self {
        case .temperature:
            return ["ºC", "ºF", "K"]
        case .lenght:
            return ["km", "m", "ft", "yd", "miles"]
        case .time:
            return ["second", "hour", "day"]
        case .volume:
            return ["ml", "l", "cups", "pints", "galoon"]
        }
    }
    
    func convert(inputUnit: String, outputUnit: String, value: String) -> String? {
        switch self {
        case .temperature:
            let t1 = Temperature(from: inputUnit)
            let t2 = Temperature(from: outputUnit)
            if let t1 = t1, let t2 = t2 {
                guard let result = t1.convert(input: value, second: t2) else { return nil}
                return String(result)
            } else { return nil }
        case .lenght:
            let l1 = Length(from: inputUnit)
            let l2 = Length(from: outputUnit)
            if let l1 = l1, let l2 = l2 {
                guard let result = l1.convert(input: value, second: l2) else { return nil}
                return String(result)
            } else { return nil }
        case .time:
            let t1 = Time(from: inputUnit)
            let t2 = Time(from: outputUnit)
            if let t1 = t1, let t2 = t2 {
                guard let result = t1.convert(input: value, second: t2) else { return nil}
                return String(result)
            } else { return nil }
        case .volume:
            let v1 = Volume(from: inputUnit)
            let v2 = Volume(from: outputUnit)
            if let v1 = v1, let v2 = v2 {
                guard let result = v1.convert(input: value, second: v2) else { return nil}
                return String(result)
            } else { return nil }
        }
    }
}
