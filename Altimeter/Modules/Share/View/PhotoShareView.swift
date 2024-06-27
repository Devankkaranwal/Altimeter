//
//  SharePhotoView.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 03.12.2023.
//




import UIKit
import SnapKit

final class PhotoShareView: UIView {

    // MARK: - UI Elements

    lazy var viewimage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()

    private let containerViewinf: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#2C2C2C")
        view.layer.cornerRadius = 10
        return view
    }()

    private let lblAltitude: UILabel = {
        let label = UILabel()
        label.font = CustomFontManager.semiBoldMedium
        label.textColor = UIColor.white
        label.text = "Altitude"
        return label
    }()

    private let lblAltitudeVal: UILabel = {
        let label = UILabel()
        label.font = CustomFontManager.regularLarge
        label.textColor = .white
        label.text = "13.37 M"
        return label
    }()

    private let lblDirInfo: UILabel = {
        let label = UILabel()
        label.font = CustomFontManager.semiBoldMedium
        label.textColor = .white
        label.text = "Direction"
        label.textAlignment = .right // Align text to the right
        return label
    }()

    private let lblDirValueInfos: UILabel = {
        let label = UILabel()
        label.font = CustomFontManager.regularLarge
        label.textColor = .white
        label.text = "N"
        label.textAlignment = .right // Align text to the right
        return label
    }()

    private let ImageAddressvs: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "address") // Replace with your image name
        return imageView
    }()

    private let lblAddressInfo: UILabel = {
        let label = UILabel()
        label.font = CustomFontManager.semiBoldMedium
        label.textColor = UIColor.white
        label.text = "Address"
        return label
    }()

    private let lblAddValueInf: UILabel = {
        let label = UILabel()
        label.font = CustomFontManager.semiBoldMedium
        label.textColor = .white
        label.text = "Canggu, Badung, Indonesia"
        label.numberOfLines = 0
        return label
    }()

    private let lblCoordinateIngos: UILabel = {
        let label = UILabel()
        label.font = CustomFontManager.regularLarge
        label.textColor = UIColor.white
        label.text = "Coordinates"
        return label
    }()

    private let lbllatitudeInfoVal: UILabel = {
        let label = UILabel()
        label.font = CustomFontManager.semiBoldMedium
        label.textColor = .white
        label.text = "-8° 39’ 14.2786”S"
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()

    private let lbllongitudeInfoVal: UILabel = {
        let label = UILabel()
        label.font = CustomFontManager.semiBoldMedium
        label.textColor = .white
        label.text = "115° 8’ 6.1110”E"
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()

    // MARK: - Life cycle

    init(image: UIImage? = UIImage()) {
        super.init(frame: .zero)
        viewimage.image = image
        ConstaintSetup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configure

//    func displayWithLocationData(data: CurrentGeoLocationData, settings: [CellSetting], address: String) {
//
//        lblAltitudeVal.text = "\(String(round((data.altitude) * 100) / 100.0)) \(settings[0].val == 0 ? "m" : "ft")"
//
//        lbllatitudeInfoVal.text = String.formattedCoordinateString(index: settings[1].val, data.latitude, type: .latitude)
//
//        lbllongitudeInfoVal.text = String.formattedCoordinateString(index: settings[1].val, data.longitude, type: .longitude)
//
//        lblAddValueInf.text = address
//    }
    
    
    func displayWithLocationData(data: CurrentGeoLocationData, settings: [CellSetting], address: String) {
        let altitudeUnit = settings.first?.val == 0 ? "m" : "ft"
        let formattedAltitude = String(format: "%.2f \(altitudeUnit)", data.altitude)
        lblAltitudeVal.text = formattedAltitude

        // Assuming String.formattedCoordinateString returns a non-optional String
        lbllatitudeInfoVal.text = String.formattedCoordinateString(index: settings[1].val, data.latitude, type: .latitude)
        lbllongitudeInfoVal.text = String.formattedCoordinateString(index: settings[1].val, data.longitude, type: .longitude)

        lblAddValueInf.text = address
    }



    
    

    // MARK: - Private methods

    private func ConstaintSetup() {
        addSubview(viewimage)
        addSubview(containerViewinf)

        let altitudeDirectionStackView = UIStackView(arrangedSubviews: [
            infoLabel(label: lblAltitude, valueLabel: lblAltitudeVal),
            infoDirView()
        ])
        altitudeDirectionStackView.axis = .horizontal
        altitudeDirectionStackView.spacing = 20
        altitudeDirectionStackView.distribution = .fillEqually

        let stackView = UIStackView(arrangedSubviews: [
            altitudeDirectionStackView,
            AddInfoViews(),
            infoCordinateView()
        ])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillProportionally
        containerViewinf.addSubview(stackView)

        viewimage.snp.makeConstraints { make in
            make.height.equalTo(200)
            make.top.leading.trailing.equalToSuperview().inset(10)
        }

        containerViewinf.snp.makeConstraints { make in
            make.top.equalTo(viewimage.snp.bottom).offset(10)
            make.leading.trailing.bottom.equalToSuperview().inset(10)
        }

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
    }

    
    
    
    private func infoLabel(label: UILabel, valueLabel: UILabel) -> UIView {
        let view = UIView()

        view.addSubview(label)
        view.addSubview(valueLabel)

        label.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
        }

        valueLabel.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(5)
            make.leading.trailing.bottom.equalToSuperview()
        }

        return view
    }

    private func infoDirView() -> UIView {
        let view = UIView()

        view.addSubview(lblDirInfo)
        view.addSubview(lblDirValueInfos)

        lblDirInfo.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
        }

        lblDirValueInfos.snp.makeConstraints { make in
            make.top.equalTo(lblDirInfo.snp.bottom).offset(5)
            make.trailing.bottom.equalToSuperview()
        }

        return view
    }
    
    

