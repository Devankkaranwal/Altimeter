//
//  AltimetrInformationVC.swift
//  Altimeter
//
//  Created by Devank on 11/06/24.
//



import UIKit

class AltimetrInformationVC: UIViewController {

    var locationData: (latitude: String, longitude: String, altitude: String)?
    var address: String?
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 22
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the background color
        view.backgroundColor = UIColor(hex: "#2C2C2C")
        
        SettingNav()
        DataViewCor(locationData: locationData, address: address)
        StackViewUICon()
    }
    
    private func SettingNav() {
        let customFont = UIFont(name: "SFProDisplaySemibold", size: 25) ?? UIFont.boldSystemFont(ofSize: 25)
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: customFont
        ]

        title = txtDataLoclzed.ScrnShre.Altimetr_Information
        navigationController?.navigationBar.tintColor = .white
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.titleTextAttributes = titleAttributes
        appearance.backgroundColor = UIColor(hex: "#2C2C2C")
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }

    private func DataViewCor(locationData: (latitude: String, longitude: String, altitude: String)?, address: String?) {
        var stackViewArr: [UIView] = []
        if let latitude = locationData?.latitude {
            stackViewArr.append(lblData(withText: "Latitude: \(latitude)"))
        }
        if let longitude = locationData?.longitude {
            stackViewArr.append(lblData(withText: "Longitude: \(longitude)"))
        }
        if let altitude = locationData?.altitude {
            stackViewArr.append(lblData(withText: "Altitude: \(altitude) meters"))
        }
        if let address = address {
            stackViewArr.append(lblData(withText: "Address: \(address)"))
        }
        if let latitude = locationData?.latitude, let longitude = locationData?.longitude {
            stackViewArr.append(lblData(withText: "Apple Maps Link: maps://?q=\(latitude),\(longitude)"))
            stackViewArr.append(lblData(withText: "Google Maps Link: comgooglemaps://?q=\(latitude),\(longitude)"))
        }
        stackViewArr.append(lblData(withText: "Reference App: https://example.com"))
        
        stackViewArr.forEach { stackView.addArrangedSubview($0) }
    }
    
    private func StackViewUICon() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    
    
    
    
    private func lblData(withText text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .white
        label.font = UIFont(name: "SFProDisplaySemibold", size: 20)
        label.numberOfLines = 0 // Allow multiple lines
        return label
    }
}
