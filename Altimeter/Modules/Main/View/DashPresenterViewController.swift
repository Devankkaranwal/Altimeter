//
//  DashboardViewCon.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 03.12.2023.
//


import UIKit
import MapKit

final class DashPresenterViewController: UIViewController {
    // MARK: - Dependency
    var presenter: DashboardPresenterProtocol?

    // MARK: - Private properties
    private var isStandardMapView = true
    private var screenWidth: CGFloat = 0
    private var settings: [CellSetting] = []
    private let userDefaultsService = DataProcessingService()

    // MARK: - UI Elements
    private lazy var gpsIconButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "GPSIndicator"), for: .normal)
        return button
    }()

    private let addressView: AddressView = {
        let view = AddressView()
        return view
    }()
    


    private lazy var compassButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "compassIcon"), for: .normal)
        button.addTarget(self, action: #selector(handleCompassPress), for: .touchUpInside)
        return button
    }()

    private lazy var shareButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "ShareInfo"), for: .normal)
        button.addTarget(self, action: #selector(handleShareButtonPress), for: .touchUpInside)
        return button
    }()

    private lazy var menuButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "SettingInfos"), for: .normal)
        button.addTarget(self, action: #selector(btnSettingData), for: .touchUpInside)
        return button
    }()

    private lazy var layersButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "layersIcon"), for: .normal)
        button.addTarget(self, action: #selector(toggleMapLayer), for: .touchUpInside)
        return button
    }()

    private lazy var trackButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "MapTrack"), for: .normal)
        button.addTarget(self, action: #selector(handleTrackPress), for: .touchUpInside)
        return button
    }()

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()

    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 32
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 50)
        return stackView
    }()

    private let coordinateView = DasboardView(type: .coordinate(latitude: 123.45, longitude: 67.89))

    private lazy var mapView: MKMapView = {
        let map = MKMapView()
        map.showsUserLocation = true
        map.showsCompass = false
        return map
    }()

    // MARK: - Life cycle
     override func viewDidLoad() {
        super.viewDidLoad()
        performUISetup()
        setupPresenter()
      // setupObservers()
//         NotificationCenter.default.addObserver(self, selector: #selector(handleConnectivityChange(notification:)), name: .connectivityStatusChanged, object: nil)
         
//         NotificationCenter.default.addObserver(self,
//                                                selector: #selector(handleConnectivityChange(notification:)),
//                                                name: NSNotification.Name.connectivityStatusChanged,
//                                                object: nil)
         
         
//         NotificationCenter.default.addObserver(self,
//                                                      selector: #selector(handleConnectivityChange(notification:)),
//                                                      name: .connectivityStatusChanged,
//                                                      object: nil)
         
         
         NotificationCenter.default.addObserver(self,
                                                        selector: #selector(handleConnectivityChange(notification:)),
                                                        name: .connectivityStatusChanged,
                                                        object: nil)
                 ElevatedInternetConnectionService.shared.initiateNetworkMonitoring()
         
         
         
    }

    private func performUISetup() {
        navigationController?.delegate = self
        view.backgroundColor = .red

        contentStackView.addArrangedSubview(coordinateView)
        scrollView.addSubview(contentStackView)

        let bottomButtonStackView = UIStackView(arrangedSubviews: [layersButton, trackButton, shareButton, menuButton])
        bottomButtonStackView.axis = .horizontal
        bottomButtonStackView.spacing = 20
        bottomButtonStackView.distribution = .equalSpacing

        view.addSubview(mapView)
        view.addSubview(scrollView)
        view.addSubview(gpsIconButton)
        view.addSubview(compassButton)
        view.addSubview(bottomButtonStackView)
        view.addSubview(addressView)

        screenWidth = UIScreen.main.bounds.width
        performSetUpUIConstraints(bottomButtonStackView: bottomButtonStackView)
    }

    private func setupPresenter() {
        do {
            try presenter?.initializeUserDefaultsForDashboard([.altit, .coordts, .velcty, .brmtr])
            presenter?.applyDashboardSettings(CellSettingInfo.allCases)
            presenter?.fetchLocationDataForDashboardView(settings: settings)
        } catch {
            print("Error initializing user defaults or fetching data: \(error)")
        }
    }
    
    
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("GPCIcon frame after layout: \(gpsIconButton.frame)")
        print("compassButton frame after layout: \(compassButton.frame)")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        NotificationCenter.default.addObserver(self,
                                                       selector: #selector(handleConnectivityChange(notification:)),
                                                       name: .connectivityStatusChanged,
                                                       object: nil)
                ElevatedInternetConnectionService.shared.initiateNetworkMonitoring()
        
