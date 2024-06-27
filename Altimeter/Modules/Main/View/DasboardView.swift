//
//  MainScrollView.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 22.11.2023.
//



import UIKit
import SnapKit

final class DasboardView: UIView {

    // MARK: - Private Properties

   // private let scrollView: Map
    private let scrollView: DataModules.DataMapLocations

    // MARK: - UI Elements

    private let viewStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .center // Ensure stack view items are centered
        stackView.distribution = .fill
        return stackView
    }()

    private let viewAltimr: UIView = {
        let view = UIView()
        return view
    }()

    private let stackViewAlt: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 8 // Adjust spacing to match screenshot
        return stackView
    }()

    private let lblAltit: UILabel = {
        let label = UILabel()
        label.text = "13.37 m"
        label.font = CustomFontManager.regularLarge
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    private let lblMag: UILabel = {
        let label = UILabel()
        label.text = "≈ 19 m"
        label.font = CustomFontManager.regularLarge
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    private let lblSpd: UILabel = {
        let label = UILabel()
        label.text = "0 Km/H"
        label.font = CustomFontManager.regularLarge
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    private let btmStckView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center // Ensure items are centered
        stackView.distribution = .fill
        stackView.spacing = 16
        return stackView
    }()

    private let viewInfos: UIView = {
        let view = UIView()
        return view
    }()

//    private let coordinatesLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Coordinates" // LocalizedText.Main.coordinates
//        label.font = Typography.bold15
//        label.textColor = .white // Colors.lightBlue
//        label.textAlignment = .center
//        return label
//    }()
    

    
    private let lblCoordint: UILabel = {
        let label = UILabel()
        label.text = "Coordinates"
        //label.font = UIFont(name: "SFProDisplay-Bold", size: 20)
        label.font = CustomFontManager.regularLarge
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()


    

    private let lblLatit: UILabel = {
        let label = UILabel()
        label.text = "-8° 39’ 14.2786”S"
        label.font = CustomFontManager.semiBoldMedium
        label.textColor = .white // Adjust color to match screenshot
        label.textAlignment = .center
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    private let lblLongit: UILabel = {
        let label = UILabel()
        label.text = "115° 8’ 6.1110”E"
        label.font = CustomFontManager.semiBoldMedium
        label.textColor = .white // Adjust color to match screenshot
        label.textAlignment = .center
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    // MARK: - Life cycle

//    init(type: Map) {
//        self.scrollView = type
//        super.init(frame: .zero)
//        ConstaintUI()
//    }
    
    init(type: DataModules.DataMapLocations) {
           self.scrollView = type
           super.init(frame: .zero)
           ConstaintUI()
       }
    
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configure

    func dataConfigs(data: CurrentGeoLocationData, settings: [CellSetting]) {
        if !settings.isEmpty {
            lblAltit.text = "\(String(format: "%.2f", data.altitude)) \(settings[0].val == 0 ? "m" : "ft")"
            lblMag.text = "≈ \(String(Int(data.magnitude))) \(settings[0].val == 0 ? "m" : "ft")"
            lblSpd.text = "0 Km/H"

            switch scrollView {
            case .coordinate:
                lblLatit.text = String.formattedCoordinateString(index: settings[1].val, data.latitude, type: .latitude)
                lblLongit.text = String.formattedCoordinateString(index: settings[1].val, data.longitude, type: .longitude)
            case .address:
                break
            }
        } else {
            lblAltit.text = "\(String(format: "%.2f", data.altitude)) m"
            lblMag.text = "≈ \(String(data.magnitude)) m"
            lblSpd.text = "0 Km/H"
            switch scrollView {
            case .coordinate:
                lblLatit.text = String(data.latitude)
                lblLongit.text = String(data.longitude)
            case .address:
                break
            }
        }
    }

    func addSetDta(_ address: String) {
        switch scrollView {
        case .coordinate:
            break
        case .address:
            // Handle address case if needed
            break
        }
    }

    func updatePressureData(_ purchase: Double, settings: [CellSetting]) {
        switch scrollView {
        case .coordinate:
            // Handle purchase if needed
            break
        case .address:
            break
        }
    }

    // MARK: - Private methods

    private func ConstaintUI() {
      
     backgroundColor = UIColor(hex: "#2C2C2C")
       // backgroundColor = UIColor.red
        layer.cornerRadius = 20
        addSubview(viewStack)
        viewStack.addArrangedSubview(viewAltimr)
        viewStack.addArrangedSubview(btmStckView)
        viewAltimr.addSubview(stackViewAlt)
        stackViewAlt.addArrangedSubview(lblAltit)
        stackViewAlt.addArrangedSubview(lblMag)
        stackViewAlt.addArrangedSubview(lblSpd)
        btmStckView.addArrangedSubview(viewInfos)
        viewInfos.addSubview(lblCoordint)
        viewInfos.addSubview(lblLatit)
        viewInfos.addSubview(lblLongit)
        scrollViewdt()
        ConstaintSetUIS()
    }

//    private func scrollViewdt() {
//        if scrollView == .address {
//            lblCoordint.isHidden = true
//            lblLatit.isHidden = true
//            lblLongit.isHidden = true
//        }
//    }
    
    private func scrollViewdt() {
        if case .address = scrollView {
            lblCoordint.isHidden = true
            lblLatit.isHidden = true
            lblLongit.isHidden = true
        }
    }

    
    
}

// MARK: - Setup Constraints

private extension DasboardView {
    func ConstaintSetUIS() {
        viewStack.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(24)
          
        }

        viewAltimr.snp.makeConstraints { make in
            make.width.equalTo(232)
            make.height.equalTo(45)
            make.centerX.equalToSuperview()
        }

        stackViewAlt.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(8)
        }

        viewInfos.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8) // Ensure infoView does not exceed parent width
            make.centerX.equalToSuperview()
        }

        lblCoordint.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.centerX.equalToSuperview()
        }

        lblLatit.snp.makeConstraints { make in
            make.top.equalTo(lblCoordint.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(8)
            make.centerX.equalToSuperview() // Center horizontally
        }

        lblLongit.snp.makeConstraints { make in
            make.top.equalTo(lblLatit.snp.bottom).offset(4)
            make.leading.trailing.equalToSuperview().inset(8)
            make.centerX.equalToSuperview() // Center horizontally
        }
    }
}
