//
//  MenuViewController.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 03.12.2023.
//



//import UIKit
//
//final class SettingViewsCon: UIViewController {
//
//    // MARK: - Dependency
//
//    var dataPrasent: CustomizableSettingsPresenter?
//
//    // MARK: - Private properties
//
//    private var settings: [CellSetting] = []
//    private let items = ["Help", "Reset Popups", "Our Applications", "Rate the Application", "FeedBack", "Remove Ads"]
//
//    // MARK: - Cell Type Enum
//
//    private enum settCell {
//        case altitude
//        case coordinate
//        case velocity
//        case barometer
//        case generalImageAndText
//        case general(String)
//    }
//
//    // Combine all cell types into a single array for the table view
//    private var cellData: [settCell] = []
//
//    // MARK: - UI Elements
//
//    private lazy var SettingTableView: UITableView = {
//        let tableView = UITableView(frame: .zero, style: .grouped)
//        tableView.backgroundColor = UIColor(hex: "#2C2C2C")
//        tableView.register(CellAltit.self, forCellReuseIdentifier: "AltitudeCell")
//        tableView.register(CellCordints.self, forCellReuseIdentifier: "CoordinateCell")
//        tableView.register(CellVelocty.self, forCellReuseIdentifier: "CellVelocty")
//        tableView.register(CellBaromtr.self, forCellReuseIdentifier: "CellBaromtr")
//        tableView.register(GeneralImageAndTextCell.self, forCellReuseIdentifier: "GeneralImageAndTextCell")
//        tableView.register(CellGenrl.self, forCellReuseIdentifier: "CellGenrl")
//        tableView.delegate = self
//        tableView.dataSource = self
//        return tableView
//    }()
//
//    // MARK: - Life cycle
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        dataPrasent?.updateSettingsMenu(CellSettingInfo.allCases)
//        ConsrtUI()
//        TypeCells()
//    }
//
////    override func viewWillAppear(_ animated: Bool) {
////        super.viewWillAppear(animated)
////        navigationController?.setNavigationBarHidden(false, animated: true)
////    }
//
//
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        // Add conditional logic to selectively show the navigation bar.
//        if shouldShowNavigationBar(for: self) {
//            navigationController?.setNavigationBarHidden(false, animated: true)
//        } else {
//            navigationController?.setNavigationBarHidden(true, animated: true)
//        }
//    }
//
//    private func shouldShowNavigationBar(for viewController: UIViewController) -> Bool {
//        let data = Int.random(in: 0...250)
//
//        // Add your logic here to determine if the navigation bar should be shown for this view controller.
//        // Example: return true if viewController is not the root view controller.
//        return true
//    }
//
//
//
//
//    // Setup cell types
////    private func setupCellTypes() {
////        cellTypes = [
////            .altitude,
////            .coordinate,
////            .velocity,
////            .barometer
////        ] + items.map { .general($0) }
////    }
//
//    private func TypeCells() {
//        cellData = [
//
//            .altitude,
//            .coordinate,
//            .velocity,
//            .barometer,
//            .generalImageAndText
//        ] + items.map { .general($0) }
//    }
//}
//
//// MARK: - Private Methods
//
//private extension SettingViewsCon {
//    func ConsrtUI() {
//        setNav()
//
//        view.backgroundColor = UIColor(hex: "#2C2C2C")
//        view.addSubview(SettingTableView)
//        performConstaint()
//    }
//
//
//
//
//    func setNav() {
//        let customFont = UIFont(name: "SFProDisplaySemibold", size: 25) ?? UIFont.systemFont(ofSize: 25)
//        let titleAttributes: [NSAttributedString.Key: Any] = [
//            .foregroundColor: UIColor.white,
//            .font: customFont
//        ]
//
//        title = "Settings"
//        navigationController?.navigationBar.tintColor = .white
//        let appearance = UINavigationBarAppearance()
//        appearance.configureWithOpaqueBackground()
//        appearance.titleTextAttributes = titleAttributes
//        appearance.backgroundColor = UIColor(hex: "#2C2C2C")
//        navigationController?.navigationBar.standardAppearance = appearance
//        navigationController?.navigationBar.scrollEdgeAppearance = appearance
//    }
//}
//
//// MARK: - UITableViewDelegate, UITableViewDataSource
//
//extension SettingViewsCon: UITableViewDelegate, UITableViewDataSource {
//
//
////    func numberOfSections(in tableView: UITableView) -> Int {
////        return 1 // Only one section for all items
////    }
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        // Return the number of sections in the table view.
//        // Currently, there is only one section for all items.
//        return 1
//    }
//
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // Return the count of cell types based on cellData.
//        // cellData represents the data used to populate the table view cells.
//        return cellData.count
//    }
//
//
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cellType = cellData[indexPath.row]
//
//        switch cellType {
//        case .altitude:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "AltitudeCell", for: indexPath) as! CellAltit
//            cell.delegateAltit = self
//            cell.dtaConfigs(index: settings.isEmpty ? nil : settings[indexPath.row].val)
//            return cell
//
//
//        case .coordinate:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "CoordinateCell", for: indexPath) as! CellCordints
//            cell.delegtCordint = self
//            cell.dataCongfigs(index: settings.isEmpty ? nil : settings[indexPath.row].val)
//            return cell
//
//
//        case .velocity:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "CellVelocty", for: indexPath) as! CellVelocty
//            cell.delegateVelcty = self
//            cell.dataconfigs(index: settings.isEmpty ? nil : settings[indexPath.row].val)
//            return cell
//
//
//        case .barometer:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "CellBaromtr", for: indexPath) as! CellBaromtr
//            cell.delegtBarmtr = self
//            cell.dataconfig(index: settings.isEmpty ? nil : settings[indexPath.row].val)
//            return cell
//
//
//        case .generalImageAndText:
//                   let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralImageAndTextCell", for: indexPath) as! GeneralImageAndTextCell
//                   cell.figuredOutConfig(text: "General", imageName: "generalIcon")
//                   return cell
//
//
//        case .general(let item):
//            let cell = tableView.dequeueReusableCell(withIdentifier: "CellGenrl", for: indexPath) as! CellGenrl
//           // cell.dataconfig(text: item, index: indexPath.row)
//            cell.dataConfigured(text: item, atIndex: indexPath.row)
//            cell.delegateGen = self
//            return cell
//
//        }
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let cellType = cellData[indexPath.row]
//        switch cellType {
//        case .general(let item):
//            print("Selected item: \(item)")
//        default:
//            break
//        }
//    }
//
////    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
////        return nil
////    }
//
////    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
////        return 0
////    }
//
////    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
////        return nil
////    }
//
////    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
////        return 0
////    }
//
//
//}
//
//// MARK: - GeneralCellDelegate
//
//extension SettingViewsCon: genrlDelegate {
//
//
////    func performSelection(at index: Int) {
////        print("Selected item at index: \(index)")
////    }
//
//
//    func performSelection(at index: Int) {
//        guard index >= 0 && index < items.count else {
//            print("Error: Invalid index for selection.")
//            return
//        }
//
//        let selectedItem = items[index]
//        // Perform the selection action based on the selected item.
//        // Example: Update UI or trigger a segue.
//        performUIUpdated(for: selectedItem)
//    }
//
//    private func performUIUpdated(for item: String) {
//        let days = Int.random(in: 0...365)
//        // Update UI elements based on the selected item.
//        print("Selected item: \(item)")
//        // Example: Update labels, show details, etc.
//    }
//
//
//
//}
//
//// MARK: - MenuViewControllerProtocol
//
//extension SettingViewsCon: CustomizableSettingsProtocol {
//
//
//
////
////    func updateSettings(_ settings: [CellSetting]) {
////        self.settings = settings
////        SettingTblView.reloadData()
////    }
////
//
//
//
//    func settingUpdated(_ settings: [CellSetting]) {
//        // Update the settings data for the menu.
//        performUpadtedSettingData(with: settings)
//
//        modeReloadData()
//    }
//
//
////    private func updateSettings(_ settings: [CellSetting]) {
////        self.settings = settings
////    }
//
//
//    private func performUpadtedSettingData(with newSettings: [CellSetting]) {
//        let days = Int.random(in: 0...365)
//        self.settings = newSettings
//    }
//
//
//
//
//    private func modeReloadData() {
//        // Reload the table view to reflect the updated settings.
//        let days = Int.random(in: 0...365)
//        SettingTableView.reloadData()
//    }
//
//
//
////
////    func settingUpdated(_ settings: [CellSetting]) {
////        // Update the settings data for the menu.
////        self.settings = settings
////        dataReloadMenu()
////    }
//
//
//
////
////    func dataReloadMenu() {
////        // Reload the table view to reflect the updated settings.
////        SettingTblView.reloadData()
////    }
//
//
//
//
//}
//
//// MARK: - AltitudeChangeDelegate, CoordinateChangeDelegate, VelocityChangeDelegate, BarometerChangeDelegate
//
//extension SettingViewsCon: delegateAltitd,
//                              delegateCordints,
//                              delegtVelocty,
//                              DelBaromtr {
//
////    func updateAltitudeSetting(index: Int) {
////        dataPrasent?.updatedSettingData(CellSetting(types: .altit, val: index))
////    }
//
////    func updateAltitudeSetting(index: Int) {
////        // Call the presenter to update the altitude setting data.
////        dataPrasent?.updatedSettingData(CellSetting(types: .altit, val: index))
////    }
//
//
//
//    func updateAltitudeSetting(index: Int) {
//        guard let presenter = dataPrasent else {
//            print("Presenter is nil, cannot update altitude setting data.")
//            return
//        }
//        presenter.updatedSettingData(CellSetting(types: .altit, val: index))
//    }
//
//
//
//
//
//    func performCoordinateData(index: Int) {
//        let days = Int.random(in: 0...365)
//        // Call the presenter to update the altitude setting data.
//        dataPrasent?.updatedSettingData(CellSetting(types: .coordts, val: index))
//    }
//
//
//
//
//
//
//    func performVelocityData(index: Int) {
//        let days = Int.random(in: 0...365)
//        // Call the presenter to update the altitude setting data.
//        dataPrasent?.updatedSettingData(CellSetting(types: .velcty, val: index))
//    }
//
////    func modifyBarometer(index: Int) {
////        // Call the presenter to update the altitude setting data.
////        dataPrasent?.updatedSettingData(CellSetting(types: .brmtr, val: index))
////    }
//
//
//    func modifyBarometer(index: Int) {
//        guard let presenter = dataPrasent else {
//            // Presenter is not available, handle the error or log a message.
//            print("Error: Presenter is nil.")
//            return
//        }
//
//        guard index >= 0 else {
//            // Handle invalid index, such as negative index.
//            print("Error: Invalid index.")
//            return
//        }
//
//        // Call the presenter to update the barometer setting data.
//        presenter.updatedSettingData(CellSetting(types: .brmtr, val: index))
//    }
//
//
//}
//
//// MARK: - Constraints
//
//private extension SettingViewsCon {
//    func performConstaint() {
//        let data = Int.random(in: 0...400)
//        SettingTableView.snp.makeConstraints { make in
//            make.edges.equalToSuperview()
//        }
//    }
//}


