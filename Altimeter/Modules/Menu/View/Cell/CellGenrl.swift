//
//  GeneralCell.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 03.12.2023.
//


import UIKit
import SnapKit

protocol genrlDelegate: AnyObject {
    func performSelection(at index: Int)
}

final class CellGenrl: UITableViewCell {
    
    // MARK: - DATA Prop
    
    weak var delegateGen: genrlDelegate?
    private var indx: Int = 0
    
    // MARK: - UI CostaintEle
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = CustomFontManager.semiBoldMedium
        label.textColor = .white
        return label
    }()
    
    private let icon: UIImageView = {
        let image = UIImageView(image: UIImage(named: "arrowIcon"))
        return image
    }()
    
    // MARK: -  Cycle DATA
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        ConstUI()
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(btnhandleTaped)))
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - DtaConfigure
    
//    func dataconfig(text: String, index: Int) {
//        label.text = text
//        self.indx = index
//    }
    
    
    func dataConfigured(text: String?, atIndex index: Int) {
        // Handle optional text safely
        if let labelText = text {
            label.text = labelText
        } else {
            // Handle the case where text is nil, e.g., set a default value for label.text
            label.text = "Default Text"
        }

        self.indx = index
    }

    
    // MARK: - Private Methods
    
    private func ConstUI() {
       
        backgroundColor = UIColor(hex: "#2C2C2C")
        let stackView = UIStackView(arrangedSubviews: [label, icon])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        addSubview(stackView)
        
        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }
    }
    

    
//    @objc private func btnhandleTaped() {
//          delegateGen?.performSelection(at: indx)
//      }

    
    @objc private func btnhandleTaped() {
        guard let delegate = delegateGen else {
            // Handle the case where delegateGen is nil, such as logging an error or displaying a message
            return
        }
        delegate.performSelection(at: indx)
    }

    
 
    
}
