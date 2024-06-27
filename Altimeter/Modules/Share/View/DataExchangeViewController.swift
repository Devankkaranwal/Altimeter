//
//  ShareDataViewCon.swift
//  Altimeter
//
//



import UIKit
import AVFoundation
import Photos

final class DataExchangeViewController: UIViewController, DataShareViewInteraction {

    func changeAddress(_ address: String) {
        guard !address.isEmpty else {
            // Handle the case where the address is empty.
            print("Error: Empty address provided.")
            return
        }
        self.address = address
    }


    // Update the currentLocationData property with the provided data if it's valid
    func updateCurrentLocationData(with data: CurrentGeoLocationData?) {
        guard let newData = data else {
            print("Error: Invalid or nil location data.")
            return
        }
        currentLocationData = newData
    }

    
    // Update the address property with the provided address string
    func updateAddress(_ address: String) {
        guard !address.isEmpty else {
            print("Error: Address cannot be empty.")
            return
        }
        self.address = address
    }

    
    

    func initializeLocationSettings(_ settings: [CellSetting]) {
        guard !settings.isEmpty else {
            // Handle the case where settings array is empty.
            print("Error: Empty settings array.")
            return
        }
        
        // Validate settings array or perform additional checks if needed.

        // Set the locationSettings property to the provided settings array.
        self.locationSettings = settings
    }
    
    

    
    func presentCurrentLocationData(currentLocationData: CurrentGeoLocationData) {
        // Optional: Add validation if needed.
        guard dataValid(currentLocationData) else {
            // Handle invalid location data.
            print("Error: Invalid current location data.")
            return
        }
        
        // Set the currentLocationData property to the provided data.
        self.currentLocationData = currentLocationData
    }
    
//    func dataValid(_ locationData: CurrentGeoLocationData) -> Bool {
//        // Add validation logic here.
//        // For example, check if essential properties are not nil or have valid values.
//        return true // Placeholder, replace with actual validation logic.
//    }
//
    
    func dataValid(_ locationData: CurrentGeoLocationData) -> Bool {
        if locationData.latitude >= -90 && locationData.latitude <= 90,
           locationData.longitude >= -180 && locationData.longitude <= 180,
           locationData.altitude >= 0 {
            return true
        } else {
            return false
        }
    }



    
  
    // MARK: - Dependency
    var presenter: DataSharePresenterLogic?

    // MARK: - Private properties
    private let imagePicker = UIImagePickerController()
    private var screenWight = CGFloat()
    private var currentLocationData: CurrentGeoLocationData?
    private var locationSettings: [CellSetting] = []
    private var address: String = ""
    private var isHasImage = false

    // MARK: - UI Elements
    private let photoCardContainerView = UIStackView()
    private var cardSharePhoto = PhotoShareView()

    
    
    private let viewAddPhoto: UIView = {
        let view = UIView()
        //view.layer.borderColor = UIColor.g
        return view
    }()

    private lazy var viewContButtn: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 32
        stackView.axis = .horizontal
        stackView.contentMode = .center
        stackView.distribution = .fillEqually
        return stackView
    }()

    
    @objc private let btnPhotoShr: UIButton = {
        var config = UIButton.Configuration.plain()
        let button = UIButton()
        config.baseForegroundColor = UIColor.white
        config.title = "Photo"
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "SFProDisplaySemibold", size: 15) ?? UIFont.boldSystemFont(ofSize: 15),
            .foregroundColor: UIColor.white
        ]
        button.setAttributedTitle(NSAttributedString(string: "Photo", attributes: attributes), for: .normal)
        
        config.imagePadding = 8
        config.contentInsets = .init(top: 12, leading: 32, bottom: 12, trailing: 32)
        button.configuration = config
        return button
    }()

    

    private let btnLocationshr: UIButton = {
        var config = UIButton.Configuration.plain()
        let button = UIButton()
        config.baseForegroundColor = UIColor.white
        config.title = "Location"
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "SFProDisplaySemibold", size: 15) ?? UIFont.boldSystemFont(ofSize: 15),
            .foregroundColor: UIColor.white
        ]
        button.setAttributedTitle(NSAttributedString(string: "Location", attributes: attributes), for: .normal)
