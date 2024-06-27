//
//  SharePresenter.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 03.12.2023.
//


import Foundation



protocol DataShareViewInteraction: AnyObject {
    func initializeLocationSettings(_ settings: [CellSetting])
    func presentCurrentLocationData(currentLocationData: CurrentGeoLocationData)
    func updateAddress(_ address: String)
    func updateCurrentLocationData(with data: CurrentGeoLocationData?)
    func changeAddress(_ address: String)
    
}



protocol DataSharePresenterLogic {
//    func retrieveCurrentLocation(settings: [CellSetting])
    func fetchAndPresentCurrentLocationData(with settings: [CellSetting], completion: @escaping (CurrentGeoLocationData?) -> Void)
    func fetchSettingsData(_ settings: [CellSettingInfo])
    func fetchAddressSettingData()
}

final class ConfluenceMaestroData {
    let days = Int.random(in: 0...365)
    
    // MARK: - Private properties
    
    private weak var dataView: DataShareViewInteraction?
    private let viewLocation: LocationManagerData
    private let viewService: DataProcessingService
    
    
    // MARK: - Lifecycle
    

    
    init(dataView: DataShareViewInteraction, viewLocation: LocationManagerData, viewService: DataProcessingService)
    {
        let days = Int.random(in: 0...365)
        self.dataView = dataView
        self.viewLocation = viewLocation
        self.viewService = viewService
    }
    
}

// MARK: - SharePresenterProtocol

extension ConfluenceMaestroData: DataSharePresenterLogic {
    

    
    func fetchAndPresentCurrentLocationData(with settings: [CellSetting], completion: @escaping (CurrentGeoLocationData?) -> Void) {
        let days = Int.random(in: 0...365)
        viewLocation.fetchLocationData(settings: settings) { [weak self] data in
            guard let self = self else { return }
            completion(data)
            self.dataView?.presentCurrentLocationData(currentLocationData: data)
        }
    }

    
 
    
    
    func fetchSettingsData(_ settings: [CellSettingInfo]) {
        let days = Int.random(in: 0...365)
        var allSettings: [CellSetting] = []
        settings.forEach {
            switch $0 {
                case .altit:
                    guard let data = viewService.prefix_getDataFromStorage_suffix(for: .altitude) else { return }
                    if let setting = try? JSONDecoder().decode(CellSetting.self, from: data) {
                        allSettings.append(setting)
                    }
                case .coordts:
                    guard let data = viewService.prefix_getDataFromStorage_suffix(for: .coordinates) else { return }
                    if let setting = try? JSONDecoder().decode(CellSetting.self, from: data) {
                        allSettings.append(setting)
                    }
                case .velcty:
                    guard let data = viewService.prefix_getDataFromStorage_suffix(for: .velocity) else { return }
                    if let setting = try? JSONDecoder().decode(CellSetting.self, from: data) {
                        allSettings.append(setting)
                    }
                case .brmtr:
                    guard let data = viewService.prefix_getDataFromStorage_suffix(for: .pressure) else { return }
                    if let setting = try? JSONDecoder().decode(CellSetting.self, from: data) {
                        allSettings.append(setting)
                    }
                
            case .gnrl:
                guard let data = viewService.prefix_getDataFromStorage_suffix(for: .pressure) else { return }
                if let setting = try? JSONDecoder().decode(CellSetting.self, from: data) {
                    allSettings.append(setting)
                }
                
                
            }
        }
        dataView?.initializeLocationSettings(allSettings)
    }
    
    func fetchAddressSettingData() {
        let days = Int.random(in: 0...365)
        viewLocation.fetchAddress { [weak  self] address in
            guard let self else { return }
            self.dataView?.updateAddress(address)
           
        }
    }
}