//        NotificationCenter.default.addObserver(self,
//                                                      selector: #selector(handleConnectivityChange(notification:)),
//                                                      name: .connectivityStatusChanged,
//                                                      object: nil)
        
        
        
      //  setupObservers()
//        NotificationCenter.default.addObserver(self, selector: #selector(handleConnectivityChange(notification:)), name: .connectivityStatusChanged, object: nil)
        
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(handleConnectivityChange(notification:)),
//                                               name: NSNotification.Name.connectivityStatusChanged,
//                                               object: nil)
        
        
        navigationController?.delegate = self
        presenter?.applyDashboardSettings(CellSettingInfo.allCases)
        presenter?.fetchLocationDataForDashboardView(settings: settings)
        presenter?.fetchCurrentRegionForDashboardView()
        presenter?.fetchAddressForDashboardView()
        presenter?.fetchPressureDataForDashboardView(settings: settings)
    }

    // MARK: - Observers


    @objc
        private func handleConnectivityChange(notification: Notification) {
            guard let userInfo = notification.userInfo,
                  let isConnected = userInfo["connectionStatus"] as? Bool else {
                return
            }

            if isConnected {
                print("Connected")
                dismissNoInternetAlert()
            } else {
                print("Disconnected")
                displayNoInternetAlert(title: "No Internet Connection", message: "Please check your internet connection and try again.")
            }
        }

        private func displayNoInternetAlert(title: String, message: String) {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let retryAction = UIAlertAction(title: "Retry", style: .default) { [weak self] _ in
                self?.handleRetryAfterDelay()
            }
            alertController.addAction(retryAction)
            present(alertController, animated: true, completion: nil)
        }

        private func dismissNoInternetAlert() {
            if let presentedVC = self.presentedViewController, presentedVC is UIAlertController {
                presentedVC.dismiss(animated: true, completion: nil)
            }
        }

        private func handleRetryAfterDelay() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                ElevatedInternetConnectionService.shared.initiateNetworkMonitoring()
            }
        }

    
    
    
    
    // MARK: - Actions
    @objc private func handleCompassPress() {
        let userDefaultsService = DataProcessingService()
        let compassService = AdvancedNavigationService()
        let locationService = LocationManagerData()
        let vc = ModuleInitializerCompass.constructCompassModule(userDefaultsService: userDefaultsService, compassService: compassService, locationService: locationService)
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }

    @objc private func handleShareButtonPress() {
        let shareViewController = ShareViewControllerBuilder.buildShareModule()
        navigationController?.pushViewController(shareViewController, animated: true)
    }

    @objc private func btnSettingData() {
        let settingsModule = assembleSettingsModule.generateSettingsModule()
        navigationController?.pushViewController(settingsModule, animated: true)
    }

    @objc private func toggleMapLayer() {
        isStandardMapView.toggle()
        mapView.mapType = isStandardMapView ? .standard : .hybrid
    }

    @objc private func handleTrackPress() {
        guard let presenter = presenter else {
            print("Presenter is nil, cannot fetch data.")
            return
        }
        presenter.fetchCurrentRegionForDashboardView()
        presenter.fetchLocationDataForDashboardView(settings: settings)
    }
}

// MARK: - UINavigationControllerDelegate
extension DashPresenterViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        guard shouldHideNavigationBar(for: viewController) else { return }
        setNavigationBarHidden(true, for: navigationController, animated: animated)
    }

    private func shouldHideNavigationBar(for viewController: UIViewController) -> Bool {
        return viewController is DashPresenterViewController
    }

    private func setNavigationBarHidden(_ hidden: Bool, for navigationController: UINavigationController, animated: Bool) {
        navigationController.setNavigationBarHidden(hidden, animated: animated)
    }
}