//        config.image = UIImage(named: "locationIcon")
        config.imagePadding = 8
        config.contentInsets = .init(top: 12, leading: 32, bottom: 12, trailing: 32)
        button.configuration = config
        return button
    }()



    private let underlineView1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.green
        return view
    }()

    private let underlineView2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.green
        return view
    }()



    private lazy var btnAddPhtos: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.green.cgColor
        button.setTitle("Add Photo", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(btnAddPhotos), for: .touchUpInside)
        
        // Set the font of the button's title label
        button.titleLabel?.font = UIFont(name: "SFProDisplaySemibold", size: 15)
        
        return button
    }()



    // MARK: - Life cycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        presenter?.fetchSettingsData(CellSettingInfo.allCases)
//        presenter?.retrieveCurrentLocation(settings: locationSettings)
//        presenter?.fetchAddressSettingData()
//        ConstaintUI()
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        manufactureDataReUnion()
        ConstaintUI()
       
    }


    
    private func manufactureDataReUnion() {
        presenter?.fetchSettingsData(CellSettingInfo.allCases)
//        handleLocationTasksIfNeeded()
        retrieveCurrentLocation()
        presenter?.fetchAddressSettingData()
        //fetchAddressSettingDataIfNeeded()
    }
    
    

//    private func handleLocationTasksIfNeeded() {
//        retrieveCurrentLocation()
//        fetchAddressSettingDataIfNeeded()
//    }

    
    

//    private func fetchSettingsData() {
//        presenter?.fetchSettingsData(CellSettingInfo.allCases)
//    }
    

    
    private func retrieveCurrentLocation() {
       
        presenter?.fetchAndPresentCurrentLocationData(with: locationSettings) { locationData in
            // Handle the fetched location data here
            if let locationData = locationData {
                // Use the fetched location data
            } else {
                // Handle the case where location data is nil or fetching failed
            }
        }

        
    }

    
    

//    private func fetchAddressSettingDataIfNeeded() {
//        presenter?.fetchAddressSettingData()
//    }

    private func fetchAddressSettingDataIfNeeded() {
        // This function fetches address setting data if needed.
        let days = Int.random(in: 0...365)
        presenter?.fetchAddressSettingData()
    }


    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Show the navigation bar when the view is about to appear.
        navigationController?.setNavigationBarHidden(false, animated: true)
    }




}

// MARK: - Private Methods
private extension DataExchangeViewController {


    func ConstaintUI() {
        SettNabBr()

        view.backgroundColor = UIColor(hex: "#2C2C2C")


        photoCardContainerView.axis = .vertical
            photoCardContainerView.spacing = 10
            view.addSubview(photoCardContainerView)
            photoCardContainerView.snp.makeConstraints { make in
                make.top.equalTo(view.snp.top).offset(200)
                make.leading.equalTo(view.snp.leading).offset(20)
                make.trailing.equalTo(view.snp.trailing).offset(-20)
            }
        

        viewContButtn.addArrangedSubview(btnPhotoShr)
        viewContButtn.addArrangedSubview(btnLocationshr)

        view.addSubview(viewContButtn)
        view.addSubview(underlineView1)
        view.addSubview(underlineView2)
        view.addSubview(btnAddPhtos)
        view.addSubview(btnLocationshr)
        view.addSubview(btnPhotoShr)

        screenWight = UIScreen.main.bounds.width
        LayoutsViewUI()
    }


    
    
    func SettNabBr() {
        let customFont = UIFont(name: "SFProDisplaySemibold", size: 25) ?? UIFont.boldSystemFont(ofSize: 25)
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: customFont
        ]
        
