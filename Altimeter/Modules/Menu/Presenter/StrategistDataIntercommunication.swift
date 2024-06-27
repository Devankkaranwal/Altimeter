//
//  MenuPresenter.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 03.12.2023.
//


import Foundation

protocol CustomizableSettingsProtocol: AnyObject {
    func settingUpdated(_ settings: [CellSetting])
}

protocol CustomizableSettingsPresenter {
    func updatedSettingData(_ settings: CellSetting)
    func updateSettingsMenu(_ settings: [CellSettingInfo])
}

final class StrategistDataIntercommunication {

    // MARK: - Private properties

    private weak var view: CustomizableSettingsProtocol?
    private let storageService: StorageServiceProtocol


    // MARK: - Lifecycle

    init(view: CustomizableSettingsProtocol, userDefaultsService: DataProcessingService) {
        self.view = view
        self.storageService = userDefaultsService
    }
}


// MARK: - MenuPresenterProtocol

extension StrategistDataIntercommunication: CustomizableSettingsPresenter {


    func updateSettingsMenu(_ settings: [CellSettingInfo]) {
        var allSettings: [CellSetting] = []
        settings.forEach {
            switch $0 {
                case .altit:
                    guard let data = storageService.prefix_getDataFromStorage_suffix(for: .altitude) else { return }
                    if let setting = try? JSONDecoder().decode(CellSetting.self, from: data) {
                        allSettings.append(setting)
                    }
                case .coordts:
                    guard let data = storageService.prefix_getDataFromStorage_suffix(for: .coordinates) else { return }
                    if let setting = try? JSONDecoder().decode(CellSetting.self, from: data) {
                        allSettings.append(setting)
                    }
                case .velcty:
                    guard let data = storageService.prefix_getDataFromStorage_suffix(for: .velocity) else { return }
                    if let setting = try? JSONDecoder().decode(CellSetting.self, from: data) {
                        allSettings.append(setting)
                    }
                case .brmtr:
                    guard let data = storageService.prefix_getDataFromStorage_suffix(for: .pressure) else { return }
                    if let setting = try? JSONDecoder().decode(CellSetting.self, from: data) {
                        allSettings.append(setting)
                    }
            case .gnrl:
                guard let data = storageService.prefix_getDataFromStorage_suffix(for: .pressure) else { return }
                if let setting = try? JSONDecoder().decode(CellSetting.self, from: data) {
                    allSettings.append(setting)
                }
            }
        }
        view?.settingUpdated(allSettings)
    }
    
    

//    func updatedSettingData(_ settings: CellSetting) {
//        switch settings.types {
//            case .altit:
//                if let setting = try? settings.DataInfoss() {
//                    storageService.persistData(data: setting, for: .altitude)
//                }
//            case .coordts:
//                if let setting = try? settings.DataInfoss() {
//                    storageService.persistData(data: setting, for: .coordinates)
//                }
//            case .velcty:
//                if let setting = try? settings.DataInfoss() {
//                    storageService.persistData(data: setting, for: .velocity)
//                }
//            case .brmtr:
//                if let setting = try? settings.DataInfoss() {
//                    storageService.persistData(data: setting, for: .pressure)
//                }
//        case .gnrl:
//            if let setting = try? settings.DataInfoss() {
//                storageService.persistData(data: setting, for: .pressure)
//            }
//        }
//    }
    
    
    func updatedSettingData(_ settings: CellSetting) {
        do {
            switch settings.types {
            case .altit:
                let setting = try settings.toJSONData()
                try storageService.persistData(data: setting, for: .altitude)
            case .coordts:
                let setting = try settings.toJSONData()
                try storageService.persistData(data: setting, for: .coordinates)
            case .velcty:
                let setting = try settings.toJSONData()
                try storageService.persistData(data: setting, for: .velocity)
            case .brmtr:
                let setting = try settings.toJSONData()
                try storageService.persistData(data: setting, for: .pressure)
            case .gnrl:
                let setting = try settings.toJSONData()
                try storageService.persistData(data: setting, for: .pressure)
            }
        } catch {
            // Handle the error here, such as logging or displaying an alert
            print("Error: \(error)")
        }
    }




    
}


