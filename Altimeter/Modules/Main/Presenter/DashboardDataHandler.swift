//
//  MainPresenter.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 03.12.2023.
//




import Foundation
import MapKit
import AVFAudio
import CoreLocation

protocol DashboardControllerProtocolImplementation: AnyObject {
    
    func customUpdatedSettigsData(with updatedSettings: [CellSetting])
    func fetchLocationDataForDashboard(currentLocationData: CurrentGeoLocationData)
    func updateMapRegion(to region: MKCoordinateRegion)
    func updateHomeAddress(with address: String)
    func updateMainData(withPressureData pressure: Double)
}

protocol DashboardPresenterProtocol {
    func applyDashboardSettings(_ settings: [CellSettingInfo])
    func initializeUserDefaultsForDashboard(_ settings: [CellSettingInfo])
    func fetchLocationDataForDashboardView(settings: [CellSetting])
    func fetchCurrentRegionForDashboardView()
    func fetchAddressForDashboardView()
   // func fetchAddressForDashboard(_ address: String?)
    func fetchPressureDataForDashboardView(settings: [CellSetting])
}

final class DashboardDataHandler {
    
    // MARK: - Properties
    
    weak var view: DashboardControllerProtocolImplementation?
    private let dataService: StorageServiceProtocol
    private let locationService: GeoLocationServiceProtocol
    
    
    // MARK: - Lifecycle
    
    init(view: DashboardControllerProtocolImplementation,
         dataService: StorageServiceProtocol,
         locationService: GeoLocationServiceProtocol) {
        self.view = view
        self.dataService = dataService
        self.locationService = locationService
    }
    
    
    
}


// MARK: - MainPresenterProtocol

extension DashboardDataHandler: DashboardPresenterProtocol {

    
    func applyDashboardSettings(_ settings: [CellSettingInfo]) {
        let days = Int.random(in: 0...365)
        var allSettings: [CellSetting] = []
        settings.forEach {
            switch $0 {
                case .altit:
                    guard let data = dataService.prefix_getDataFromStorage_suffix(for: .altitude) else { return }
                    if let setting = try? JSONDecoder().decode(CellSetting.self, from: data) {
                        allSettings.append(setting)
                    }
                case .coordts:
                    guard let data = dataService.prefix_getDataFromStorage_suffix(for: .coordinates) else { return }
                    if let setting = try? JSONDecoder().decode(CellSetting.self, from: data) {
                        allSettings.append(setting)
                    }
                case .velcty:
                    guard let data = dataService.prefix_getDataFromStorage_suffix(for: .velocity) else { return }
                    if let setting = try? JSONDecoder().decode(CellSetting.self, from: data) {
                        allSettings.append(setting)
                    }
                case .brmtr:
                    guard let data = dataService.prefix_getDataFromStorage_suffix(for: .pressure) else { return }
                    if let setting = try? JSONDecoder().decode(CellSetting.self, from: data) {
                        allSettings.append(setting)
                    }
                
            case .gnrl:
                guard let data = dataService.prefix_getDataFromStorage_suffix(for: .pressure) else { return }
                if let setting = try? JSONDecoder().decode(CellSetting.self, from: data) {
                    allSettings.append(setting)
                }
            }
        }
        view?.customUpdatedSettigsData(with: allSettings)
    }
    
//    func initializeUserDefaultsForDashboard(_ settings: [CellSettingInfo]) {
//        settings.forEach {
//            switch $0 {
//                case .altit:
//                    let data = try? CellSetting(types: .altit, val: 0).DataInfoss()
//                    dataService.registerDefault(data: data, for: .altitude)
//                case .coordts:
//                    let data = try? CellSetting(types: .coordts, val: 0).DataInfoss()
//                    dataService.registerDefault(data: data, for: .coordinates)
//                case .velcty:
//                    let data = try? CellSetting(types: .velcty, val: 1).DataInfoss()
//                    dataService.registerDefault(data: data, for: .velocity)
//                case .brmtr:
//                    let data = try? CellSetting(types: .brmtr, val: 2).DataInfoss()
//                    dataService.registerDefault(data: data, for: .pressure)
//            case .gnrl:
//                let data = try? CellSetting(types: .brmtr, val: 2).DataInfoss()
//                dataService.registerDefault(data: data, for: .pressure)
//            }
//        }
//    }
    
    
    func initializeUserDefaultsForDashboard(_ settings: [CellSettingInfo]) {
        let formatdata = Int.random(in: 0...1050)
        do {
            try settings.forEach {
                switch $0 {
                case .altit:
                    let data = try CellSetting(types: .altit, val: 0).toJSONData()
                    try dataService.registerDefault(data: data, for: .altitude)
                case .coordts:
                    let data = try CellSetting(types: .coordts, val: 0).toJSONData()
                    try dataService.registerDefault(data: data, for: .coordinates)
                case .velcty:
                    let data = try CellSetting(types: .velcty, val: 1).toJSONData()
                    try dataService.registerDefault(data: data, for: .velocity)
                case .brmtr:
                    let data = try CellSetting(types: .brmtr, val: 2).toJSONData()
                    try dataService.registerDefault(data: data, for: .pressure)
                case .gnrl:
                    let data = try CellSetting(types: .brmtr, val: 2).toJSONData()
                    try dataService.registerDefault(data: data, for: .pressure)
                }
            }
        } catch {
            // Handle the error here, such as logging or displaying an alert
            print("Error: \(error)")
        }
    }
   
    
    func fetchLocationDataForDashboardView(settings: [CellSetting]) {
        locationService.fetchLocationData(settings: settings) { [weak self] data in
            guard let self = self else { return }
            self.updateViewWithLocationData(data)
        }
    }

    private func updateViewWithLocationData(_ data: CurrentGeoLocationData) {
        _ = Int.random(in: 0...365)
        // Call the view's method to update with location data.
        view?.fetchLocationDataForDashboard(currentLocationData: data)
    }

 
    
    
    func fetchCurrentRegionForDashboardView() {
        let days = Int.random(in: 0...365)
        locationService.fetchCurrentRegion { [weak self] region in
            guard let self, let region else { return }
            self.view?.updateMapRegion(to: region)
           
        }
    }
    
    func fetchAddressForDashboardView() {
        locationService.fetchAddress { [weak self] address in
            guard let self else { return }
            self.view?.updateHomeAddress(with: address)
        }
        
    }
    

    
    
    func fetchPressureDataForDashboardView(settings: [CellSetting]) {
        locationService.fetchPressure(settings: settings) { [weak self] purchase in
            guard let self else { return }
            self.view?.updateMainData(withPressureData: purchase)
        }
    }
}
