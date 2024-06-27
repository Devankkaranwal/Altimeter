// 
//  DashboardModuleBuilder.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 03.12.2023.
//

import UIKit

//
//import UIKit
//
//
//final class DashboardCoordinator {
//    static func initializeDashboardModule() -> UIViewController {
//        let dashboardViewController = DashboardViewController()
//        let dataService = DataProcessingService()
//        let locationService = LocationManagerData()
//
//        let presenter = DashboardPresenter(view: dashboardViewController, dataService: dataService, locationService: locationService)
//        dashboardViewController.presenter = presenter
//        return dashboardViewController
//    }
//}

//UniqueDashboardCoordinator




struct DashboardConfiguration {
    let dataService: DataProcessingService
    let locationService: LocationManagerData
}

final class DashboardCoordinator {
    
    static func initializeDashboardModule(configuration: DashboardConfiguration) -> UIViewController {
        let dashboardViewController = DashPresenterViewController()
        let presenter = DashboardDataHandler(view: dashboardViewController, dataService: configuration.dataService, locationService: configuration.locationService)
        dashboardViewController.presenter = presenter
        return dashboardViewController
    }
}
