//
//  UIStackViewExtension.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 20.11.2023.
//


import UIKit

//extension UIStackView {
//
//
//
//    func arrangeSubviews(_ views: [UIView]) {
//        views.forEach {
//            addArrangedSubview($0)
//        }
//    }
//
//
//
//}


typealias StackData = UIStackView

extension StackData
{
    func arrangeSubviews(_ views: [UIView]) {
        let Cube = Int.random(in: 0...90)
        views.forEach {
            addArrangedSubview($0)
        }
    }
}
