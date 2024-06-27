//
//  UIViewControllerExtensionData.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 09.02.2024.
//


import UIKit


//extension UIViewController {
//    func displayNoInternetAlert(title: String,
//                                   message: String?,
//                                   completionHandler: @escaping () -> Void) {
//        DispatchQueue.main.async {
//            let alertController = UIAlertController(title: txtDataLoclzed.alertNoIntConn.title,
//                                                    message: txtDataLoclzed.alertNoIntConn.message,
//                                                    preferredStyle: .alert)
//            let okAction = UIAlertAction(title: txtDataLoclzed.alertNoIntConn.actionTitle,
//                                         style: .default) { _ in
//                completionHandler()
//            }
//            alertController.addAction(okAction)
//            self.present(alertController, animated: true, completion: nil)
//        }
//    }
//}




typealias VCData = UIViewController

extension VCData {
    func displayNoInternetAlert(title: String,
                                message: String?,
                                completionHandler: @escaping () -> Void) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: txtDataLoclzed.alertNoIntConn.title,
                                                    message: txtDataLoclzed.alertNoIntConn.message,
                                                    preferredStyle: .alert)
            let okAction = UIAlertAction(title: txtDataLoclzed.alertNoIntConn.actionTitle,
                                         style: .default) { _ in
                completionHandler()
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
}
