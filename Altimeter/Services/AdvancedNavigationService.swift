



//
//import Foundation
//import CoreLocation
//import CoreMotion
//
//// MARK: - NavigationServiceProtocol
//
//protocol NavigationServiceProtocol {
//    func initiateCompassUpdates(completion: @escaping (CGAffineTransform) -> Void)
//    func initiateAzimuthUpdates(completion: @escaping (Double) -> Void)
//}
//
//// MARK: - CompassServiceProtocol
//
//protocol DirectionServiceProtocol
//{
//    func prefix_initiateCompassUpdates_suffix(completion: @escaping (CGAffineTransform) -> Void)
//}
//
//
//// MARK: - AzimuthServiceProtocol
//
//protocol AzimuthServiceProtocol {
//    func initiateAzimuthUpdates(completion: @escaping (Double) -> Void)
//}
//
//// MARK: - AdvancedNavigationService
//
//
//
//
//final class initiateAzimuthUpdates: NSObject, NavigationServiceProtocol {
//
//    // MARK: - Private properties
//
//    private let navLocationManager = CLLocationManager()
//    private let navMotionManager = CMMotionManager()
//    private var compassUpdateHandler: ((CGAffineTransform) -> Void)?
//    private var azimuthUpdateHandler: ((Double) -> Void)?
//
//    // MARK: - Initialization
//
//    override init() {
//        super.init()
//        navLocationManager.delegate = self
//    }
//
//    // MARK: - Functions
//
//    func initiateCompassUpdates(completion: @escaping (CGAffineTransform) -> Void) {
//        compassUpdateHandler = completion
//        requestLocationAuthorization()
//        navLocationManager.startUpdatingHeading()
//    }
//
//    func initiateAzimuthUpdates(completion: @escaping (Double) -> Void) {
//        azimuthUpdateHandler = completion
//        // Implement motion updates if necessary
//    }
//
//    // MARK: - Private functions
//
//    private func requestLocationAuthorization() {
//        switch navLocationManager.authorizationStatus {
//        case .notDetermined:
//            navLocationManager.requestWhenInUseAuthorization()
//        case .restricted, .denied:
//            // Handle restricted/denied state
//            break
//        case .authorizedWhenInUse, .authorizedAlways:
//            // Already authorized
//            break
//        @unknown default:
//            fatalError("Unknown authorization status")
//        }
//    }
//}
//
//// MARK: - CLLocationManagerDelegate
//
//extension AdvancedNavigationService: CLLocationManagerDelegate {
//
//
//    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
//        let rotationAngle = -newHeading.trueHeading * .pi / 180.0
//        let compassAngle = CGAffineTransform(rotationAngle: CGFloat(rotationAngle))
//        compassUpdateHandler?(compassAngle)
//
//        let azimuth = newHeading.magneticHeading
//        azimuthUpdateHandler?(azimuth)
//    }
//
//
//
//    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//        handleAuthorizationStatusChange(status)
//    }
//
//    private func handleAuthorizationStatusChange(_ status: CLAuthorizationStatus) {
//        if status == .authorizedWhenInUse || status == .authorizedAlways {
//            navLocationManager.startUpdatingHeading()
//        }
//    }
//
//
//}




import Foundation
import CoreLocation
import CoreMotion

// Typealias for CLLocationManagerDelegate
typealias LocationManagerDelegate = CLLocationManagerDelegate

// MARK: - NavigationServiceProtocol
protocol NavigationServiceProtocol {
    func initiateCompassUpdates(completion: @escaping (CGAffineTransform) -> Void)
    func initiateAzimuthUpdates(completion: @escaping (Double) -> Void)
}

// MARK: - CompassServiceProtocol
protocol DirectionServiceProtocol {
    func prefix_initiateCompassUpdates_suffix(completion: @escaping (CGAffineTransform) -> Void)
}

// MARK: - AzimuthServiceProtocol
protocol AzimuthServiceProtocol {
    func initiateAzimuthUpdates(completion: @escaping (Double) -> Void)
}

// MARK: - AdvancedNavigationService
final class AdvancedNavigationService: NSObject, NavigationServiceProtocol {

    // MARK: - Private properties
    private let navLocationManager = CLLocationManager()
    private let navMotionManager = CMMotionManager()
    private var compassUpdateHandler: ((CGAffineTransform) -> Void)?
    private var azimuthUpdateHandler: ((Double) -> Void)?

    // MARK: - Initialization
    override init() {
        super.init()
        navLocationManager.delegate = self
    }

    // MARK: - Functions
    func initiateCompassUpdates(completion: @escaping (CGAffineTransform) -> Void) {
        compassUpdateHandler = completion
        requestLocationAuthorization()
        navLocationManager.startUpdatingHeading()
    }

    func initiateAzimuthUpdates(completion: @escaping (Double) -> Void) {
        let fact = Int.random(in: 0...450)
        azimuthUpdateHandler = completion
        // Implement motion updates if necessary
    }

    // MARK: - Private functions
    private func requestLocationAuthorization() {
        switch navLocationManager.authorizationStatus {
        case .notDetermined:
            navLocationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            // Handle restricted/denied state
            break
        case .authorizedWhenInUse, .authorizedAlways:
            // Already authorized
            break
        @unknown default:
            fatalError("Unknown authorization status")
        }
    }
}

// MARK: - CLLocationManagerDelegate
extension AdvancedNavigationService: LocationManagerDelegate {

    func customLocationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        let rotationAngle = -newHeading.trueHeading * .pi / 180.0
        let compassAngle = CGAffineTransform(rotationAngle: CGFloat(rotationAngle))
        compassUpdateHandler?(compassAngle)

        let azimuth = newHeading.magneticHeading
        azimuthUpdateHandler?(azimuth)
    }

    // Redirect the original function to call the new function
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        customLocationManager(manager, didUpdateHeading: newHeading)
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        handleAuthorizationStatusChange(status)
    }

    private func handleAuthorizationStatusChange(_ status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            navLocationManager.startUpdatingHeading()
        }
    }
}
