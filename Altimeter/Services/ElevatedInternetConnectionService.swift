//
//  InternetConnectionService.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 09.02.2024.
//


//import Foundation
//import Network
//
//protocol InternetConnectionServiceProtocol {
//    func initiateNetworkMonitoring()
//    func haltNetworkMonitoring()
//}
//
//final class ElevatedInternetConnectionService: InternetConnectionServiceProtocol {
//    static let shared = ElevatedInternetConnectionService()
//
//    // MARK: - Private properties
//
//    private let monitorQueue = DispatchQueue(label: "NetworkConnectivityMonitor")
//    private let monitor: NWPathMonitor
//
//    private(set) var isConnected = false
//    private(set) var isExpensive = false
//    private(set) var currentConnectionType: NWInterface.InterfaceType?
//
//
//    // MARK: - Life cycle
//
//    private init() {
//        monitor = NWPathMonitor()
//    }
//
//
//    // MARK: - Functions
//
//    func initiateNetworkMonitoring() {
//        monitor.pathUpdateHandler = { [weak self] path in
//            self?.isConnected = path.status != .unsatisfied
//            self?.isExpensive = path.isExpensive
//            self?.currentConnectionType = NWInterface.InterfaceType.allCases.filter { path.usesInterfaceType($0) }.first
//
//            NotificationCenter.default.post(name: .connectivityStatus, object: nil)
//        }
//        monitor.start(queue: monitorQueue)
//    }
//
//    func haltNetworkMonitoring() {
//        monitor.cancel()
//    }
//}
//
//extension Notification.Name {
//    static let connectivityStatus = Notification.Name(rawValue: "connectivityStatusChanged")
//}
//
//
//extension NWInterface.InterfaceType: CaseIterable {
//    public static var allCases: [NWInterface.InterfaceType] = [
//        .other,
//        .wifi,
//        .cellular,
//        .loopback,
//        .wiredEthernet]
//}


import Foundation
import Network

protocol InternetConnectionServiceProtocol {
    func initiateNetworkMonitoring()
    func haltNetworkMonitoring()
}

final class ElevatedInternetConnectionService: InternetConnectionServiceProtocol {
    static let shared = ElevatedInternetConnectionService()
    
    // MARK: - Private properties

   // private let monitor: NWPathMonitor
    private var monitor = NWPathMonitor()
  //  private let monitorQueue = DispatchQueue(label: "NetworkConnectivityMonitor")
    private let monitorQueue = DispatchQueue(label: "InternetMonitor")
    
//    private(set) var isConnected = false
    private(set) var isExpensive = false
    private(set) var currentConnectionType: NWInterface.InterfaceType?
    
    var isConnected: Bool = false
    // MARK: - Life cycle

    private init() {
        monitor = NWPathMonitor()
    }
    
    
    // MARK: - Functions
    

    
    func initiateNetworkMonitoring() {
            monitor.pathUpdateHandler = { [weak self] path in
                guard let self = self else { return }
                
                let wasConnected = self.isConnected
                self.isConnected = path.status == .satisfied
                self.isExpensive = path.isExpensive
               self.currentConnectionType = NWInterface.InterfaceType.allCases.first { path.usesInterfaceType($0) }
                
                if self.isConnected {
                    print("Internet is available")
                } else {
                    print("No internet connection")
                }
                
                if wasConnected != self.isConnected {
                    DispatchQueue.main.async {
                        NotificationCenter.default.post(name: .connectivityStatusChanged, object: self, userInfo: ["connectionStatus": self.isConnected])
                    }
                }
            }
            monitor.start(queue: monitorQueue)
        }
    
    
    
    
    func haltNetworkMonitoring() {
        monitor.cancel()
    }
}

extension Notification.Name {
    static let connectivityStatusChanged = Notification.Name(rawValue: "connectivityStatusChanged")
}

extension NWInterface.InterfaceType: CaseIterable {
    public static var allCases: [NWInterface.InterfaceType] = [
        .other,
        .wifi,
        .cellular,
        .loopback,
        .wiredEthernet]
}
