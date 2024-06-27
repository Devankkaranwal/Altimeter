//
//  AltitudeCell.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 03.12.2023.
//




//import UIKit
//import SnapKit
//
//protocol delegateAltitd: AnyObject {
//    func updateAltitudeSetting(index: Int)
//}
//
//final class CellAltit: UITableViewCell {
//
//    weak var delegateAltit: delegateAltitd?
//
//    // MARK: - Private properties
//
//    private let items = ["Meters", "Feets"]
//    private var buttons: [UIButton] = []
//    private var underlineViews: [UIView] = []
//
//    // MARK: - UI Elements
//
//    private let lblTitle: UILabel = {
//        let label = UILabel()
//        label.font = CustomFontManager.semiBoldMedium
//        label.textColor = .white
//        label.text = txtDataLoclzed.BarSetting.altitude
//        return label
//    }()
//
//    private let lblDes: UILabel = {
//        let label = UILabel()
//        label.textColor = UIColor.white.withAlphaComponent(0.5)
//        label.font = CustomFontManager.boldchild
//        label.text = "(ALMS)"
//        return label
//    }()
//
//    private let stackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.spacing = 8
//        return stackView
//    }()
//
//    private let btnStack: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.spacing = 8
//        stackView.distribution = .fillEqually
//        return stackView
//    }()
//
//    // MARK: - Life Cycle
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setConstUI()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func dtaConfigs(index: Int?) {
//        let selectedIndex = index ?? 0
//        print("selectedIndex",selectedIndex)
//
//        uptBtnSel(selectedIndex: selectedIndex)
//        print("uptUI", uptBtnSel(selectedIndex: selectedIndex))
//    }
//
//    // MARK: - Private methods
//
//    private func setConstUI() {
//
//        backgroundColor = UIColor(hex: "#2C2C2C")
//        stackView.addArrangedSubview(lblTitle)
//        stackView.addArrangedSubview(lblDes)
//        contentView.addSubview(stackView)
//        contentView.addSubview(btnStack)
//        btnSet()
//        selectionStyle = .none
//        ConstSetUIS()
//    }
//
//    private func btnSet() {
//        items.enumerated().forEach { index, title in
//            let button = UIButton(type: .system)
//            button.setTitle(title, for: .normal)
//            button.setTitleColor(.white, for: .normal)
//            button.titleLabel?.font = CustomFontManager.semiBoldMedium
//            button.tag = index
//            button.addTarget(self, action: #selector(btnTap), for: .touchUpInside)
//            buttons.append(button)
//            btnStack.addArrangedSubview(button)
//
//            let underlineView = UIView()
//            underlineView.backgroundColor = index == 0 ? UIColor.green : .clear
//            underlineViews.append(underlineView)
//            contentView.addSubview(underlineView)
//        }
//    }
//
//    private func uptBtnSel(selectedIndex: Int) {
//        underlineViews.enumerated().forEach { index, underlineView in
//            underlineView.backgroundColor = index == selectedIndex ? UIColor.green : .clear
//        }
//    }
//
//    // MARK: - Actions
//
//    @objc
//    private func btnTap(sender: UIButton) {
//        let selectedIndex = sender.tag
//        uptBtnSel(selectedIndex: selectedIndex)
//        delegateAltit?.updateAltitudeSetting(index: selectedIndex)
//    }
//}
//
//// MARK: - Constraints
//
//private
//extension CellAltit {
//    func ConstSetUIS() {
//        stackView.snp.makeConstraints { make in
//            make.top.equalToSuperview().offset(-10)
//            make.leading.equalToSuperview().offset(16)
//        }
//
//        btnStack.snp.makeConstraints { make in
//            make.height.equalTo(46)
//            make.top.equalTo(stackView.snp.bottom).offset(16)
//            make.leading.equalToSuperview().offset(16)
//            make.trailing.equalToSuperview().offset(-16)
//        }
//
//        underlineViews.enumerated().forEach { index, underlineView in
//            underlineView.snp.makeConstraints { make in
//                make.height.equalTo(2)
//                make.top.equalTo(btnStack.snp.bottom)
//                make.leading.equalTo(buttons[index].snp.leading)
//                make.trailing.equalTo(buttons[index].snp.trailing)
//                make.bottom.equalToSuperview().offset(-24)
//            }
//        }
//    }
//}


import UIKit
import SnapKit

protocol delegateAltitd: AnyObject {
    func updateAltitudeSetting(index: Int)
}

final class CellAltit: UITableViewCell {

    weak var delegateAltit: delegateAltitd?

    // MARK: - Private properties

    private let items = ["Meters", "Feets"]
    private var buttons: [UIButton] = []
    private var underlineViews: [UIView] = []

    // MARK: - UI Elements

    private let lblTitle: UILabel = {
        let label = UILabel()
        label.font = CustomFontManager.semiBoldMedium
        label.textColor = .white
        label.text = txtDataLoclzed.BarSetting.altitude
        return label
    }()

    private let lblDes: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white.withAlphaComponent(0.5)
        label.font = CustomFontManager.boldchild
        label.text = "(ALMS)"
        return label
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()

    private let btnStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()

    // MARK: - Life Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setConstUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func dtaConfigs(index: Int?) {
        let selectedIndex = index ?? 0
        print("selectedIndex Altit", selectedIndex)
        uptBtnSel(selectedIndex: selectedIndex)
    }

    // MARK: - Private methods

    private func setConstUI() {
        backgroundColor = UIColor(hex: "#2C2C2C")
        stackView.addArrangedSubview(lblTitle)
        stackView.addArrangedSubview(lblDes)
        contentView.addSubview(stackView)
        contentView.addSubview(btnStack)
        btnSet()
        selectionStyle = .none
        ConstSetUIS()
    }

    private func btnSet() {
        items.enumerated().forEach { index, title in
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = CustomFontManager.semiBoldMedium
            button.tag = index
            button.addTarget(self, action: #selector(btnTap), for: .touchUpInside)
            buttons.append(button)
            btnStack.addArrangedSubview(button)

            let underlineView = UIView()
            underlineView.backgroundColor = index == 0 ? UIColor.green : .clear
            underlineViews.append(underlineView)
            contentView.addSubview(underlineView)
        }
    }

    private func uptBtnSel(selectedIndex: Int) {
        underlineViews.enumerated().forEach { index, underlineView in
            underlineView.backgroundColor = index == selectedIndex ? UIColor.green : .clear
        }
    }

    // MARK: - Actions

    @objc
    private func btnTap(sender: UIButton) {
        let selectedIndex = sender.tag
        print("selectedIndex btnTap Altit", selectedIndex)
        uptBtnSel(selectedIndex: selectedIndex)
        delegateAltit?.updateAltitudeSetting(index: selectedIndex)
    }
}

// MARK: - Constraints

private extension CellAltit {
    func ConstSetUIS() {
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(-10)
            make.leading.equalToSuperview().offset(16)
        }

        btnStack.snp.makeConstraints { make in
            make.height.equalTo(46)
            make.top.equalTo(stackView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
        }

        underlineViews.enumerated().forEach { index, underlineView in
            underlineView.snp.makeConstraints { make in
                make.height.equalTo(2)
                make.top.equalTo(btnStack.snp.bottom)
                make.leading.equalTo(buttons[index].snp.leading)
                make.trailing.equalTo(buttons[index].snp.trailing)
                make.bottom.equalToSuperview().offset(-24)
            }
        }
    }
}
