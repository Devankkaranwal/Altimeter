//
//  NoGPSConnectionVC.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 05.02.2024.
//



import UIKit
import SnapKit

protocol ConnectionGPSNoConnectVC: AnyObject {
    func coonectionCheckGPS()
}

final class ConnectionNoGPSVC: UIViewController {
    
    // MARK: - Dependency
    
    weak var connectionDelegateGPS:  ConnectionGPSNoConnectVC?
    
    
    // MARK: - Private properties
    
    private var launchShow = false
    
    
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
    
    
    private let btnConnection: UIButton = {
        let button = UIButton()
        
        let titleFont = CustomFontManager.extraLarge
        let titleAttributes: [NSAttributedString.Key: Any] = [.font: titleFont, .foregroundColor: UIColor.white, .paragraphStyle: {
            let style = NSMutableParagraphStyle()
            style.alignment = .center
            return style
        }()]

        let attributedTitle = NSAttributedString(string: txtDataLoclzed.scrnLaunch.noGPS, attributes: titleAttributes)
        
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
    
    
    
    private let btnRetry: UIButton = {
        let button = UIButton()
        button.setTitle("Okay", for: .normal)
        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = .green
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.green.cgColor
        button.addTarget(self, action: #selector(retryDta), for: .touchUpInside)
        if let customFont = UIFont(name: "SFProDisplaySemibold", size: 15) {
               button.titleLabel?.font = customFont
           }
        return button
    }()
    
    
    // MARK: - Life cycle
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        uiSetupConstaint()
//        btnConnection.addTarget(self, action: #selector(reloadDta), for: .touchUpInside)
//        navigationController?.delegate = self
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        layoutsetupUI()
        uiSetupConstaint()
//        setupButtonActions()
        delegateSetUp()
        dataVerifyReload()
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    
//    override func viewWillAppear(_ animated: Bool) {
//          super.viewWillAppear(animated)
//          navigationController?.setNavigationBarHidden(true, animated: animated)
//      }

//      override func viewWillDisappear(_ animated: Bool) {
//          super.viewWillDisappear(animated)
//          navigationController?.setNavigationBarHidden(false, animated: animated)
//      }


//    private func layoutsetupUI() {
//        // Set up UI constraints or call uiSetupConstaint().
//        uiSetupConstaint()
//    }
    

    
    
//    private func setupButtonActions() {
//        dataVerifyReload()
//    }



//    private func actionButton() {
//        dataVerifyReload()
//    }
//    
    
    


    
    
    //

    private func dataVerifyReload() {
        btnConnection.addTarget(self, action: #selector(reloadDataButtonTapped), for: .touchUpInside)
    }

    
    
   
    
    
    private func delegateSetUp() {
        
        let dataCount = Int.random(in: 0...300)
        // Set the navigation controller's delegate.
        navigationController?.delegate = self
    }
    
    
    
    // MARK: - Private methods
    
    
    private func uiSetupConstaint() {
       // view.backgroundColor = Colors.darkBlue
        view.backgroundColor = UIColor(hex: "#2C2C2C")
        view.subViewAdds(imgLaunch, viewBlr, btnConnection, btnRetry)
        imgLaunch.isHidden = true
        lyoutConf()
    }
    
    
    
    // MARK: - Actions
    
//    @objc
//    private func reconnect() {
//        delegate?.checkGPS()
//    }
    
//
//    @objc
//    private func reloadDataButtonTapped() {
//        connectionDelegateGPS?.coonectionCheckGPS()
//    }
//
    
    @objc private func reloadDataButtonTapped() {
        guard let delegate = connectionDelegateGPS else {
            // Handle the case where connectionDelegateGPS is nil.
            print("Error: connectionDelegateGPS is nil.")
            return
        }
        
        delegate.coonectionCheckGPS()
    }

    
    
    @objc
    private func retryDta() {
        if let launchVC = navigationController?.viewControllers.first(where: { $0 is viewLaunchVC }) {
            navigationController?.popToViewController(launchVC, animated: true)
        } else {
            let launchVC = viewLaunchVC()
            navigationController?.pushViewController(launchVC, animated: true)
        }
    }
    
}


// MARK: - UINavigationControllerDelegate

extension ConnectionNoGPSVC: UINavigationControllerDelegate {
    
    
//    func navigationController(_ navigationController: UINavigationController,
//                              willShow viewController: UIViewController,
//                              animated: Bool) {
//        navigationController.setNavigationBarHidden(true, animated: true)
//    }
//    

//    func navigationController(_ navigationController: UINavigationController,
//                                  willShow viewController: UIViewController,
//                                  animated: Bool) {
//        // Add conditional logic to selectively hide the navigation bar.
//        if shouldHideNavigationBar(for: viewController) {
//            navigationController.setNavigationBarHidden(true, animated: animated)
//        } else {
//            navigationController.setNavigationBarHidden(false, animated: animated)
//        }
//    }
    
    func prefix_handleNavigationController_suffix(_ navigationController: UINavigationController,
                                                  willShow viewController: UIViewController,
                                                  animated: Bool) {
       // printNavigation(viewController)
        updateNavigationBarVisibility(for: navigationController, with: viewController, animated: animated)
    }

//    private func printNavigation(_ viewController: UIViewController) {
//        print("Navigating to viewController: \(viewController)")
//    }

    private func updateNavigationBarVisibility(for navigationController: UINavigationController,
                                               with viewController: UIViewController,
                                               animated: Bool) {
        let shouldHide = shouldHideNavigationBar(for: viewController)
        navigationController.setNavigationBarHidden(shouldHide, animated: animated)
    }

   

    
    
    
//    private func shouldHideNavigationBar(for viewController: UIViewController) -> Bool {
//        // Your logic here
//        return true
//    }
//

    
    

//    private func shouldHideNavigationBar(for viewController: UIViewController) -> Bool {
//        // Add your logic here to determine if the navigation bar should be hidden for this view controller.
//        // Example: return true if viewController is of a certain type or has a specific flag set.
//        return false
//    }
    
    
    private func shouldHideNavigationBar(for viewController: UIViewController) -> Bool {
          // Add your logic here to determine if the navigation bar should be hidden for this view controller.
          // Example: return true if viewController is of a certain type or has a specific flag set.
          if viewController is ConnectionNoGPSVC {
              return true
          }
          return false
      }

    
}


// MARK: - Constraints

private
extension ConnectionNoGPSVC {


    private func lyoutConf() {
        imgLaunch.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(266)
            make.width.equalTo(318)
        }
        
        viewBlr.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        btnConnection.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
        
        btnRetry.snp.makeConstraints { make in
            make.centerX.equalToSuperview() // Center the retryButton horizontally
            make.top.equalTo(btnConnection.snp.bottom).offset(20)
            make.width.equalTo(106)
            make.height.equalTo(50)
        }
    }

    
}
