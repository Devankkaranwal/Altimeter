//
//  SceneDelegate.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 22.11.2023.
//


//import UIKit
//
//class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//
//    var window: UIWindow?
//
//
//
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        setupWindow(windowScene)
//    }
//
//    private func setupWindow(_ windowScene: UIWindowScene) {
//        let window = UIWindow(windowScene: windowScene)
//        window.windowScene = windowScene
//        window.rootViewController = tabMenu()
//        window.makeKeyAndVisible()
//        self.window = window
//    }
//
//    private func tabMenu() -> UIViewController {
//        let launchVC = viewLaunchVC()
//        let navigationController = UINavigationController(rootViewController: launchVC)
//        return navigationController
//    }
//
//}


import UIKit

// Define typealiases for the function signatures
typealias SetupWindowFunction = (_ windowScene: UIWindowScene) -> Void
typealias TabMenuFunction = () -> UIViewController

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    // Use the typealias for the setupWindow function
    private let setupWindowFunction: SetupWindowFunction = { windowScene in
        let window = UIWindow(windowScene: windowScene)
        window.windowScene = windowScene
        window.rootViewController = SceneDelegate.tabMenuFunction()
        window.makeKeyAndVisible()
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window = window
    }

    // Use the typealias for the tabMenu function
    private static let tabMenuFunction: TabMenuFunction = {
        let launchVC = viewLaunchVC()
        let navigationController = UINavigationController(rootViewController: launchVC)
        return navigationController
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        setupWindowFunction(windowScene)
    }
}
