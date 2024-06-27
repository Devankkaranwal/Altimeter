//
//  BarometerCell.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 03.12.2023.
//



//import UIKit
//import SnapKit
//
//protocol DelBaromtr: AnyObject {
//    func modifyBarometer(index: Int)
//}
//
//final class CellBaromtr: UITableViewCell {
//
//    weak var delegtBarmtr: DelBaromtr?
//
//    // MARK: - Private properties
//
//    private let items = ["atm", "psi", "kPA", "inHg", "MmHg"]
//    private var buttons: [UIButton] = []
//    private var underlineViews: [UIView] = []
//
//    // MARK: - dataUI
//
//    private let lblTile: UILabel = {
//        let label = UILabel()
//        label.font = CustomFontManager.semiBoldMedium
//        label.textColor = .white
//        label.text = "Barometer"
//        return label
//    }()
//
//    // MARK: - dataCycle
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        constUI()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    // MARK: - DtaConfig
//
//    func dataconfig(index: Int?) {
//        let selectedIndex = index ?? 0 // Default to the third item
//        btnSelect(selectedIndex: selectedIndex)
//        print("selectedIndex Baromtr", selectedIndex)
//    }
//
//    // MARK: - Methodsdata
//
//    private func constUI() {
//
//    backgroundColor = UIColor(hex: "#2C2C2C")
//        contentView.addSubview(lblTile)
//        btnSets()
//        selectionStyle = .none
//        constUISet()
//    }
//
//    private func btnSets() {
//        items.enumerated().forEach { index, title in
//            let button = UIButton(type: .system)
//            button.setTitle(title, for: .normal)
//            button.setTitleColor(.white, for: .normal)
//            button.titleLabel?.font = CustomFontManager.boldSmall
//            button.tag = index
//            button.addTarget(self, action: #selector(btnTapd), for: .touchUpInside)
//            buttons.append(button)
//            contentView.addSubview(button)
//
//            let underlineView = UIView()
//            underlineView.backgroundColor = index == 0 ? UIColor.green : .clear // Default to the third item
//            underlineViews.append(underlineView)
//            contentView.addSubview(underlineView)
//        }
//    }
//
//    private func btnSelect(selectedIndex: Int) {
//        underlineViews.enumerated().forEach { index, underlineView in
//            underlineView.backgroundColor = index == selectedIndex ? UIColor.green : .clear
//        }
//    }
//
//    // MARK: - Actions
//
//    @objc
//    private func btnTapd(sender: UIButton) {
//        let selectedIndex = sender.tag
//        btnSelect(selectedIndex: selectedIndex)
//        delegtBarmtr?.modifyBarometer(index: selectedIndex)
//    }
//
//    // MARK: - Constraints
//
//    private func constUISet() {
//        lblTile.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(16)
//            make.leading.equalToSuperview().offset(16)
//        }
//
//        let totalSpacing = (items.count - 1) * 16 // Total spacing between buttons
//        let buttonWidth = (UIScreen.main.bounds.width - CGFloat(totalSpacing)) / CGFloat(items.count)
//
//        var previousButton: UIButton?
//
//        buttons.enumerated().forEach { index, button in
//            button.snp.makeConstraints { make in
//                make.top.equalTo(lblTile.snp.bottom).offset(16)
//                if let previousButton = previousButton {
//                    make.leading.equalTo(previousButton.snp.trailing).offset(16)
//                } else {
//                    make.leading.equalToSuperview().offset(0)
//                }
//                make.height.equalTo(46)
//                make.width.equalTo(buttonWidth)
//            }
//
//            let underlineView = underlineViews[index]
//            underlineView.snp.makeConstraints { make in
//                make.height.equalTo(2)
//                make.top.equalTo(button.snp.bottom)
//                make.leading.equalTo(button)
//                make.trailing.equalTo(button)
//                make.bottom.equalToSuperview().offset(-24)
//            }
//
//            previousButton = button
//        }
//    }
//}




import UIKit
import SnapKit

protocol BarometerDelegate: AnyObject {
    func didSelectBarometer(index: Int)
}

final class CellBaromtr: UITableViewCell {

    weak var delegtBarmtr: BarometerDelegate?

    private let items = ["atm", "psi", "kPA", "inHg", "MmHg"]
    private var buttons: [UIButton] = []
    private var underlineViews: [UIView] = []

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .white
        label.text = "Barometer"
        return label
    }()

    private var selectedIndex: Int = 0 // Default selection index

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(withSelectedIndex index: Int? = nil) {
        if let index = index {
            selectedIndex = index
        }
        updateUI()
    }

    private func configureUI() {
        backgroundColor = UIColor(hex: "#2C2C2C")
        contentView.addSubview(titleLabel)
        setupButtons()
        selectionStyle = .none
        setupConstraints()
    }

    private func setupButtons() {
        items.enumerated().forEach { index, title in
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .medium)
            button.tag = index
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            buttons.append(button)
            contentView.addSubview(button)

            let underlineView = UIView()
            underlineView.backgroundColor = index == selectedIndex ? UIColor.green : .clear
            underlineViews.append(underlineView)
            contentView.addSubview(underlineView)
        }
    }

    private func updateUI() {
        underlineViews.enumerated().forEach { index, underlineView in
            underlineView.backgroundColor = index == selectedIndex ? UIColor.green : .clear
        }
    }

    @objc private func buttonTapped(_ sender: UIButton) {
        selectedIndex = sender.tag
        print("selectedIndex buttonTapped Barmtr", selectedIndex)
        updateUI()
        delegtBarmtr?.didSelectBarometer(index: selectedIndex)
    }

    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
        }

        let totalSpacing = (items.count - 1) * 16
        let buttonWidth = (UIScreen.main.bounds.width - CGFloat(totalSpacing)) / CGFloat(items.count)

        var previousButton: UIButton?
        buttons.enumerated().forEach { index, button in
            button.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(16)
                if let previousButton = previousButton {
                    make.leading.equalTo(previousButton.snp.trailing).offset(16)
                } else {
                    make.leading.equalToSuperview().offset(0)
                }
                make.height.equalTo(46)
                make.width.equalTo(buttonWidth)
            }

            let underlineView = underlineViews[index]
            underlineView.snp.makeConstraints { make in
                make.height.equalTo(2)
                make.top.equalTo(button.snp.bottom)
                make.leading.trailing.equalTo(button)
                make.bottom.equalToSuperview().offset(-24)
            }

            previousButton = button
        }
    }
}
