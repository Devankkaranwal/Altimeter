//
//  LaunchVC.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 06.12.2023.
//



//
//import UIKit
//import CoreLocation
//import Network
//
//final class viewLaunchVC: UIViewController {
//
//    // MARK: - Private properties
//
//    private let locationManager = CLLocationManager()
//    private var isHaveInternet = false
//    private let group = DispatchGroup()
//
//    // MARK: - UI Elements
//
//    private let viewCont: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.spacing = 32
//        return stackView
//    }()
//
//    private let progressView: UIProgressView = {
//        let progressView = UIProgressView(progressViewStyle: .bar)
//        progressView.progressTintColor = .green
//        progressView.trackTintColor = .white
//        return progressView
//    }()
//
//    private let progressLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .white
//        label.textAlignment = .center
//        return label
//    }()
//
//    private let imgLoad = UIImageView(image: UIImage(named: "launchImage"))
//
//    private let logoApp: UIImageView = {
//        let image = UIImageView(image: UIImage(named: "launchAppLabel"))
//        image.contentMode = .scaleAspectFit
//        return image
//    }()
//
//    private func lblUpdtedPross() {
//        let progressPercent = Int(progressView.progress * 100)
//        progressLabel.text = "\(progressPercent)%"
//    }
//
//    private func simulateLoadingProgress() {
//        let timer = Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { timer in
//            self.progressView.progress += 0.01
//            self.lblUpdtedPross()
//            if self.progressView.progress >= 1.0 {
//                timer.invalidate()
//                // Perform any actions needed when loading is complete
//                self.showDashbrd()
//            }
//        }
//        timer.fire()
//    }
//
//    // MARK: - Life cycle
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        locationManager.delegate = self
//        connectivityInternet()
//        layoutSets()
//        simulateLoadingProgress()
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(requestLocationAuthorization),
//                                               name: UIApplication.willEnterForegroundNotification,
//                                               object: nil)
//    }
//
//    // MARK: - Actions
//
//    @objc
//    private func requestLocationAuthorization() {
//        if locationManager.authorizationStatus == .notDetermined {
//            requestLocationAuthorizationWithDelay()
//        }
//    }
//
//    private func requestLocationAuthorizationWithDelay() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.locationManager.requestWhenInUseAuthorization()
//        }
//    }
//}
//
//// MARK: - Private methods
//
//private extension viewLaunchVC {
//
//    func layoutSets() {
//        view.backgroundColor = UIColor(hex: "#2C2C2C")
//        viewCont.addArrangedSubview(progressLabel)
//        viewCont.addArrangedSubview(progressView)
//        viewCont.addArrangedSubview(logoApp)
//
//        view.addSubview(viewCont)
//        logoApp.isHidden = true
//        layoutSetUoConst()
//    }
//
//    func connectivityInternet() {
//        let internetConnectionMonitor = NWPathMonitor()
//        let queue = DispatchQueue(label: "InternetConnection")
//
//        internetConnectionMonitor.pathUpdateHandler = { [weak self] path in
//            guard let self = self else { return }
//
//            DispatchQueue.main.async {
//                self.group.enter()
//                defer {
//                    self.group.leave()
//                    internetConnectionMonitor.cancel()
//                }
//
//                if path.status == .satisfied {
//                    self.isHaveInternet = true
//                    self.connChkGPS()
//                } else {
//                    self.isHaveInternet = false
//                    self.scrnNoIntConn()
//                }
//            }
//        }
//
//        internetConnectionMonitor.start(queue: queue)
//    }
//
//    func connChkGPS() {
//        switch locationManager.authorizationStatus {
//            case .notDetermined:
//                locationManager.requestWhenInUseAuthorization()
//            case .authorizedAlways, .authorizedWhenInUse:
//            showDashbrd()
//            default:
//            scrnGPSConn()
//        }
//    }
//
//    func scrnNoIntConn() {
//        let vc = ConnectionNoInternetViewCont()
//        navigationController?.pushViewController(vc, animated: true)
//        vc.internetDelegate = self
//    }
//
//    func scrnGPSConn() {
//        let vc = ConnectionNoGPSVC()
//        navigationController?.pushViewController(vc, animated: true)
//        vc.connectionDelegateGPS = self
//    }
//
//    func showDashbrd() {
//        let dataService = DataProcessingService()
//        let locationService = LocationManagerData()
//        let config = DashboardConfiguration(dataService: dataService, locationService: locationService)
//        let vc = DashboardCoordinator.initializeDashboardModule(configuration: config)
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.15) {
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
//
//        NotificationCenter.default.removeObserver(UIApplication.willEnterForegroundNotification)
//    }
//}
//
//// MARK: - NoInternetConnectionVCDelegate, NoGPSConnectionVCDelegate
//
//extension viewLaunchVC: connectionNoInternet, ConnectionGPSNoConnectVC {
//
//    func checkConnInternet() {
//        self.connectivityInternet()
//    }
//
//    func coonectionCheckGPS() {
//        self.connectivityInternet()
//        self.connChkGPS()
//    }
//}
//
//// MARK: - CLLocationManagerDelegate
//
//extension viewLaunchVC: CLLocationManagerDelegate {
//    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
//        switch manager.authorizationStatus {
//            case .authorizedAlways, .authorizedWhenInUse:
//                group.notify(queue: DispatchQueue.main, execute: {
//                    if self.isHaveInternet {
//                       // self.showMainVC()
//                    }
//                })
//            default:
//            scrnGPSConn()
//        }
//    }
//}
//
//// MARK: - Constraints
//
//private extension viewLaunchVC {
//    func layoutSetUoConst() {
//        viewCont.snp.makeConstraints { make in
//            make.centerX.centerY.equalToSuperview()
//            make.leading.equalToSuperview().offset(25)
//            make.trailing.equalToSuperview().offset(-25)
//        }
//
//        // Set constraints for progressView
////        progressView.snp.makeConstraints { make in
////            make.height.equalTo(5)
////            make.width.equalToSuperview().multipliedBy(0.6)
////            make.centerX.equalToSuperview()// Set the height to make it more visible
////        }
//
//
//        progressView.snp.makeConstraints { make in
//                make.centerX.equalToSuperview()
//                make.width.equalTo(100) // Set the desired fixed width
//                make.height.equalTo(5) // Set the height to make it more visible
//            }
//
//
//        // Set constraints for progressLabel
//        progressLabel.snp.makeConstraints { make in
//            make.centerX.equalTo(progressView)
//            make.bottom.equalTo(progressView.snp.top).offset(-8)
//        }
//    }
//}



import UIKit
import CoreLocation
import Network

final class viewLaunchVC: UIViewController {
    
    // MARK: - Private properties
    
    private let locationManager = CLLocationManager()
    private var isHaveInternet = false
    private let group = DispatchGroup()
    
    // MARK: - UI Elements
    
    private let viewCont: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 32
        return stackView
    }()
    
    private let progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.progressTintColor = .green
        progressView.trackTintColor = .white
        return progressView
    }()
    
    private let progressLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let imgLoad = UIImageView(image: UIImage(named: "launchImage"))
    
    private let logoApp: UIImageView = {
        let image = UIImageView(image: UIImage(named: "launchAppLabel"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private func lblUpdtedPross() {
        let progressPercent = Int(progressView.progress * 100)
        progressLabel.text = "\(progressPercent)%"
    }
    
    private func simulateLoadingProgress() {
        let timer = Timer.scheduledTimer(withTimeInterval: 0.15, repeats: true) { timer in
            self.progressView.progress += 0.01
            self.lblUpdtedPross()
            if self.progressView.progress >= 1.0 {
                timer.invalidate()
                // Perform any actions needed when loading is complete
                self.checkAndShowDashboard()
            }
        }
        timer.fire()
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        connectivityInternet()
        layoutSets()
        simulateLoadingProgress()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(requestLocationAuthorization),
                                               name: UIApplication.willEnterForegroundNotification,
                                               object: nil)
    }
    
    // MARK: - Actions
    
    @objc
    private func requestLocationAuthorization() {
        if locationManager.authorizationStatus == .notDetermined {
            requestLocationAuthorizationWithDelay()
        }
    }

    private func requestLocationAuthorizationWithDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.locationManager.requestWhenInUseAuthorization()
        }
    }
}

