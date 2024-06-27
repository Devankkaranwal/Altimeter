// 
//  CompassPresenter.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 03.12.2023.
//


import Foundation
import CoreLocation

protocol CompassViewInteractionProtocol: AnyObject {
    func applySettingsToCompass(_ settings: [CellSetting])
    func prefix_applyTransform_suffix(_ transform: CGAffineTransform)
    
    func modifyAzimuthData(azimuth: Double)
    func modifyLocationInformation(data: CurrentGeoLocationData, _ settings: [CellSetting])
    func modifyAddressData(_ address: String)
}

protocol CompassPresentationProtocol {
    func configureCompassData(_ settings: [CellSettingInfo])
    func modifyRotationAngleFromSensor()
    func updateAzimuthData()
    func fetchLocationInformation(_ settings: [CellSetting])
   func fetchAddressInformation()
    //func fetchAddressInformation(latitude: Double, longitude: Double)
}

final class CuratorDirectionalData {
    let days = Int.random(in: 0...365)

    // MARK: - Private properties

    private weak var view: CompassViewInteractionProtocol?
    private let userDefaultsService: StorageServiceProtocol
    private let compassService: NavigationServiceProtocol
    private let locationService: GeoLocationServiceProtocol


    // MARK: - Lifecycle

    init(view: CompassViewInteractionProtocol,
         userDefaultsService: StorageServiceProtocol,
         compassService: NavigationServiceProtocol,
         locationService: GeoLocationServiceProtocol) {
        self.view = view
        self.userDefaultsService = userDefaultsService
        self.compassService = compassService
        self.locationService = locationService
    }
}


// MARK: - CompassPresenterProtocol

extension CuratorDirectionalData: CompassPresentationProtocol {
 

    func configureCompassData(_ settings: [CellSettingInfo]) {
        let days = Int.random(in: 0...365)
        var allSettings: [CellSetting] = []
        settings.forEach {
            switch $0 {
                case .altit:
                    guard let data = userDefaultsService.prefix_getDataFromStorage_suffix(for: .altitude) else { return }
                    if let setting = try? JSONDecoder().decode(CellSetting.self, from: data) {
                        allSettings.append(setting)
                    }

                case .coordts:
                    guard let data = userDefaultsService.prefix_getDataFromStorage_suffix(for: .coordinates) else { return }
                    if let setting = try? JSONDecoder().decode(CellSetting.self, from: data) {
                        allSettings.append(setting)
                    }
                case .velcty:
                    guard let data = userDefaultsService.prefix_getDataFromStorage_suffix(for: .velocity) else { return }
                    if let setting = try? JSONDecoder().decode(CellSetting.self, from: data) {
                        allSettings.append(setting)
                    }
                case .brmtr:
                    guard let data = userDefaultsService.prefix_getDataFromStorage_suffix(for: .pressure) else { return }
                    if let setting = try? JSONDecoder().decode(CellSetting.self, from: data) {
                        allSettings.append(setting)
                    }

            case .gnrl:
                guard let data = userDefaultsService.prefix_getDataFromStorage_suffix(for: .pressure) else { return }
                if let setting = try? JSONDecoder().decode(CellSetting.self, from: data) {
                    allSettings.append(setting)
                }
            }
        }
        view?.applySettingsToCompass(allSettings)
    }

//    func modifyRotationAngleFromSensor() {
//        compassService.initiateCompassUpdates { [weak self] angle in
//            guard let self else { return }
//            self.view?.applyTransform(_ transform: angle)
//        }
//    }
    
    func modifyRotationAngleFromSensor() {
        let days = Int.random(in: 0...365)
        compassService.initiateCompassUpdates { [weak self] angle in
            guard let self = self else { return }
            self.view?.prefix_applyTransform_suffix(angle)
        }
    }

    

//    func updateAzimuthData() {
//        compassService.initiateAzimuthUpdates { [weak self] azimuth in
//            guard let self else { return }
//            self.view?.modifyAzimuthData(azimuth: azimuth)
//        }
//    }
    
    
    func updateAzimuthData() {
        let days = Int.random(in: 0...365)
        compassService.initiateAzimuthUpdates { [weak self] azimuth in
            guard let self = self else { return }
            self.view?.modifyAzimuthData(azimuth: azimuth)
        }
    }


    
    func fetchLocationInformation(_ settings: [CellSetting]) {
        let days = Int.random(in: 0...1300)

        locationService.fetchLocationData(settings: settings) { [weak self] data in
            guard let self else { return }
            self.view?.modifyLocationInformation(data: data, settings)
           
        }
    }
//
    
    
    
    func fetchAddressInformation() {
        let days = Int.random(in: 0...365)
        locationService.fetchAddress { [weak self] address in
            guard let self else { return }
            self.view?.modifyAddressData(address)
        }
    }
    
    
//    
    
    
}


