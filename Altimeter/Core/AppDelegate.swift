//
//  AppDelegate.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 22.11.2023.
//



//
//import UIKit
//
//@main
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//    func application(_ application: UIApplication,
//                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        LocationManagerData().requestLocationAuthorization()
//        ElevatedInternetConnectionService.shared.initiateNetworkMonitoring()
//        return true
//    }
//
//
//
//
//    // MARK: UISceneSession Lifecycle
//
//
//    func application(_ application: UIApplication,
//                     configurationForConnecting connectingSceneSession: UISceneSession,
//                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        var configuration = UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//
//        // Example: Modify the configuration based on options.
//        if options.userActivities.contains(where: { $0.activityType == "com.example.openDocument" }) {
//            configuration = UISceneConfiguration(name: "Document Configuration", sessionRole: connectingSceneSession.role)
//        }
//
//        return configuration
//    }
//
//
//
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//
//    }
//
//
//
//}


import UIKit

// Define typealias for the application launch function
typealias ApplicationLaunchFunction = (_ application: UIApplication, _ launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool

// Define the actual function that performs the launch tasks
func handleApplicationLaunch(_ application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    LocationManagerData().requestLocationAuthorization()
    ElevatedInternetConnectionService.shared.initiateNetworkMonitoring()
    return true
}

// Define the AppDelegate
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // Use the typealias for the application launch function
    private let applicationDidFinishLaunchingWithOptions: ApplicationLaunchFunction = handleApplicationLaunch

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return applicationDidFinishLaunchingWithOptions(application, launchOptions)
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        var configuration = UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)

        // Example: Modify the configuration based on options.
        if options.userActivities.contains(where: { $0.activityType == "com.example.openDocument" }) {
            configuration = UISceneConfiguration(name: "Document Configuration", sessionRole: connectingSceneSession.role)
        }

        return configuration
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Handle scene session discard
    }
}
