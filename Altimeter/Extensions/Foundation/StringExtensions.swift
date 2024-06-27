//
//  StringExtensions.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 19.12.2023.
//


import Foundation

typealias DataString = String

extension DataString {
    static func formattedPressureString(_ index: Int? = 2, _ pressure: Double) -> DataString {
        var result: DataString
        let roundedPressure = round(pressure * 100) / 100.0
        switch index {
        case 0:
            result = "\(roundedPressure) atm"
        case 1:
            result = "\(roundedPressure) psi"
        case 3:
            result = "\(roundedPressure) inHg"
        case 4:
            result = "\(roundedPressure) mmHg"
        default:
            result = "\(roundedPressure) kPA"
        }
        return result
    }
    
    static func formattedCoordinateString(index: Int? = 2, _ coord: Double, type: GeoCoordinate) -> DataString {
        var result: DataString
        let degrees = Int(coord)
        let minutes = Int((coord - Double(degrees)) * 60)
        let seconds = (coord - Double(degrees) - Double(minutes)/60) * 3600
        switch index {
        case 0:
            let formattedDegrees = String(format: "%02d", degrees)
            let formattedMinutes = String(format: "%02d", minutes)
            let formattedSeconds = String(format: "%.4f", seconds)
            switch type {
            case .latitude:
                result = "\(formattedDegrees)°\(formattedMinutes)′\(formattedSeconds)″\(degrees >= 0 ? "N" : "S")"
                return result
            case .longitude:
                result = "\(formattedDegrees)°\(formattedMinutes)′\(formattedSeconds)″\(degrees >= 0 ? "E" : "W")"
                return result
            }
        case 1:
            switch type {
            case .latitude:
                let direction = degrees >= 0 ? "N" : "S"
                return "\(degrees)°\(minutes).\(String(format: "%04d", Int(seconds)))'\(direction)"
            case .longitude:
                let direction = degrees >= 0 ? "E" : "W"
                return "\(degrees)°\(minutes).\(String(format: "%04d", Int(seconds)))'\(direction)"
            }
        default:
            let formattedCoord = String(format: "%06.5f", coord)
            switch type {
            case .latitude:
                result =  "\(formattedCoord)°\(degrees >= 0 ? "N" : "S")"
                return result
            case .longitude:
                result =  "\(formattedCoord)°\(degrees >= 0 ? "E" : "W")"
                return result
            }
        }
    }
}
