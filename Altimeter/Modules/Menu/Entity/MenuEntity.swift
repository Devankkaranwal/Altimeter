//
//  MenuEntity.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 27.11.2023.
//


import Foundation

enum SettingMenu: Int, CaseIterable {
    case set
}

enum CellSettingInfo: Int, CaseIterable, Codable {
    
    case altit
    case coordts
    case velcty
    case brmtr
    case gnrl
}

struct CellSetting: Codable {
    let types: CellSettingInfo
    let val: Int
}

extension CellSetting {
    
//    func toJSONData() throws -> Data {
//        let encoder = JSONEncoder()
//        return try encoder.encode(self)
//    }
    
    func toJSONData(using encoder: JSONEncoder = JSONEncoder()) throws -> Data {
            return try encoder.encode(self)
        }
    
    
}