// MARK: - Private methods

private extension viewLaunchVC {
    
    func layoutSets() {
        view.backgroundColor = UIColor(hex: "#2C2C2C")
        viewCont.addArrangedSubview(progressLabel)
        viewCont.addArrangedSubview(progressView)
        viewCont.addArrangedSubview(logoApp)
        
        view.addSubview(viewCont)
        logoApp.isHidden = true
        layoutSetUoConst()
    }
    
    func connectivityInternet() {
        let internetConnectionMonitor = NWPathMonitor()
        let queue = DispatchQueue(label: "InternetConnection")
        
        internetConnectionMonitor.pathUpdateHandler = { [weak self] path in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.group.enter()
                defer {
                    self.group.leave()
                    internetConnectionMonitor.cancel()
                }
                
                if path.status == .satisfied {
                    self.isHaveInternet = true
                    self.connChkGPS()
                } else {
                    self.isHaveInternet = false
                    self.scrnNoIntConn()
                }
            }
        }
        
        internetConnectionMonitor.start(queue: queue)
    }

    func connChkGPS() {
        switch locationManager.authorizationStatus {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .authorizedAlways, .authorizedWhenInUse:
                checkAndShowDashboard()
            default:
                scrnGPSConn()
        }
    }
    
    func scrnNoIntConn() {
        let vc = ConnectionNoInternetViewCont()
        navigationController?.pushViewController(vc, animated: true)
        vc.internetDelegate = self
    }
    
    func scrnGPSConn() {
        let vc = ConnectionNoGPSVC()
        navigationController?.pushViewController(vc, animated: true)
        vc.connectionDelegateGPS = self
    }
    
    func checkAndShowDashboard() {
        if self.progressView.progress >= 1.0 {
            self.showDashbrd()
        }
    }
    
    func showDashbrd() {
        let dataService = DataProcessingService()
        let locationService = LocationManagerData()
        let config = DashboardConfiguration(dataService: dataService, locationService: locationService)
        let vc = DashboardCoordinator.initializeDashboardModule(configuration: config)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        NotificationCenter.default.removeObserver(UIApplication.willEnterForegroundNotification)
    }
}