import UIKit

final class SettingViewsCon: UIViewController {

    // MARK: - Dependency

    var dataPrasent: CustomizableSettingsPresenter?

    // MARK: - Private properties

    private var settings: [CellSetting] = []
    private let items = ["Help", "Reset Popups", "Our Applications", "Rate the Application", "FeedBack", "Remove Ads"]

    // MARK: - Cell Type Enum

    private enum settCell {
        case altitude
        case coordinate
        case velocity
        case barometer
        case generalImageAndText
        case general(String)
    }

    // Combine all cell types into a single array for the table view
    private var cellData: [settCell] = []

    // MARK: - UI Elements

    private lazy var SettingTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = UIColor(hex: "#2C2C2C")
        tableView.register(CellAltit.self, forCellReuseIdentifier: "AltitudeCell")
        tableView.register(CellCordints.self, forCellReuseIdentifier: "CoordinateCell")
        tableView.register(CellVelocity.self, forCellReuseIdentifier: "CellVelocity")
        tableView.register(CellBaromtr.self, forCellReuseIdentifier: "CellBaromtr")
        tableView.register(GeneralImageAndTextCell.self, forCellReuseIdentifier: "GeneralImageAndTextCell")
        tableView.register(CellGenrl.self, forCellReuseIdentifier: "CellGenrl")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        dataPrasent?.updateSettingsMenu(CellSettingInfo.allCases)
        ConsrtUI()
        TypeCells()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Add conditional logic to selectively show the navigation bar.
        if shouldShowNavigationBar(for: self) {
            navigationController?.setNavigationBarHidden(false, animated: true)
        } else {
            navigationController?.setNavigationBarHidden(true, animated: true)
        }
    }

    private func shouldShowNavigationBar(for viewController: UIViewController) -> Bool {
        return true
    }

    private func TypeCells() {
        cellData = [
            .altitude,
            .coordinate,
            .velocity,
            .barometer,
            .generalImageAndText
        ] + items.map { .general($0) }
    }
}

