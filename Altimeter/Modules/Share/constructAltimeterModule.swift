//
//  AltimeterBuilder.swift
//  Altimeter
//
//  Created by Devank on 13/06/24.
//

import Foundation

class constructAltimeterModule {
    static func generateAltimeterModule(locationData: (latitude: String, longitude: String, altitude: String), address: String?) -> AltimetrInformationVC {
        let altimeterVC = AltimetrInformationVC()
        altimeterVC.locationData = locationData
        altimeterVC.address = address
        return altimeterVC
    }
}
