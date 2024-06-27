//
//  MenuHeaderView.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 27.11.2023.
//


import UIKit
import SnapKit

final class HeadrView: UIView {
    
    // MARK: - UI Elements
    
    private let headerIcon: UIImageView = {
        let image = UIImageView(image: UIImage(named: "settingsIcon"))
        return image
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    
    // MARK: - Life cycle
    
    init() {
        super .init(frame: .zero)
        ConstSetUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Configure
    
//    func populateHeader(icon: String, title: String) {
//        headerIcon.image = UIImage(named: icon)
//        headerLabel.text = title
//    }
    
    
    func populateHeader(iconName: String, titleText: String) {
        if let iconImage = UIImage(named: iconName) {
            headerIcon.image = iconImage
        } else {
            // Handle the case where the image is not found
            print("Image named \(iconName) not found.")
        }
        headerLabel.text = titleText
    }

    
    // MARK: - Private methods
    
    private func ConstSetUI() {
       // backgroundColor = Colors.darkBlue
        backgroundColor = UIColor(hex: "#2C2C2C")
        subViewAdds(        headerIcon,         headerLabel)
        ConstSetUIS()
    }
}


// MARK: Constraints

private
extension HeadrView {
    func ConstSetUIS() {
                headerIcon.snp.makeConstraints { make in
            make.height.width.equalTo(18)
            make.top.leading.equalToSuperview().offset(16)
            make.bottom.equalToSuperview().offset(-32)
        }
        
                headerLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalTo(        headerIcon.snp.trailing).offset(8)
            make.bottom.equalToSuperview().offset(-32)
        }
    }
}
