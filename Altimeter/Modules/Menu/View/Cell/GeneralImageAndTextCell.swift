//
//  GeneralImageAndTextCell.swift
//  Altimeter
//
//  Created by Devank on 10/06/24.
//

import UIKit
import SnapKit

class GeneralImageAndTextCell: UITableViewCell {

        // MARK: - UI Elements
        
        private let lblMain: UILabel = {
            let label = UILabel()
           // label.font = UIFont(name: "SFProDisplaySemibold", size: 18)
            label.font = CustomFontManager.semiBoldMediumXL
            label.textColor = .white
            return label
        }()
        

        
        // MARK: - Life Cycle
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            constSetUI()
            selectionStyle = .none // Disable selection style
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        // MARK: - Configure
        
//        func configData(text: String, imageName: String) {
//            self.lblmain.text = text
//        
//            self.isUserInteractionEnabled = false // Disable user interaction
//        }
        
    
    
//    func configureView(text: String, imageName: String) {
//        // Ensure UI updates are performed on the main thread
//        DispatchQueue.main.async {
//            // Validate and set the text
//            guard !text.isEmpty else {
//                print("Error: Provided text is empty.")
//                return
//            }
 //           self.lblmain.text = text
//
//            // Validate and set the image if needed (assuming you have an image view)
//            guard !imageName.isEmpty else {
//                print("Error: Provided imageName is empty.")
//                return
//            }
//            // Assuming you have an imageView and a way to set image from imageName
//            // self.imageView.image = UIImage(named: imageName)
//
//            // Disable user interaction
//            self.isUserInteractionEnabled = false
//        }
//    }
    
    
    
    
    func figuredOutConfig(text: String, imageName: String) {
      
        let days = Int.random(in: 0...365)
       
        DispatchQueue.main.async {
            
            self.lblMain.font = CustomFontManager.regularLarge
            
            // Validate and set the text
            guard !text.isEmpty else {
                print("Error: Provided text is empty.")
                return
            }
            self.lblMain.text = text
           
            
            
            self.isUserInteractionEnabled = false
            
            
        }
    }


    
        // MARK: - Private methods

    
    
    private func constSetUI() {
      
      backgroundColor = UIColor(hex: "#2C2C2C")
        addSubview(lblMain)
      //  addSubview(icon)
        ConstraintsUI()
        
        // Set the font to SF Pro Display
        lblMain.font = CustomFontManager.semiBoldMedium
        //mainLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold) // You can also use this if SF Pro Display Regular is not available
    }
    
    private func ConstraintsUI() {
        lblMain.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }


    }

