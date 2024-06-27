//
//  LocationService.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 01.12.2023.
//


import CoreLocation
import CoreMotion
import MapKit

protocol GeoLocationServiceProtocol {
    func requestLocationAuthorization()
    func fetchCurrentRegion(completion: @escaping (MKCoordinateRegion?) -> Void)
    func fetchAddress(completion: @escaping (String) -> Void)
    func fetchPressure(settings: [CellSetting], completion: @escaping (Double) -> Void)
    func fetchLocationData(settings: [CellSetting], completion: @escaping (CurrentGeoLocationData) -> Void)
}

final class LocationManagerData: NSObject, GeoLocationServiceProtocol {

    // MARK: - Private properties

    private let locationManager = CLLocationManager()
    private let altimeter = CMAltimeter()
    private var locationCompletionHandler: ((CurrentGeoLocationData) -> Void)?
    private var addressCompletionHandler: ((String) -> Void)?

    private var currentPressure = Double()
    private var address = String()
    private var settings: [CellSetting]?
    private var region: MKCoordinateRegion?

    private let group = DispatchGroup()


    // MARK: - Functions

    func requestLocationAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }

    func fetchCurrentRegion(completion: @escaping (MKCoordinateRegion?) -> Void) {
        locationManager.delegate = self
        group.notify(queue: DispatchQueue.main) {
            completion(self.region)
        }
    }

    func fetchAddress(completion: @escaping (String) -> Void) {
        locationManager.delegate = self
        addressCompletionHandler = completion
    }

    func fetchPressure(settings: [CellSetting], completion: @escaping (Double) -> Void) {
        if CMAltimeter.isRelativeAltitudeAvailable() {
            self.altimeter.startRelativeAltitudeUpdates(to: OperationQueue.main) { [weak self] (data, error) in
                guard let self else { return }
                guard let pressure = data?.pressure.doubleValue else { return }
                settings.forEach {
                    switch $0.types {
                        case .brmtr:
                            let configuredPressure = self.configurePressure(index: $0.val, pressure: pressure)
                            completion(configuredPressure)
                    case .altit, .coordts, .velcty, .gnrl:
                            break
                    }
                }
            }
        }
    }

    func fetchLocationData(settings: [CellSetting], completion: @escaping (CurrentGeoLocationData) -> Void) {
        self.settings = settings
        locationManager.requestWhenInUseAuthorization()
        locationCompletionHandler = completion
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                self.locationManager.startUpdatingLocation()
                self.locationManager.distanceFilter = kCLDistanceFilterNone
                self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
                self.locationManager.pausesLocationUpdatesAutomatically = false
                self.locationManager.delegate = self
            }
        }
    }
}


// MARK: - CLLocationManagerDelegate

extension LocationManagerData: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let lastLocation = locations.last else { return }
        group.enter()
        region = MKCoordinateRegion(center: lastLocation.coordinate,
                                    latitudinalMeters: 1000,
                                    longitudinalMeters: 1000)
        group.leave()

        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(lastLocation) { [weak self] (placeMarks, error) in
            if let placeMark = placeMarks?.first {
                let address = "\(placeMark.thoroughfare ?? ""), \(placeMark.subThoroughfare ?? ""), \(placeMark.locality ?? ""), \(placeMark.country ?? ""), \(placeMark.postalCode ?? ""), \(placeMark.isoCountryCode ?? "")"
                self?.addressCompletionHandler?(address)
            }
            geoCoder.cancelGeocode()
        }

        if let settings = settings {
            var altitude: Double = 0.0
            var magnitude: Double = 0.0
            var speed: Double = 0.0
            settings.forEach {
                switch $0.types {
                    case .altit:
                        altitude = configureAlt(index: $0.val, alt: lastLocation.altitude)
                        magnitude = configureMagnitude(index: $0.val, magnitude: lastLocation.verticalAccuracy.magnitude)
                    case .velcty:
                        speed = configureSpeed(index: $0.val, speed: lastLocation.speed)
                        if speed <= 0 {
                            speed = 0
                        }
                case .coordts, .brmtr, .gnrl:
                        break
                }
            }

            let data = CurrentGeoLocationData(altitude: altitude,
                                            magnitude: magnitude,
                                            dataSpeed: speed,
                                            latitude: lastLocation.coordinate.latitude,
                                            longitude: lastLocation.coordinate.longitude)
            self.locationCompletionHandler?(data)
            locationManager.stopUpdatingLocation()
        }
    }
}


// MARK: - Private methods

private
extension LocationManagerData {
    func configureAlt(index: Int? = 0, alt: Double) -> Double {
        index == 0 ?  alt : Measurement(value: alt, unit: UnitLength.meters).converted(to: .feet).value
    }

    func configureMagnitude(index: Int? = 0, magnitude: Double) -> Double {
        index == 0 ?  magnitude : Measurement(value: magnitude, unit: UnitLength.meters).converted(to: .feet).value
    }

    func configureCoordinates(index: Int = 2, coords: Double) -> String {

        return String(coords)
    }

    func configureSpeed(index: Int? = 1, speed: Double) -> Double {
        index == 1 ? speed : Measurement(value: speed, unit: UnitSpeed.milesPerHour).converted(to: .kilometersPerHour).value
    }

    func configurePressure(index: Int, pressure: Double) -> Double {
        switch index {
            case 0:
                return Measurement(value: pressure,
                                   unit: UnitPressure.kilopascals).converted(to: .atmosDta).value
            case 1:
                return Measurement(value: pressure,
                                   unit: UnitPressure.kilopascals).converted(to: .poundsForcePerSquareInch).value
            case 3:
                return Measurement(value: pressure,
                                   unit: UnitPressure.kilopascals).converted(to: .inchesOfMercury).value
            case 4:
                return Measurement(value: pressure,
                                   unit: UnitPressure.kilopascals).converted(to: .millimetersOfMercury).value
            default:
                return pressure
        }
    }
}



