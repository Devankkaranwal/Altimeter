// 
//  MenuBuilder.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 03.12.2023.
//


import UIKit

final class assembleSettingsModule {
    static func generateSettingsModule() -> UIViewController {
        let view = SettingViewsCon()
        let defaultsService = DataProcessingService()
        let presenter = StrategistDataIntercommunication(view: view as! CustomizableSettingsProtocol, userDefaultsService: defaultsService)
        view.dataPrasent = presenter
        return view
    }
}
