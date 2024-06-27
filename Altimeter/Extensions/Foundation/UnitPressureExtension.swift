//
//  UnitPressureExtension.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 14.12.2023.
//


import Foundation

extension UnitPressure {
    static let atmosDta = UnitPressure(
        symbol: "atm",
        converter: UnitConverterLinear(coefficient: 101325)
    )
}
