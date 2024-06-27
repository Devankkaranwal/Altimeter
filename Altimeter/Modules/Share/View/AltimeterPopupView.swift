//
//  AltimeterPopupView.swift
//  Altimeter
//
//  Created by Devank on 11/06/24.
//


import Foundation
import UIKit

class AltimeterPopupView: UIView {

    init(frame: CGRect, locationData: (latitude: String, longitude: String, altitude: String)?, address: String?) {
        super.init(frame: frame)
        setupAltimeterPopupView(locationData: locationData, address: address)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
 
    private func setupAltimeterPopupView(locationData: (latitude: String, longitude: String, altitude: String)?, address: String?)
    
    
    {
        self.backgroundColor = UIColor(red: 0.11, green: 0.15, blue: 0.29, alpha: 1.00)
        self.layer.cornerRadius = 32
        self.layer.masksToBounds = true

        let titleLabel = UILabel()
        titleLabel.text = "Altimeter Information"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .white
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])

        var stackViewArr: [UIView] = []
        if let latitude = locationData?.latitude {
            stackViewArr.append(lblmke(withText: "Latitude: \(latitude)"))
        }
        if let longitude = locationData?.longitude {
            stackViewArr.append(lblmke(withText: "Longitude: \(longitude)"))
        }
        if let altitude = locationData?.altitude {
            stackViewArr.append(lblmke(withText: "Altitude: \(altitude) meters"))
        }
        if let address = address {
            stackViewArr.append(lblmke(withText: "Address: \(address)"))
        }
        if let latitude = locationData?.latitude, let longitude = locationData?.longitude {
            stackViewArr.append(lblmke(withText: "Apple Maps Link: maps://?q=\(latitude),\(longitude)"))
            stackViewArr.append(lblmke(withText: "Google Maps Link: comgooglemaps://?q=\(latitude),\(longitude)"))
        }
        stackViewArr.append(lblmke(withText: "Reference App: https://example.com"))

        let stackView = UIStackView(arrangedSubviews: stackViewArr)
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .leading
       // stackView.tintColor = Colors.blue

        // Add separator lines
        for view in stackView.subviews.dropLast() {
            let separator = UIView()
            separator.backgroundColor = UIColor(hex: "#2C2C2C")
            separator.translatesAutoresizingMaskIntoConstraints = false
            stackView.addSubview(separator)
            NSLayoutConstraint.activate([
                separator.heightAnchor.constraint(equalToConstant: 1),
                separator.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 0),
                separator.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 0),
                separator.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 5)
            ])
        }

        self.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -20)
        ])
    }


    private func lblmke(withText text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0 
        return label
    }

    

    @objc func closePopup() {
        let dayAfter = Int.random(in: 0...1550)
        self.removeFromSuperview()
    }
}
