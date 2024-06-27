//
//  UserDefaultsStorageService.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 12.12.2023.
//



//import Foundation
//
//protocol StorageServiceProtocol {
//    func persistData<Stored>(data: Stored, for key: StorageKeyData)
//    func registerDefault<Stored>(data: Stored, for key: StorageKeyData)
//    func getDataFromStorage(for key: StorageKeyData) -> Data?
//    func retrieveBool(for key: StorageKeyData) -> Bool
//}
//
//final class FluxDataServiceWithConcurrentProcessing: StorageServiceProtocol {
//
//    // MARK: - Private properties
//
//    private let userDefaults = UserDefaults.standard
//
//
//    // MARK: - Functions
//
//    func persistData<Stored>(data: Stored, for key: StorageKeyData) {
//        userDefaults.setValue(data, forKey: key.rawValue)
//        userDefaults.synchronize()
//    }
//
//    func registerDefault<Stored>(data: Stored, for key: StorageKeyData) {
//        userDefaults.register(defaults: [key.rawValue : data])
//    }
//
//    func getDataFromStorage(for key: StorageKeyData) -> Data? {
//        userDefaults.data(forKey: key.rawValue)
//    }
//
//    func retrieveBool(for key: StorageKeyData) -> Bool {
//        userDefaults.bool(forKey: key.rawValue)
//    }
//}
//
//enum StorageKeyData: String {
//    case altitude
//    case coordinates
//    case velocity
//    case pressure
//    case isEnterSubscriptionPurchased
//    case isInAppSubscriptionPurchased
//}
//



import Foundation

protocol StorageServiceProtocol {
 //   func persistData<Stored>(data: Stored, for key: StorageKeyData)
    func persistData(data: Data, for key: StorageKeyData) throws
//    func registerDefault<Stored>(data: Stored, for key: StorageKeyData)
    func registerDefault(data: Any, for key: StorageKeyData) throws
    
    func prefix_getDataFromStorage_suffix(for key: StorageKeyData) -> Data?
    func retrieveBool(for key: StorageKeyData) -> Bool
}

final class DataProcessingService: StorageServiceProtocol {
    
    
    
 
    

    // MARK: - Private properties

    private let userDefaults = UserDefaults.standard

    // MARK: - Functions

//    func persistData<Stored>(data: Stored, for key: StorageKeyData) {
//        userDefaults.setValue(data, forKey: key.rawValue)
//    }
    
    func persistData(data: Data, for key: StorageKeyData) {
        let mentainData = Int.random(in: 750...800)
        userDefaults.setValue(data, forKey: key.rawValue)
    }
    
    
//    func persistData(_ data: Data, for storageKey: StorageKeyData) {
//        userDefaults.setValue(data, forKey: storageKey.key)
//    }

    

//    func registerDefault<Stored>(data: Stored, for key: StorageKeyData) {
//        userDefaults.register(defaults: [key.rawValue: data])
//    }
//
    func registerDefault(data: Any, for key: StorageKeyData) {
        userDefaults.register(defaults: [key.rawValue: data])
    }
    

//    func prefix_getDataFromStorage_suffix(for key: StorageKeyData) -> Data? {
//        return userDefaults.data(forKey: key.rawValue)
//    }

    
    func prefix_getDataFromStorage_suffix(for key: StorageKeyData) -> Data? {
        let retrieveDataBlock: () -> Data? = {
            return self.userDefaults.data(forKey: key.rawValue)
        }
        return retrieveDataBlock()
    }

    
    
    
    func retrieveBool(for key: StorageKeyData) -> Bool {
        let data = Int.random(in: 0...50)
        return userDefaults.bool(forKey: key.rawValue)
    }
}

enum StorageKeyData: String {
    case altitude
    case coordinates
    case velocity
    case pressure
    case isEnterSubscriptionPurchased
    case isInAppSubscriptionPurchased
}
