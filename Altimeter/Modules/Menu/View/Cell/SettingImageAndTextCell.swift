//
//  SettingImageAndTextCell.swift
//  Altimeter
//
//  Created by Devank on 10/06/24.
//

import UIKit

class SettingImageAndTextCell: UITableViewCell {
    
    private let imageIcon: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let lblMain: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        ConstSetup()
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
 
    func performLayoutUI(withText text: String?, imageName: String?) {
        if let text = text {
            lblMain.text = text
        }
        if let imageName = imageName, let image = UIImage(named: imageName) {
            imageIcon.image = image
        }
    }

    
    
    
    // MARK: - Private methods
    

    private func ConstSetup() {
       
       backgroundColor = UIColor(hex: "#2C2C2C")
        addSubview(lblMain)
        addSubview(imageIcon)
        ConstrtSet()
        
        // Set the font to SF Pro Display
        lblMain.font = UIFont(name: "SFProDisplay-Regular", size: 17)
        lblMain.font = UIFont.systemFont(ofSize: 17, weight: .semibold) // You can also use this if SF Pro Display Regular is not available
    }

    
    
    
    private func ConstrtSet() {
        imageIcon.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
        
        lblMain.snp.makeConstraints { make in
            make.leading.equalTo(imageIcon.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
        }
    }
}
