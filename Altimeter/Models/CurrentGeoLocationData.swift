//
//  CurrentGeoLocationData.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 01.12.2023.
//


import Foundation
import CoreLocation

//struct CurrentGeoLocationData {
//    let altitude: Double
//    let magnitude: Double
//    let dataSpeed: Double
//    let latitude: Double
//    let longitude: Double
//
//}


//import Foundation

/// Represents data for current geographical location.
struct CurrentGeoLocationData {
    /// Altitude in meters.
    let altitude: Double
    /// Magnitude of the geographical location.
    let magnitude: Double
    /// Speed of data related to the location.
    let dataSpeed: Double
    /// Latitude coordinate.
    let latitude: Double
    /// Longitude coordinate.
    let longitude: Double
    
    /// Initializes a new instance of CurrentGeoLocationData.
    /// - Parameters:
    ///   - altitude: Altitude in meters.
    ///   - magnitude: Magnitude of the geographical location.
    ///   - dataSpeed: Speed of data related to the location.
    ///   - latitude: Latitude coordinate.
    ///   - longitude: Longitude coordinate.
    init(altitude: Double, magnitude: Double, dataSpeed: Double, latitude: Double, longitude: Double) {
        self.altitude = altitude
        self.magnitude = magnitude
        self.dataSpeed = dataSpeed
        self.latitude = latitude
        self.longitude = longitude
    }
}

