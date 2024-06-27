//
//  NoInternetConnectionVC.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 06.12.2023.
//


import UIKit
import SnapKit

protocol connectionNoInternet: AnyObject {
    func checkConnInternet()
}

final class ConnectionNoInternetViewCont: UIViewController {
    
    // MARK: - Dependency
    
    weak var internetDelegate:  connectionNoInternet?
    
    
    // MARK: - Private properties
    
    private var lauchShw = false
    
    
    // MARK: - UIElements
    
    private let imgLaunch: UIImageView = {
        let image = UIImageView(image: UIImage(named: "launchImage"))
        return image
    }()
    
    private let viewBlr: UIView = {
        let view = UIView()
        let blurEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.subViewAdds(blurEffectView)
        return view
    }()
    
    private let btnRetry: UIButton = {
        let button = UIButton()
        button.setTitle("Okay", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.green.cgColor
        button.addTarget(self, action: #selector(retryFun), for: .touchUpInside)
        if let customFont = UIFont(name: "SFProDisplaySemibold", size: 15) {
               button.titleLabel?.font = customFont
           }
        return button
    }()
    
    
    
    private let btnConnectionlbl: UIButton = {
        let button = UIButton()
        
        let titleFont = CustomFontManager.extraLarge
        let titleAttributes: [NSAttributedString.Key: Any] = [.font: titleFont, .foregroundColor: UIColor.white, .paragraphStyle: {
            let style = NSMutableParagraphStyle()
            style.alignment = .center
            return style
        }()]

        let attributedTitle = NSAttributedString(string: "No Internet connection", attributes: titleAttributes)
        
        let subtitleFont = CustomFontManager.smallRegular
        let subtitleAttributes: [NSAttributedString.Key: Any] = [.font: subtitleFont, .foregroundColor: UIColor.white, .paragraphStyle: {
            let style = NSMutableParagraphStyle()
            style.alignment = .center
            return style
        }()]

        let attributedSubtitle = NSAttributedString(string: txtDataLoclzed.scrnLaunch.pleaseTryAgain, attributes: subtitleAttributes)
        
        let combination = NSMutableAttributedString()
        combination.append(attributedTitle)
        combination.append(NSAttributedString(string: "\n"))
        combination.append(attributedSubtitle)
        
        button.setAttributedTitle(combination, for: .normal)
        button.titleLabel?.numberOfLines = 0
        
        return button
    }()



    
    
    // MARK: - Life cycle
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        layoutSetConst()
//        btnConnectionlbl.addTarget(self, action: #selector(checkInternetConnectivity), for: .touchUpInside)
////        button.applyBorderStyle(radius: 15, borderWidth: 2, borderColor: UIColor.green)
//        navigationController?.delegate = self
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutSetConst()
        navigationController?.delegate = self
        btnConnectionlbl.addTarget(self, action: #selector(checkInternetConnectionButtonTapped), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
          navigationController?.setNavigationBarHidden(true, animated: animated)
      }

      override func viewWillDisappear(_ animated: Bool) {
          super.viewWillDisappear(animated)
          navigationController?.setNavigationBarHidden(false, animated: animated)
      }



    
    // MARK: - Private methods
    

    
    private func layoutSetConst() {
        //view.backgroundColor = Colors.darkBlue
        view.backgroundColor = UIColor(hex: "#2C2C2C")
        view.subViewAdds(imgLaunch, viewBlr, btnConnectionlbl, btnRetry) // Add retryButton here

        imgLaunch.isHidden = true
        layoutSetupConst()
    }

    
    
    // MARK: - Actions
    

    @objc private func checkInternetConnectionButtonTapped() {
        guard let delegate = internetDelegate else {
            // Handle the case where internetDelegate is nil.
            print("Error: internetDelegate is nil.")
            return
        }
        
        delegate.checkConnInternet()
    }

    

    
    
}


// MARK: - UINavigationControllerDelegate

extension ConnectionNoInternetViewCont: UINavigationControllerDelegate {
    
  

    func prefix_navigationController_suffix(_ navigationController: UINavigationController,
                                            willShow viewController: UIViewController,
                                            animated: Bool) {
        hideNavigationBar(for: navigationController, animated: true)
    }

    private func hideNavigationBar(for navigationController: UINavigationController, animated: Bool) {
        // Hide the navigation bar when a view controller is about to be shown.
     
        navigationController.setNavigationBarHidden(true, animated: true)
    }

    
    
    
    
    
    @objc
    private func retryFun() {
        if let launchVC = navigationController?.viewControllers.first(where: { $0 is viewLaunchVC }) {
            navigationController?.popToViewController(launchVC, animated: true)
        } else {
            let launchVC = viewLaunchVC()
            navigationController?.pushViewController(launchVC, animated: true)
        }
    }

    
}


// MARK: - Constraints

private
extension ConnectionNoInternetViewCont {
    
    func layoutSetupConst() {
        imgLaunch.snp.makeConstraints { make in
               make.centerX.centerY.equalToSuperview()
               make.height.equalTo(266)
               make.width.equalTo(318)
           }
           
           viewBlr.snp.makeConstraints { make in
               make.top.leading.trailing.bottom.equalToSuperview()
           }
           
           btnConnectionlbl.snp.makeConstraints { make in
               make.centerX.centerY.equalToSuperview() // Center the button horizontally and vertically
           }
           
           btnRetry.snp.makeConstraints { make in
               make.centerX.equalToSuperview()
               make.top.equalTo(btnConnectionlbl.snp.bottom).offset(20)
               make.width.equalTo(106)
               make.height.equalTo(50)
           }
       }
}