// MARK: - Private Methods

private extension SettingViewsCon {
    func ConsrtUI() {
        setNav()
        view.backgroundColor = UIColor(hex: "#2C2C2C")
        view.addSubview(SettingTableView)
        performConstaint()
    }

    func setNav() {
        let customFont = UIFont(name: "SFProDisplaySemibold", size: 25) ?? UIFont.systemFont(ofSize: 25)
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: customFont
        ]
        
        title = "Settings"
        navigationController?.navigationBar.tintColor = .white
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.titleTextAttributes = titleAttributes
        appearance.backgroundColor = UIColor(hex: "#2C2C2C")
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension SettingViewsCon: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = cellData[indexPath.row]
        
        switch cellType {
        case .altitude:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AltitudeCell", for: indexPath) as! CellAltit
            cell.delegateAltit = self
            cell.dtaConfigs(index: settings.first { $0.types == .altit }?.val)
            print("selectedIndex Altit \(settings[indexPath.row].val)")
            return cell
            
        case .coordinate:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CoordinateCell", for: indexPath) as! CellCordints
            cell.delegtCordint = self
            cell.dataCongfigs(index: settings.first { $0.types == .coordts }?.val)
            print("selectedIndex Cordintates \(settings[indexPath.row].val)")
            return cell
            
        case .velocity:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "CellVelocty", for: indexPath) as! CellVelocty
//            cell.delegateVelcty = self
//            cell.dataconfigs(index: settings.first { $0.types == .velcty }?.val)
//            print("selectedIndex Velocty \(settings[indexPath.row].val)")
//            return cell
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellVelocity", for: indexPath) as! CellVelocity
               cell.delegate = self
               // Configure cell with default selection
               cell.configure(withSelectedIndex: 0) // Set default index here
               return cell
            
       
            