//    private func AddInfoViews() -> UIView {
//        let view = UIView()
//
//        let addressStackView = UIStackView(arrangedSubviews: [ImageAddressvs, lblAddressInfo, lblAddValueInf])
//        addressStackView.axis = .horizontal
//        addressStackView.spacing = 5
//        addressStackView.alignment = .center
//
//        view.addSubview(addressStackView)
//
//        addressStackView.snp.makeConstraints { make in
//            make.top.leading.trailing.equalToSuperview()
//            make.bottom.lessThanOrEqualToSuperview().inset(5) // Allow the stack view to shrink if needed
//        }
//
//        ImageAddressvs.snp.makeConstraints { make in
//            make.width.height.equalTo(20)
//        }
//
//        // Ensure the addressValueLabel can wrap its content
//        lblAddValueInf.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
//        lblAddValueInf.numberOfLines = 0 // Allow multiple lines
//        lblAddValueInf.lineBreakMode = .byWordWrapping // Wrap at word boundaries
//
//        return view
//    }


    private func AddInfoViews() -> UIView {
        let view = UIView()

        let addressStackView = UIStackView(arrangedSubviews: [ImageAddressvs, lblAddressInfo, lblAddValueInf])
        addressStackView.axis = .horizontal
        addressStackView.spacing = 5
        addressStackView.alignment = .center

        view.addSubview(addressStackView)

        addressStackView.snp.makeConstraints { make in
            make.center.equalToSuperview() // Center the stack view within its superview
            make.leading.greaterThanOrEqualToSuperview().offset(5) // Ensure it doesn't go outside the view bounds
            make.trailing.lessThanOrEqualToSuperview().offset(-5) // Ensure it doesn't go outside the view bounds
            make.top.greaterThanOrEqualToSuperview().offset(5) // Ensure it doesn't go outside the view bounds
            make.bottom.lessThanOrEqualToSuperview().offset(-5) // Allow the stack view to shrink if needed
        }

        ImageAddressvs.snp.makeConstraints { make in
            make.width.height.equalTo(20)
        }

        // Ensure the addressValueLabel can wrap its content
        lblAddValueInf.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        lblAddValueInf.numberOfLines = 0 // Allow multiple lines
        lblAddValueInf.lineBreakMode = .byWordWrapping // Wrap at word boundaries

        return view
    }

    
    private func infoCordinateView() -> UIView {
        let view = UIView()

        view.addSubview(lblCoordinateIngos)
        view.addSubview(lbllatitudeInfoVal)
        view.addSubview(lbllongitudeInfoVal)

//        coordinatesInfoLabel.snp.makeConstraints { make in
//            make.top.centerX.equalToSuperview()
//        }
        
        
        lblCoordinateIngos.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20) // Set the top constraint to 20 points
            make.centerX.equalToSuperview()
        }
        

        lbllatitudeInfoVal.snp.makeConstraints { make in
            make.top.equalTo(lblCoordinateIngos.snp.bottom).offset(15)
            make.leading.trailing.equalToSuperview()
        }
        
        
        

        lbllongitudeInfoVal.snp.makeConstraints { make in
            make.top.equalTo(lbllatitudeInfoVal.snp.bottom).offset(5)
            make.leading.trailing.bottom.equalToSuperview()
        }

        return view
    }
}
