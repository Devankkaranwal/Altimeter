//
//  CompassViewController.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 03.12.2023.
//


//import UIKit
//import SnapKit
//
//
//final class CompassVC: UIViewController {
//
//    // MARK: - Dependency
//
//    var compassPresenter: CompassPresentationProtocol?
//
//    // MARK: - Private properties
//
//    var compassSettings: [CellSetting] = []
//
//    // Assuming latitude and longitude are available in your context
//    let latitude: Double = 37.7749
//    let longitude: Double = -122.4194
//
//    // MARK: - UI Elements
//
//    private lazy var btnMap: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "mapIcon"), for: .normal)
//        button.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
//        return button
//    }()
//
//    private let lblCompass: UILabel = {
//        let label = UILabel()
//        label.text = "Compass"
//        label.textColor = .white
//        label.font = CustomFontManager.extraLarge
//        label.textAlignment = .center
//        label.numberOfLines = 0 // Allows label to expand vertically if needed
//        return label
//    }()
//
//    private let viewAddrss: AddressViews = {
//        let view = AddressViews()
//        return view
//    }()
//
////    private let lblAzimth: UILabel = {
////        let label = UILabel()
////       // label.text = "0° N"
////        label.text = "2557° WSNE"
////        label.font = CustomFontManager.xxlextraLarge
////        label.textColor = .white
////        label.textAlignment = .center
////        label.adjustsFontSizeToFitWidth = true
////        label.minimumScaleFactor = 0.5
////        return label
////    }()
////
//    private let lblAzimth: UILabel = {
//        let label = UILabel()
//        label.text = "255° WSNE"
//        label.font = CustomFontManager.xxlextraLarge
//        label.textColor = .white
//        label.textAlignment = .center
//        label.adjustsFontSizeToFitWidth = true
//        label.minimumScaleFactor = 0.5
//        label.numberOfLines = 0
//        label.lineBreakMode = .byWordWrapping
//        return label
//    }()
//
//
//
//    private lazy var btnArrowGrn: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "greenarrow"), for: .normal)
//        return button
//    }()
//
//
////
//
//
//    private lazy var viewComps: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFit // Change to scaleAspectFit
//        if UIDevice.current.userInterfaceIdiom == .phone {
//            imageView.image = UIImage(named: "CompassLineiphone") // Image for iPhone
//        } else {
//            imageView.image = UIImage(named: "ipadCompassLine") // Image for iPad
//        }
//        return imageView
//    }()
//
//
//
//    private lazy var btnDegree: UIImageView = {
//        let imageView = UIImageView()
//        imageView.contentMode = .scaleAspectFit // Change to scaleAspectFit
//        if UIDevice.current.userInterfaceIdiom == .phone {
//            imageView.image = UIImage(named: "degreeiphone") // Image for iPhone
//        } else {
//            imageView.image = UIImage(named: "degreeIpad") // Image for iPad
//        }
//        return imageView
//    }()
//
//
//
////    private lazy var degreeButton: UIButton = {
////        let button = UIButton()
////        button.setImage(UIImage(named: "degree"), for: .normal)
////        return button
////    }()
//
//    private let lblCordints: UILabel = {
//        let label = UILabel()
//        label.text = "Coordinates"
//        label.textColor = .white
//        label.font = CustomFontManager.regularLarge
//        //label.font = UIFont.boldSystemFont(ofSize: 15)
//        return label
//    }()
//
//    private let lblLatitd: UILabel = {
//        let label = UILabel()
//        label.text = "-8° 39’ 14.2786”S"
//        label.font = CustomFontManager.semiBoldMedium
//        label.textColor = .white
//        return label
//    }()
//
//    private let lblLongigt: UILabel = {
//        let label = UILabel()
//        label.text = "115° 8’ 6.1110”E"
//        label.font = CustomFontManager.semiBoldMedium
//        label.textColor = .white
//        return label
//    }()
//
//    private let viewInfos: UIView = {
//        let view = UIView()
////        view.backgroundColor = .darkGray
////        view.layer.cornerRadius = 32
//        return view
//    }()
//
//    private let viewCont: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.spacing = 8
//        stackView.distribution = .equalSpacing
//        return stackView
//    }()
//
//    private let stackViewIcn: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.spacing = 8
//        stackView.distribution = .equalSpacing
//        return stackView
//    }()
//
//    private let iconGPS: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "GPCIcon")
//        imageView.contentMode = .scaleAspectFit
//        return imageView
//    }()
//
//    private let btnCompss: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "compassButtonIcon"), for: .normal)
//        return button
//    }()
//
//    private let btnDash: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "menuButtonIcon"), for: .normal)
//        return button
//    }()
//
//    // MARK: - Life cycle
//
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        compassPresenter?.configureCompassData(CellSettingInfo.allCases)
////        compassPresenter?.modifyRotationAngleFromSensor()
////        compassPresenter?.retrieveAzimuthDataFromSensor()
////        compassPresenter?.fetchLocationInformation(compassSett)
////        compassPresenter?.fetchAddressInformation()
////
////        ConstUI()
////
////        NotificationCenter.default.addObserver(self,
////                                               selector: #selector(handleConnectivityChange(notification:)),
////                                               name: NSNotification.Name.connectivityStatusChanged,
////                                               object: nil)
////    }
////
////
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        guard let presenter = compassPresenter else {
//            // Handle the case where compassPresenter is nil
//            return
//        }
//
//        presenter.configureCompassData(CellSettingInfo.allCases)
//        presenter.modifyRotationAngleFromSensor()
//        presenter.updateAzimuthData()
//        presenter.fetchLocationInformation(compassSettings)
//        presenter.fetchAddressInformation()
//
//        ConstUI()
//
////        NotificationCenter.default.addObserver(self,
////                                               selector: #selector(handleConnectivityChange(notification:)),
////                                               name: NSNotification.Name.connectivityStatusChanged,
////                                               object: nil)
//
//
//
//        NotificationCenter.default.addObserver(self,
//                                                       selector: #selector(handleConnectivityChange(notification:)),
//                                                       name: .connectivityStatusChanged,
//                                                       object: nil)
//                ElevatedInternetConnectionService.shared.initiateNetworkMonitoring()
//
//    }
//
//
//    // MARK: - Private Methods
//
//    private func ConstUI() {
//
//        view.backgroundColor = UIColor(hex: "#2C2C2C")
//        stackViewIcn.addArrangedSubview(iconGPS)
//        stackViewIcn.addArrangedSubview(btnCompss)
//        stackViewIcn.addArrangedSubview(btnDash)
//
//        viewCont.addArrangedSubview(lblCordints)
//        viewCont.addArrangedSubview(lblLatitd)
//        viewCont.addArrangedSubview(lblLongigt)
//
//        viewInfos.addSubview(viewCont)
//        viewInfos.addSubview(viewAddrss)
//
//        view.addSubview(btnMap)
//        view.addSubview(lblCompass)
//        view.addSubview(stackViewIcn)
//        view.addSubview(lblAzimth)
//        view.addSubview(btnArrowGrn)
//        view.addSubview(viewComps)
//        view.addSubview(btnDegree)
//        view.addSubview(viewInfos)
//
//        setConstraintsUI()
//    }
//
//    // MARK: - Actions
//
//
//
//    @objc
//        private func handleConnectivityChange(notification: Notification) {
//            guard let userInfo = notification.userInfo,
//                  let isConnected = userInfo["connectionStatus"] as? Bool else {
//                return
//            }
//
//            if isConnected {
//                print("Connected")
//                dismissNoInternetAlert()
//            } else {
//                print("Disconnected")
//                displayNoInternetAlert(title: "No Internet Connection", message: "Please check your internet connection and try again.")
//            }
//        }
//
//        private func displayNoInternetAlert(title: String, message: String) {
//            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//            let retryAction = UIAlertAction(title: "Retry", style: .default) { [weak self] _ in
//                self?.handleRetryAfterDelay()
//            }
//            alertController.addAction(retryAction)
//            present(alertController, animated: true, completion: nil)
//        }
//
//        private func dismissNoInternetAlert() {
//            if let presentedVC = self.presentedViewController, presentedVC is UIAlertController {
//                presentedVC.dismiss(animated: true, completion: nil)
//            }
//        }
//
//        private func handleRetryAfterDelay() {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                ElevatedInternetConnectionService.shared.initiateNetworkMonitoring()
//            }
//        }
//
//    @objc private func dismissViewController() {
//        let data = Int.random(in: 0...550)
//        dismiss(animated: true)
//    }
//
//
//
//}
//
//// MARK: - CompassViewControllerProtocol
//
//extension CompassVC: CompassViewInteractionProtocol {
//
//
//
//    func modifyAddressData(_ address: String) {
//        if let viewAddrss = viewAddrss as? AddressViews {
//            // Perform the desired action here instead of modifyAddressData
//            viewAddrss.addSetData(address)
//        } else {
//            print("Error: viewAddrss is nil or not of type AddressViews.")
//            // Handle the nil or wrong type case appropriately
//        }
//    }
//
//
//
//
//
//    func applySettingsToCompass(_ settings: [CellSetting]) {
//        // Add validation logic if needed.
//        guard !settings.isEmpty else {
//            print("Settings array is empty.")
//            return
//        }
//
//        // Assign the settings to the compass settings property.
//        self.compassSettings = settings
//    }
//
//
//
//
//
//
//    func prefix_applyTransform_suffix(_ transform: CGAffineTransform) {
//       // logTransformation(transform)
//        executeAnimation {
//            self.viewComps.transform = transform
//        }
//    }
//
//
//    private func executeAnimation(using block: @escaping () -> Void) {
//        UIView.animate(withDuration: 0.25, animations: block)
//    }
//
//
//
//
//    // Conversion function outside of modifyAzimuthData for better readability and reuse
//    private func convertAzimuthToString(_ azimuth: Double) -> String {
//        switch azimuth {
//        case 0..<22.5, 337.5...360:
//            return "\(String(Int(azimuth)))° N"
//        case 22.5..<67.5:
//            return "\(String(Int(azimuth)))° NE"
//        case 67.5..<112.5:
//            return "\(String(Int(azimuth)))° E"
//        case 112.5..<157.5:
//            return "\(String(Int(azimuth)))° SE"
//        case 157.5..<202.5:
//            return "\(String(Int(azimuth)))° S"
//        case 202.5..<247.5:
//            return "\(String(Int(azimuth)))° SW"
//        case 247.5..<292.5:
//            return "\(String(Int(azimuth)))° W"
//        case 292.5..<337.5:
//            return "\(String(Int(azimuth)))° NW"
//        default:
//            return ""
//        }
//    }
//
//    func modifyAzimuthData(azimuth: Double) {
//        lblAzimth.text = convertAzimuthToString(azimuth)
//    }
//
//
//
//
//    func modifyLocationInformation(data: CurrentGeoLocationData, _ settings: [CellSetting]) {
//        guard settings.count > 1 else {
//            print("Error: Insufficient settings provided.")
//            return
//        }
//
//        let latitudeSetting = settings[1].val
//        let longitudeSetting = settings[1].val
//
//        lblLatitd.text = String.formattedCoordinateString(
//            index: latitudeSetting,
//            data.latitude,
//            type: .latitude
//        )
//
//        lblLongigt.text = String.formattedCoordinateString(
//            index: longitudeSetting,
//            data.longitude,
//            type: .longitude
//        )
//    }
//
//
//
//}
//
//// MARK: - Constraints
//
//private extension CompassVC {
//    func setConstraintsUI() {
//
//            btnMap.snp.makeConstraints { make in
//                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
//                make.leading.equalToSuperview().offset(16)
//                make.height.width.equalTo(32)
//            }
//
//            lblCompass.snp.makeConstraints { make in
//                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(22)
//                make.centerX.equalToSuperview()
//            }
//
//        viewAddrss.snp.makeConstraints { make in
//                make.top.equalTo(lblCompass.snp.bottom).offset(20)
//                make.leading.trailing.equalToSuperview().inset(16)
//            }
//
//            stackViewIcn.snp.makeConstraints { make in
//                make.top.equalTo(viewAddrss.snp.bottom).offset(8)
//                make.centerX.equalToSuperview()
//            }
//
//    //        azimuthLabel.snp.makeConstraints { make in
//    //            make.centerX.equalToSuperview()
//    //
//    //        }
//
//            lblAzimth.snp.makeConstraints { make in
//                if UIDevice.current.userInterfaceIdiom == .phone {
//                    make.centerX.equalToSuperview()// Set height for iPhone
//                    make.leading.equalToSuperview().offset(10) // Adjust the offset as needed
//                    make.trailing.equalToSuperview().offset(-10)
//                } else {
//                    make.centerX.equalToSuperview()
//                    make.centerY.equalToSuperview()// Set height for iPad
//                }
//
//
//            }
//
//
//
//            btnArrowGrn.snp.makeConstraints { make in
//                make.centerX.equalToSuperview()
//                make.top.equalTo(lblAzimth.snp.bottom).offset(30)
//            }
//
//            viewComps.snp.makeConstraints { make in
//                make.top.equalTo(btnArrowGrn.snp.bottom).offset(8)
//                make.leading.equalToSuperview().offset(10)
//                make.trailing.equalToSuperview().offset(-10)
//
//                if UIDevice.current.userInterfaceIdiom == .phone {
//                    make.height.equalTo(80) // Set height for iPhone
//                } else {
//                    make.height.equalTo(150) // Set height for iPad
//                }
//            }
//
//            btnDegree.snp.makeConstraints { make in
//                make.top.equalTo(viewComps.snp.bottom).offset(3)
//                make.leading.equalToSuperview().offset(10)
//                make.trailing.equalToSuperview().offset(-10)
//
//                if UIDevice.current.userInterfaceIdiom == .phone {
//                    make.height.equalTo(30) // Set height for iPhone
//                } else {
//                    make.height.equalTo(50) // Set height for iPad
//                }
//            }
//
//            viewInfos.snp.makeConstraints { make in
//                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(16)
//                make.leading.trailing.equalToSuperview().inset(16)
//            }
//
//            // Remove coordinatesLabel, latitudeLabel, and longitudeLabel from infoView
//            lblCordints.removeFromSuperview()
//            lblLatitd.removeFromSuperview()
//            lblLongigt.removeFromSuperview()
//
//            // Add coordinatesLabel to the view and center it horizontally
//            view.addSubview(lblCordints)
//
//        lblCordints.snp.makeConstraints { make in
//                make.centerX.equalToSuperview() // Center horizontally
//                make.top.equalTo(btnDegree.snp.bottom).offset(50)
//            }
//
//            // Add latitudeLabel and longitudeLabel to the view
//            view.addSubview(lblLatitd)
//        lblLatitd.snp.makeConstraints { make in
//                make.top.equalTo(lblCordints.snp.bottom).offset(12)
//                make.centerX.equalToSuperview()
//            }
//
//            view.addSubview(lblLongigt)
//        lblLongigt.snp.makeConstraints { make in
//                make.top.equalTo(lblLatitd.snp.bottom).offset(8)
//                make.centerX.equalToSuperview()
//                make.bottom.equalToSuperview().offset(-45)
//            }
//    }
//}




import UIKit
import SnapKit

final class CompassVC: UIViewController {

    // MARK: - Dependency

    var compassPresenter: CompassPresentationProtocol?

    // MARK: - Private properties

    var compassSettings: [CellSetting] = []

    // Assuming latitude and longitude are available in your context
    let latitude: Double = 37.7749
    let longitude: Double = -122.4194

    // MARK: - UI Elements

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()

    private lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()

    private lazy var btnMap: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "mapIcon"), for: .normal)
        button.addTarget(self, action: #selector(dismissViewController), for: .touchUpInside)
        return button
    }()

    private let lblCompass: UILabel = {
        let label = UILabel()
        label.text = "Compass"
        label.textColor = .white
        label.font = CustomFontManager.extraLarge
        label.textAlignment = .center
        label.numberOfLines = 0 // Allows label to expand vertically if needed
        return label
    }()

    private let viewAddrss: AddressViews = {
        let view = AddressViews()
        return view
    }()

    private let lblAzimth: UILabel = {
        let label = UILabel()
        label.text = "256777° W"
       // label.text = "O° N"
        label.font = CustomFontManager.xxlextraLarge
        label.textColor = .white
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()

    private lazy var btnArrowGrn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "greenarrow"), for: .normal)
        return button
    }()

    private lazy var viewComps: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        if UIDevice.current.userInterfaceIdiom == .phone {
            imageView.image = UIImage(named: "CompassLineiphone") // Image for iPhone
        } else {
            imageView.image = UIImage(named: "ipadCompassLine") // Image for iPad
        }
        return imageView
    }()

    private lazy var btnDegree: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        if UIDevice.current.userInterfaceIdiom == .phone {
            imageView.image = UIImage(named: "degreeiphone") // Image for iPhone
        } else {
            imageView.image = UIImage(named: "degreeIpad") // Image for iPad
        }
        return imageView
    }()

    private let lblCordints: UILabel = {
        let label = UILabel()
        label.text = "Coordinates"
        label.textColor = .white
        label.font = CustomFontManager.regularLarge
        return label
    }()

    private let lblLatitd: UILabel = {
        let label = UILabel()
        label.text = "-8° 39’ 14.2786”S"
        label.font = CustomFontManager.semiBoldMedium
        label.textColor = .white
        return label
    }()

    private let lblLongigt: UILabel = {
        let label = UILabel()
        label.text = "115° 8’ 6.1110”E"
        label.font = CustomFontManager.semiBoldMedium
        label.textColor = .white
        return label
    }()

    private let viewInfos: UIView = {
        let view = UIView()
        return view
    }()

    private let viewCont: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .equalSpacing
        return stackView
    }()

    private let stackViewIcn: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .equalSpacing
        return stackView
    }()

    private let iconGPS: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "GPCIcon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let btnCompss: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "compassButtonIcon"), for: .normal)
        return button
    }()

    private let btnDash: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "menuButtonIcon"), for: .normal)
        return button
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let presenter = compassPresenter else {
            // Handle the case where compassPresenter is nil
            return
        }
        
        presenter.configureCompassData(CellSettingInfo.allCases)
        presenter.modifyRotationAngleFromSensor()
        presenter.updateAzimuthData()
        presenter.fetchLocationInformation(compassSettings)
        presenter.fetchAddressInformation()
      
        ConstUI()
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleConnectivityChange(notification:)),
                                               name: .connectivityStatusChanged,
                                               object: nil)
        ElevatedInternetConnectionService.shared.initiateNetworkMonitoring()
    }

    // MARK: - Private Methods

    private func ConstUI() {
        view.backgroundColor = UIColor(hex: "#2C2C2C")
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubview(btnMap)
        contentView.addSubview(lblCompass)
        contentView.addSubview(stackViewIcn)
        contentView.addSubview(lblAzimth)
        contentView.addSubview(btnArrowGrn)
        contentView.addSubview(viewComps)
        contentView.addSubview(btnDegree)
        contentView.addSubview(viewInfos)
        
        stackViewIcn.addArrangedSubview(iconGPS)
        stackViewIcn.addArrangedSubview(btnCompss)
        stackViewIcn.addArrangedSubview(btnDash)
        
        viewCont.addArrangedSubview(lblCordints)
        viewCont.addArrangedSubview(lblLatitd)
        viewCont.addArrangedSubview(lblLongigt)
        
        contentView.addSubview(lblCordints)
        contentView.addSubview(lblLatitd)   
        contentView.addSubview(lblLongigt)

        viewInfos.addSubview(viewCont)
        viewInfos.addSubview(viewAddrss)
        
        
//        viewInfos.backgroundColor = UIColor.red
//        contentView.backgroundColor = UIColor.yellow
//        scrollView.backgroundColor = UIColor.green
        
        
//        setConstraintsUI()
        
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            setConstraintsUIForiPhone()
                          
            } else {
            setConstraintsUIForiPad()
                          
            }
        
        
    }

    // MARK: - Actions

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

    @objc private func dismissViewController() {
        let data = Int.random(in: 0...550)
        dismiss(animated: true)
    }
}