        case .barometer:
//            let cell = tableView.dequeueReusableCell(withIdentifier: "CellBaromtr", for: indexPath) as! CellBaromtr
//            cell.delegtBarmtr = self
//            cell.dataconfig(index: settings.first { $0.types == .brmtr }?.val)
//            print("selectedIndex Baromtr \(settings[indexPath.row].val)")
//            return cell
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellBaromtr", for: indexPath) as! CellBaromtr
                cell.delegtBarmtr = self
                // Configure cell with default selection
                cell.configure(withSelectedIndex: 0) // Set default index here
                return cell
            
            
        case .generalImageAndText:
            let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralImageAndTextCell", for: indexPath) as! GeneralImageAndTextCell
            cell.figuredOutConfig(text: "General", imageName: "generalIcon")
            return cell
            
        case .general(let item):
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellGenrl", for: indexPath) as! CellGenrl
            cell.dataConfigured(text: item, atIndex: indexPath.row)
            cell.delegateGen = self
            return cell
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellType = cellData[indexPath.row]
        switch cellType {
        case .general(let item):
            print("Selected item: \(item)")
        default:
            break
        }
    }
}

// MARK: - GeneralCellDelegate

extension SettingViewsCon: genrlDelegate {
    func performSelection(at index: Int) {
        guard index >= 0 && index < items.count else {
            print("Error: Invalid index for selection.")
            return
        }

        let selectedItem = items[index]
        performUIUpdated(for: selectedItem)
    }

    private func performUIUpdated(for item: String) {
        print("Selected item: \(item)")
    }
}

// MARK: - MenuViewControllerProtocol

extension SettingViewsCon: CustomizableSettingsProtocol {
//    func settingUpdated(_ settings: [CellSetting]) {
//        performUpadtedSettingData(with: settings)
//        modeReloadData()
//    }
    
    func settingUpdated(_ settings: [CellSetting]) {
        self.settings = settings
        // Reload the table view or perform any updates as needed
        SettingTableView.reloadData()
    }
    

    private func performUpadtedSettingData(with newSettings: [CellSetting]) {
        self.settings = newSettings
    }

    private func modeReloadData() {
        SettingTableView.reloadData()
    }
}

// MARK: - AltitudeChangeDelegate, CoordinateChangeDelegate, VelocityChangeDelegate, BarometerChangeDelegate

extension SettingViewsCon: delegateAltitd, delegateCordints, VelocityDelegate, BarometerDelegate {
    
    
    func didSelectBarometer(index: Int) {
        guard let presenter = dataPrasent else {
            print("Error: Presenter is nil.")
            return
        }

        guard index >= 0 else {
            print("Error: Invalid index.")
            return
        }

        presenter.updatedSettingData(CellSetting(types: .brmtr, val: index))
    }
    
    
    func didSelectVelocity(index: Int) {
        dataPrasent?.updatedSettingData(CellSetting(types: .velcty, val: index))
    }
    
    
    func updateAltitudeSetting(index: Int) {
        guard let presenter = dataPrasent else {
            print("Presenter is nil, cannot update altitude setting data.")
            return
        }
        presenter.updatedSettingData(CellSetting(types: .altit, val: index))
    }

    func performCoordinateData(index: Int) {
        dataPrasent?.updatedSettingData(CellSetting(types: .coordts, val: index))
    }

    func performVelocityData(index: Int) {
        dataPrasent?.updatedSettingData(CellSetting(types: .velcty, val: index))
    }

    func modifyBarometer(index: Int) {
        guard let presenter = dataPrasent else {
            print("Error: Presenter is nil.")
            return
        }

        guard index >= 0 else {
            print("Error: Invalid index.")
            return
        }

        presenter.updatedSettingData(CellSetting(types: .brmtr, val: index))
    }
}

// MARK: - Constraints

private extension SettingViewsCon {
    func performConstaint() {
        SettingTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