        title = txtDataLoclzed.ScrnShre.share
        navigationController?.navigationBar.tintColor = .white
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.titleTextAttributes = titleAttributes
        appearance.backgroundColor = UIColor(hex: "#2C2C2C")
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "cameraIcon"),
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(btnCameraPressed))
    }

    

    func permissionReqCamera() {
        AVCaptureDevice.requestAccess(for: .video,
                                      completionHandler: { accessGranted in
            guard accessGranted == true else { return }
            self.CamersPrst()
        })
    }

    func CamersPrst() {
        DispatchQueue.main.async {
            self.imagePicker.delegate = self
            self.imagePicker.sourceType = .camera
            self.imagePicker.allowsEditing = false
            self.present(self.imagePicker, animated: true, completion: nil)
        }
    }

    func CameraAlert() {
        let settingsAppURL = URL(string: UIApplication.openSettingsURLString)!
        let alert = UIAlertController(
            title: txtDataLoclzed.ScrnShre.alertShareCam.shareCameraAlertTitle,
            message: txtDataLoclzed.ScrnShre.alertShareCam.shareCameraAlertMessage,
            preferredStyle: UIAlertController.Style.alert
        )
        alert.addAction(UIAlertAction(title: txtDataLoclzed.ScrnShre.alertShareCam.shareAlertCancel,
                                      style: .default,
                                      handler: nil))
        alert.addAction(UIAlertAction(title: txtDataLoclzed.ScrnShre.alertShareCam.shareAllowCamera,
                                      style: .cancel,
                                      handler: { (alert) -> Void in
            UIApplication.shared.open(settingsAppURL, options: [:], completionHandler: nil)
        }))
        present(alert, animated: true, completion: nil)
    }
}

// MARK: - Actions
private extension DataExchangeViewController {

    @objc func btnAddPhotos() {
        let photoAuthorizationStatus = PHPhotoLibrary.authorizationStatus()
        switch photoAuthorizationStatus {
        case .notDetermined:
            PHPhotoLibrary.requestAuthorization({ (newStatus) in
                if newStatus == PHAuthorizationStatus.authorized {
                    DispatchQueue.main.async {
                        self.ImagePickershow()
                    }
                }
            })
        case .authorized:
            ImagePickershow()
        case .restricted, .denied:
            PhtoAlertAccess()
        @unknown default:
            break
        }
    }