// MARK: - CompassViewControllerProtocol

extension CompassVC: CompassViewInteractionProtocol {
    
    
    private func convertAzimuthToString(_ azimuth: Double) -> String {
         switch azimuth {
         case 0..<22.5, 337.5...360:
             return "\(String(Int(azimuth)))° N"
         case 22.5..<67.5:
             return "\(String(Int(azimuth)))° NE"
         case 67.5..<112.5:
             return "\(String(Int(azimuth)))° E"
         case 112.5..<157.5:
             return "\(String(Int(azimuth)))° SE"
         case 157.5..<202.5:
             return "\(String(Int(azimuth)))° S"
         case 202.5..<247.5:
             return "\(String(Int(azimuth)))° SW"
         case 247.5..<292.5:
             return "\(String(Int(azimuth)))° W"
         case 292.5..<337.5:
             return "\(String(Int(azimuth)))° NW"
         default:
             return ""
         }
     }
    
    
    
    func modifyAzimuthData(azimuth: Double) {
        lblAzimth.text = convertAzimuthToString(azimuth)
    }
    
    func modifyLocationInformation(data: CurrentGeoLocationData, _ settings: [CellSetting]) {
        guard settings.count > 1 else {
                print("Error: Insufficient settings provided.")
                return
            }
    
            let latitudeSetting = settings[1].val
            let longitudeSetting = settings[1].val
    
            lblLatitd.text = String.formattedCoordinateString(
                index: latitudeSetting,
                data.latitude,
                type: .latitude
            )
    
            lblLongigt.text = String.formattedCoordinateString(
                index: longitudeSetting,
                data.longitude,
                type: .longitude
            )
    }
    

