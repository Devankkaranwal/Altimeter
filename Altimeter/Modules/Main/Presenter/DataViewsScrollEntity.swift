//
//  DataViewsScrollEntity.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 03.12.2023.
//

import Foundation

//enum Map {
//    case coordinate
//    case address
//}

//
//enum Map {
//    /// Represents a coordinate data module with latitude and longitude.
//    case coordinate
//    /// Represents an address data module with a string address.
//    case address
//}


import Foundation

struct DataModules {
    /// An enumeration representing the types of data modules available.
    enum DataMapLocations {
        /// Represents a coordinate data module with latitude and longitude.
        case coordinate(latitude: Double, longitude: Double)
        /// Represents an address data module with a string address.
        case address(String)
    }
}
