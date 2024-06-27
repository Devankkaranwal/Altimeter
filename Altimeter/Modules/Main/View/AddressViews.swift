//
//  AddressViews.swift
//  Altimeter
//
//  Created by Devank on 13/06/24.
//

import Foundation
import UIKit

class AddressViews: UIView {

    private let iconAddrss: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "address") // Replace with your address icon image name
        imageView.contentMode = .scaleAspectFit
       
        return imageView
    }()
    
    private let lblAddr: UILabel = {
        let label = UILabel()
        label.text = "Address"
        label.textColor = .white
        label.font = CustomFontManager.semiBoldMedium
        label.textAlignment = .center
        label.numberOfLines = 0 // Allows label to expand vertically if needed
        return label
    }()
    
    private let viewStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraintSetuis()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        constraintSetuis()
    }
    
    private func constraintSetuis() {
//        self.backgroundColor = UIColor(white: 0, alpha: 0.5)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
        viewStack.addArrangedSubview(iconAddrss)
        viewStack.addArrangedSubview(lblAddr)
        
        addSubview(viewStack)
        viewStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            viewStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            viewStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            viewStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            
            // Additional constraints to ensure the icon size is consistent
            iconAddrss.widthAnchor.constraint(equalToConstant: 24),
            iconAddrss.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    
   
    
    
    func addSetData(_ address: String) {
//        let fullAddress = address + " Address bhi dikhe"
        let fullAddress = "Address  " + address
        lblAddr.text = fullAddress
        lblAddr.isHidden = address.isEmpty
    }
}
