//
//  LocationAxis.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 15.12.2023.
//


import Foundation

enum GeoCoordinate {
    case latitude
    case longitude
}



// Example usage
func processCoordinate(axis: GeoCoordinate) {
    switch axis {
    case .latitude:
        print("Processing latitude")
    case .longitude:
        print("Processing longitude")
    }
}


