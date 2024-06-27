// 
//  DataBuilderCompassModule.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 03.12.2023.
//


//import UIKit
//
//final class ModuleInitializerCompass {
//    static func constructCompassModule() -> UIViewController {
//        let view = CompassVC()
//        //let view = CompassVC()
//        
//        
//        let userDefaultsService = DataProcessingService()
//        let compassService = AdvancedNavigationService()
//        let locationService  = LocationManagerData()
//        let presenter = CuttingEdgeCompassPresenter(view: view,
//                                         userDefaultsService: userDefaultsService,
//                                         compassService: compassService,
//                                         locationService: locationService)
//        view.compassPresenter = presenter
//        return view
//    }
//}


import UIKit

final class ModuleInitializerCompass {
    static func constructCompassModule(userDefaultsService: DataProcessingService,
                                       compassService: NavigationServiceProtocol,
                                       locationService: GeoLocationServiceProtocol) -> UIViewController {
        let view = CompassVC()
        
        let presenter = CuratorDirectionalData(view: view,
                                                     userDefaultsService: userDefaultsService,
                                                     compassService: compassService,
                                                     locationService: locationService)
        view.compassPresenter = presenter
        return view
    }
}