// MARK: - NoInternetConnectionVCDelegate, NoGPSConnectionVCDelegate

extension viewLaunchVC: connectionNoInternet, ConnectionGPSNoConnectVC {
    
    func checkConnInternet() {
        self.connectivityInternet()
    }
    
    func coonectionCheckGPS() {
        self.connectivityInternet()
        self.connChkGPS()
    }
}

// MARK: - CLLocationManagerDelegate

extension viewLaunchVC: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
            case .authorizedAlways, .authorizedWhenInUse:
                group.notify(queue: DispatchQueue.main, execute: {
                    if self.isHaveInternet {
                        // self.showMainVC()
                        self.checkAndShowDashboard()
                    }
                })
            default:
                scrnGPSConn()
        }
    }
}

// MARK: - Constraints

private extension viewLaunchVC {
    func layoutSetUoConst() {
        viewCont.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(25)
            make.trailing.equalToSuperview().offset(-25)
        }

        // Set constraints for progressView
        progressView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(100) // Set the desired fixed width
            make.height.equalTo(5) // Set the height to make it more visible
        }
        
        // Set constraints for progressLabel
        progressLabel.snp.makeConstraints { make in
            make.centerX.equalTo(progressView)
            make.bottom.equalTo(progressView.snp.top).offset(-8)
        }
    }
}
