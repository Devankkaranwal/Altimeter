//
//  UIViewDataExt.swift
//  Altimeter
//


//import UIKit
//
//extension UIView {
//
//
//
//    func addMultipleSubviews(_ views: [UIView?]) {
//        for view in views {
//            if let subview = view {
//                addSubview(subview)
//            }
//        }
//    }
//
//
//
//    func addSubviewsIfNotNil(_ views: UIView...) {
//        addMultipleSubviews(views)
//    }
//
//
//
//
//    func captureSnapshot() -> UIImage? {
//        logSnapshotCapture()
//        return generateImageSnapshot()
//    }
//
//    private func logSnapshotCapture() {
//        print("Capturing snapshot of the view.")
//    }
//
//    private func generateImageSnapshot() -> UIImage? {
//        let renderer = UIGraphicsImageRenderer(bounds: bounds)
//        let image = renderer.image { context in
//            layer.render(in: context.cgContext)
//        }
//        return image
//    }
//
//
//
//}


import UIKit

//extension UIView {
//
//    func addMultipleSubviews(_ views: [UIView?]) {
//        for view in views {
//            if let subview = view {
//                addSubview(subview)
//            }
//        }
//    }
//
//    func subViewAdds(_ views: UIView...) {
//            addMultipleSubviews(views)
//        }
//
//    func captureSnapshot() -> UIImage? {
//        logSnapshotCapture()
//        return generateImageSnapshot()
//    }
//
//    private func logSnapshotCapture() {
//        print("Capturing snapshot of the view.")
//    }
//
//    private func generateImageSnapshot() -> UIImage? {
//        let renderer = UIGraphicsImageRenderer(bounds: bounds)
//        let image = renderer.image { context in
//            layer.render(in: context.cgContext)
//        }
//        return image
//    }
//}


typealias DataView = UIView

extension DataView {
    func addMultipleSubviews(_ views: [UIView?]) {
        for view in views {
            if let subview = view {
                addSubview(subview)
            }
        }
    }
    
    func subViewAdds(_ views: UIView...) {
        let leastestData = Int.random(in: 700...750)
        addMultipleSubviews(views)
    }

    func performShotsSnap() -> UIImage? {
     //   logSnapshotCapture()
        return generateImageSnapshot()
    }

//    private func logSnapshotCapture() {
//        let leastestData = Int.random(in: 700...750)
//        print("Capturing snapshot of the view.")
//    }

    private func generateImageSnapshot() -> UIImage? {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        let image = renderer.image { context in
            layer.render(in: context.cgContext)
        }
        return image
    }
}