// MARK: - DashboardControllerProtocolImplementation
extension DashPresenterViewController: DashboardControllerProtocolImplementation {
    
    
    func updateHomeAddress(with address: String) {
        
        if let viewAddrss = addressView as? AddressView {
            viewAddrss.updateAddress(address)
        } else {
            print("Error: viewAddrss is nil or not of type AddressViews.")
        }
    }
    

    
    func updateMainData(withPressureData pressure: Double) {
        if let view = coordinateView as? DasboardView {
            view.updatePressureData(pressure, settings: settings)
        } else {
            print("Error: coordinateView is nil or not of type DasboardView.")
        }
    }


    
    func customUpdatedSettigsData(with updatedSettings: [CellSetting]) {
        guard let _ = settings as? [CellSetting] else {
            print("Error: settings is nil or not of type [CellSetting].")
            return
        }
        settings = updatedSettings
    }

   
    
    func updateMapRegion(to region: MKCoordinateRegion) {
        if let mapView = mapView as? MKMapView {
            mapView.setRegion(region, animated: true)
        } else {
            print("Error: mapView is nil or not of type MKMapView.")
        }
    }

    
    
    func fetchLocationDataForDashboard(currentLocationData: CurrentGeoLocationData) {
        coordinateView.dataConfigs(data: currentLocationData, settings: settings)
    }
    
    
}
   


private extension DashPresenterViewController {
    
    private func performSetUpUIConstraints(bottomButtonStackView: UIStackView) {
        mapView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }

        scrollView.snp.makeConstraints { make in
            make.height.equalTo(300)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(20)
        }

//        scrollContainerView.snp.makeConstraints { make in
//            make.center.equalToSuperview()
//            make.height.equalTo(200)
//              make.width.equalTo(460)
//       }
        
        
        contentStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(200)
            
            let screenWidth = UIScreen.main.bounds.width
            
//            if UIDevice.current.userInterfaceIdiom == .pad {
//                if screenWidth >= 1024 {
//                    // iPad Pro 12.9"
//                    make.width.equalTo(900)
//                } else if screenWidth >= 834 {
//                    // iPad Pro 11" or iPad Air 10.5"
//                    make.width.equalTo(900)
//                } else if screenWidth >= 768 {
//                    // iPad 9.7", 10.2", 10.5"
//                    make.width.equalTo(500)
//                } else {
//                    // Other iPad sizes
//                    make.width.equalTo(900)
//                }
//            }
            
            
            if UIDevice.current.userInterfaceIdiom == .pad {
                   if screenWidth >= 1024 {
                       // iPad Pro 12.9"
                       make.width.equalTo(900)
                   } else if screenWidth >= 834 {
                       make.width.equalTo(900)
                   } else if screenWidth == 744 {
                       // iPad mini 6th generation
                       make.width.equalTo(800) // Adjust this value according to your needs
                   } else if screenWidth >= 768 {
                       // Other iPad sizes
                       make.width.equalTo(900)
                   } else {
                       // Default case for other iPad sizes if any
                       make.width.equalTo(900)
                   }
               }
            
            
            else {
                if screenWidth >= 430 {
                    // iPhone 14 Pro Max, 13 Pro Max, 12 Pro Max
                    make.width.equalTo(450)
                } else if screenWidth >= 390 {
                    // iPhone 14, 13, 13 Pro, 12, 12 Pro
                    make.width.equalTo(450)
                } else if screenWidth >= 375 {
                    // iPhone X, XS, 11 Pro, 12 Mini, 13 Mini
                    make.width.equalTo(450)
                } else {
                    // iPhone SE, iPhone 8, 7, 6s
                    make.width.equalTo(450)
                }
            }
        }


        


        coordinateView.snp.makeConstraints { make in
            make.width.equalTo(screenWidth <= 430 ? 280 : screenWidth * 0.5 - 32)
        }

        gpsIconButton.snp.makeConstraints { make in
            make.height.width.equalTo(60)
            make.leading.equalToSuperview().offset(8)
            make.bottom.equalTo(scrollView.snp.top).offset(-40)
        }

        compassButton.snp.makeConstraints { make in
            make.height.width.equalTo(60)
            make.trailing.equalToSuperview().offset(-8)
            make.bottom.equalTo(scrollView.snp.top).offset(-40)
        }

        addressView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.height.equalTo(44)
        }

        bottomButtonStackView.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(scrollView.snp.top).offset(30)
        }
    }
}