    func modifyAddressData(_ address: String) {
        if let viewAddrss = viewAddrss as? AddressViews {
            viewAddrss.addSetData(address)
        } else {
            print("Error: viewAddrss is nil or not of type AddressViews.")
        }
    }

    func applySettingsToCompass(_ settings: [CellSetting]) {
        guard !settings.isEmpty else {
            print("Settings array is empty.")
            return
        }
        
        self.compassSettings = settings
    }

    func prefix_applyTransform_suffix(_ transform: CGAffineTransform) {
        executeAnimation {
            self.viewComps.transform = transform
        }
    }

    private func executeAnimation(_ animations: @escaping () -> Void) {
        UIView.animate(withDuration: 0.3,
                       delay: 0.0,
                       options: .curveEaseInOut,
                       animations: animations,
                       completion: nil)
    }

    // Additional protocol methods can be added here
}

// MARK: - Constraints




private extension CompassVC {
    
    
    func setConstraintsUIForiPhone() {
        
                    scrollView.snp.makeConstraints { make in
                        make.edges.equalTo(view.safeAreaLayoutGuide)
                    }
        
                    contentView.snp.makeConstraints { make in
                        make.edges.equalTo(scrollView)
                        make.width.equalTo(scrollView)
                    }
        
                    btnMap.snp.makeConstraints { make in
                        make.top.equalToSuperview().offset(16)
                        make.leading.equalToSuperview().offset(16)
                        make.height.width.equalTo(32)
                    }
        
                    lblCompass.snp.makeConstraints { make in
                        make.top.equalToSuperview().offset(22)
                        make.centerX.equalToSuperview()
                    }
        
                    viewAddrss.snp.makeConstraints { make in
                        make.top.equalTo(lblCompass.snp.bottom).offset(20)
                        make.leading.trailing.equalToSuperview().inset(16)
                    }
        
                    stackViewIcn.snp.makeConstraints { make in
                        make.centerX.equalToSuperview()
                        if UIDevice.current.userInterfaceIdiom == .phone {
                            make.top.equalTo(viewAddrss.snp.bottom).offset(8)
                        } else {
                            make.top.equalTo(viewAddrss.snp.bottom).offset(16) // Adjust for iPad
                            make.leading.trailing.equalToSuperview().inset(20) // Additional constraints for iPad
                        }
                    }
        
                    lblAzimth.snp.makeConstraints { make in
                        make.top.equalTo(stackViewIcn.snp.bottom).offset(10)
                        make.centerX.equalToSuperview()
                        make.leading.trailing.equalToSuperview().inset(10)
                    }
        
                    btnArrowGrn.snp.makeConstraints { make in
                        make.top.equalTo(lblAzimth.snp.bottom).offset(30)
                        make.centerX.equalToSuperview()
                    }
        
                    viewComps.snp.makeConstraints { make in
                        make.top.equalTo(btnArrowGrn.snp.bottom).offset(8)
                        make.leading.trailing.equalToSuperview().inset(10)
                        make.height.equalTo(80) // Adjust height as needed
                    }
        
                    btnDegree.snp.makeConstraints { make in
                        make.top.equalTo(viewComps.snp.bottom).offset(3)
                        make.leading.equalToSuperview().offset(10)
                        make.trailing.equalToSuperview().offset(-10)
                        if UIDevice.current.userInterfaceIdiom == .phone {
                            make.height.equalTo(30) // Set height for iPhone
                        } else {
                            make.height.equalTo(50) // Set height for iPad
                        }
                    }
        
                    // Add the bottom constraint to the contentView to ensure it scrolls
                    let bottomSpacer = UIView()
                    contentView.addSubview(bottomSpacer)
        
                    lblCordints.snp.makeConstraints { make in
                        make.top.equalTo(btnDegree.snp.bottom).offset(50)
                        make.centerX.equalToSuperview()
                    }
        
                    lblLatitd.snp.makeConstraints { make in
                        make.top.equalTo(lblCordints.snp.bottom).offset(12)
                        make.centerX.equalToSuperview()
                    }
        
                    lblLongigt.snp.makeConstraints { make in
                        make.top.equalTo(lblLatitd.snp.bottom).offset(8)
                        make.centerX.equalToSuperview()
                    }
        
                    viewInfos.snp.makeConstraints { make in
                        make.top.equalTo(lblLongigt.snp.bottom).offset(16)
                        make.leading.trailing.equalToSuperview().inset(16)
                    }
        
                    bottomSpacer.snp.makeConstraints { make in
                        make.top.equalTo(viewInfos.snp.bottom)
                        make.leading.trailing.equalToSuperview()
                        make.height.equalTo(16)
                        make.bottom.equalToSuperview() // Ensures the scroll view content size is correctly set
                    }
        
    }
    
    
    func setConstraintsUIForiPad() {
//
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }

        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.equalTo(scrollView)
            // Adjust height constraint if needed to ensure content view expands for scrolling
        }

        btnMap.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
            make.height.width.equalTo(32)
        }

        lblCompass.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(22)
            make.centerX.equalToSuperview()
        }

        viewAddrss.snp.makeConstraints { make in
            make.top.equalTo(lblCompass.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        stackViewIcn.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            if UIDevice.current.userInterfaceIdiom == .phone {
                make.top.equalTo(viewAddrss.snp.bottom).offset(8)
            } else {
                // make.top.equalTo(viewAddrss.snp.bottom).offset(16) // Adjust for iPad
                make.leading.trailing.equalToSuperview().inset(20) // Additional constraints for iPad
            }
        }

        lblAzimth.snp.makeConstraints { make in
          //  make.top.equalTo(stackViewIcn.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
        }

        btnArrowGrn.snp.makeConstraints { make in
            make.top.equalTo(lblAzimth.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }

        viewComps.snp.makeConstraints { make in
            make.top.equalTo(btnArrowGrn.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(80) // Adjust height as needed
        }

        btnDegree.snp.makeConstraints { make in
            make.top.equalTo(viewComps.snp.bottom).offset(3)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            if UIDevice.current.userInterfaceIdiom == .phone {
                make.height.equalTo(30) // Set height for iPhone
            } else {
                make.height.equalTo(50) // Set height for iPad
            }
        }

        lblCordints.snp.makeConstraints { make in
            make.top.equalTo(btnDegree.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
        }

        lblLatitd.snp.makeConstraints { make in
            make.top.equalTo(lblCordints.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }

        lblLongigt.snp.makeConstraints { make in
            make.top.equalTo(lblLatitd.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
        }

        // Wrap the coordinates in a view to handle the bottom spacing
        let coordinatesContainer = UIView()
        contentView.addSubview(coordinatesContainer)
        coordinatesContainer.addSubview(lblCordints)
        coordinatesContainer.addSubview(lblLatitd)
        coordinatesContainer.addSubview(lblLongigt)

        coordinatesContainer.snp.makeConstraints { make in
            make.top.equalTo(btnDegree.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-45)
        }

        lblCordints.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }

        lblLatitd.snp.makeConstraints { make in
            make.top.equalTo(lblCordints.snp.bottom).offset(12)
            make.centerX.equalToSuperview()
        }

        lblLongigt.snp.makeConstraints { make in
            make.top.equalTo(lblLatitd.snp.bottom).offset(8)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview()
        }

        viewInfos.snp.makeConstraints { make in
            make.top.equalTo(coordinatesContainer.snp.bottom).offset(16)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        // Ensure the bottom constraint of contentView includes viewInfos
        contentView.snp.makeConstraints { make in
            make.bottom.equalTo(scrollView.snp.bottom).offset(16)
        }
        
        
       
        
        
    }
    
}