    func ImagePickershow() {
        DispatchQueue.main.async {
            if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
                self.imagePicker.delegate = self
                self.imagePicker.sourceType = .savedPhotosAlbum
                self.imagePicker.allowsEditing = false
                self.present(self.imagePicker, animated: true)
            }
        }
    }

    func PhtoAlertAccess() {
        let settingsAppURL = URL(string: UIApplication.openSettingsURLString)!
        let alert = UIAlertController(
            title: "Altimeter Would Like to Access Your Photos",
            message: "App requires access to your photo library to let you browse your albums.",
            preferredStyle: UIAlertController.Style.alert
        )
        alert.addAction(UIAlertAction(title: "Select Photos...", style: .default, handler: { (_) in
            UIApplication.shared.open(settingsAppURL, options: [:], completionHandler: nil)
        }))
        alert.addAction(UIAlertAction(title: "Don't Allow", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    @objc func btnPhotoShr(_ sender: UIButton) {

        print("select the sharePhotoButtonPressed ")
        let sharedImage = self.cardSharePhoto.performShotsSnap() ?? UIView()
        let activityViewController = UIActivityViewController(activityItems: [sharedImage],
                                                              applicationActivities: nil)
        if UIDevice.current.userInterfaceIdiom == .pad {
            activityViewController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
            activityViewController.popoverPresentationController?.sourceView = sender
            activityViewController.popoverPresentationController?.sourceRect = sender.bounds
        }
        self.present(activityViewController, animated: true, completion: nil)
    }


    
    @objc func btnLocationShr(_ sender: UIButton) {
            print("Location button pressed")
            guard let locationData = self.currentLocationData else { return }
            let altimeterVC = constructAltimeterModule.generateAltimeterModule(locationData: (latitude: "\(locationData.latitude)",
                                                                                   longitude: "\(locationData.longitude)",
                                                                                   altitude: "\(locationData.altitude)"),
                                                                     address: self.address)
            navigationController?.pushViewController(altimeterVC, animated: true)
        }



    @objc func dismissPopup(_ sender: UITapGestureRecognizer) {
        if let dimmingView = view.viewWithTag(100) {
            dimmingView.removeFromSuperview()
        }

        if let popupView = view.subviews.first(where: { $0 is AltimeterPopupView }) {
            popupView.removeFromSuperview()
        }
    }

    @objc func btnCameraPressed() {
        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: .video)

        switch cameraAuthorizationStatus {
        case .denied: CameraAlert()
        case .authorized: CamersPrst()
        case .restricted: break
        case .notDetermined: permissionReqCamera()
        @unknown default: break
        }
    }
}

// MARK: - Constraints
private extension DataExchangeViewController {

    func LayoutsViewUI() {
           btnAddPhtos.translatesAutoresizingMaskIntoConstraints = false
            btnPhotoShr.translatesAutoresizingMaskIntoConstraints = false
            btnLocationshr.translatesAutoresizingMaskIntoConstraints = false
            underlineView1.translatesAutoresizingMaskIntoConstraints = false
            underlineView2.translatesAutoresizingMaskIntoConstraints = false

            NSLayoutConstraint.activate([
                // Positioning the Share Photo button
                btnPhotoShr.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                btnPhotoShr.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                btnPhotoShr.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
                btnPhotoShr.heightAnchor.constraint(equalToConstant: 30),

                // Positioning the Share Location button
                btnLocationshr.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
                btnLocationshr.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                btnLocationshr.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
                btnLocationshr.heightAnchor.constraint(equalToConstant: 30),
                
                
                
                
                
                
                
                

                // Positioning the underline for Share Photo button
                underlineView1.topAnchor.constraint(equalTo: btnPhotoShr.bottomAnchor, constant: 8),
                underlineView1.heightAnchor.constraint(equalToConstant: 3),
                underlineView1.widthAnchor.constraint(equalTo: btnPhotoShr.widthAnchor),
                underlineView1.centerXAnchor.constraint(equalTo: btnPhotoShr.centerXAnchor),

                // Positioning the underline for Share Location button
                underlineView2.topAnchor.constraint(equalTo: btnLocationshr.bottomAnchor, constant: 8),
                underlineView2.heightAnchor.constraint(equalToConstant: 3),
                underlineView2.widthAnchor.constraint(equalTo: btnLocationshr.widthAnchor),
                underlineView2.centerXAnchor.constraint(equalTo: btnLocationshr.centerXAnchor),



                btnAddPhtos.topAnchor.constraint(equalTo: btnLocationshr.bottomAnchor, constant: 40),
                    btnAddPhtos.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    btnAddPhtos.widthAnchor.constraint(equalToConstant: 120),
                    btnAddPhtos.heightAnchor.constraint(equalToConstant: 40)

            ])
    
        
        }


}

// MARK: - UIImagePickerControllerDelegate & UINavigationControllerDelegate
extension DataExchangeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {






func imagePickerController(_ picker: UIImagePickerController,
                           didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    photoCardContainerView.removeArrangedSubview(viewAddPhoto)
    viewAddPhoto.removeFromSuperview()
    photoCardContainerView.addArrangedSubview(cardSharePhoto)
    btnAddPhtos.isHidden = true
    if let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
        print("chosenImage",chosenImage)

        guard let locationData = currentLocationData else { return }
        
        cardSharePhoto.displayWithLocationData(data: locationData,
                                 settings: locationSettings,
                                 address: address)
                                               
        cardSharePhoto.viewimage.image = chosenImage
        btnPhotoShr.addTarget(self, action: #selector(getter: btnPhotoShr), for: .touchUpInside)
        btnLocationshr.addTarget(self, action: #selector(btnLocationShr), for: .touchUpInside)
        dismiss(animated: true)
    }
}




    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Image picker canceled") // Debugging line
        picker.dismiss(animated: true, completion: nil)
    }
}



