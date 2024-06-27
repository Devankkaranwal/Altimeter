//
//  AddressView.swift
//  Altimeter
//
//  Created by Devank on 12/06/24.
//

import UIKit

class AddressView: UIView {

    private let iconAdd: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "address") // Replace with your address icon image name
        imageView.contentMode = .scaleAspectFit
       
        return imageView
    }()
    
    private let lblAdd: UILabel = {
        let label = UILabel()
        label.text = "Address"
        label.textColor = .white
        label.font = CustomFontManager.semiBoldMedium
        label.textAlignment = .center
        label.numberOfLines = 0 // Allows label to expand vertically if needed
        return label
    }()
    
    private let viewStacks: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constaintSetIOS()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        constaintSetIOS()
    }
    
    private func constaintSetIOS() {
        self.backgroundColor = UIColor(white: 0, alpha: 0.5)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
        viewStacks.addArrangedSubview(iconAdd)
        viewStacks.addArrangedSubview(lblAdd)
        
        addSubview(viewStacks)
        viewStacks.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewStacks.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            viewStacks.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            viewStacks.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            viewStacks.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            
            // Additional constraints to ensure the icon size is consistent
            iconAdd.widthAnchor.constraint(equalToConstant: 24),
            iconAdd.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    
   
    
    func updateAddress(_ address: String) {
//        let fullAddress = address + " Address bhi dikhe"
        let fullAddress = "Address  " + address
        lblAdd.text = fullAddress
        lblAdd.isHidden = address.isEmpty
    }
    
    
}
    

