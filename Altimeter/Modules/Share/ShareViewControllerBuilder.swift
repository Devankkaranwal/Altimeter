// 
//  ShareModuleCoordinator.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 03.12.2023.
//



import UIKit

final class ShareViewControllerBuilder {
    static func buildShareModule(locationManager: LocationManagerData = LocationManagerData(), dataService: DataProcessingService = DataProcessingService()) -> UIViewController {
        let sharingViewController = DataExchangeViewController()
        sharingViewController.presenter = ConfluenceMaestroData(dataView: sharingViewController, viewLocation: locationManager, viewService: dataService)
        return sharingViewController
    }
}
