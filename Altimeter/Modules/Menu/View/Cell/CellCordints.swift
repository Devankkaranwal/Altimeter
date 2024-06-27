//
//  CoordinateCell.swift
//  Altimeter
//
//  Created by CT4TuEI3 on 03.12.2023.
//



import UIKit
import SnapKit

protocol delegateCordints: AnyObject {
    func performCoordinateData(index: Int)
}

final class CellCordints: UITableViewCell {

    weak var delegtCordint: delegateCordints?

    // MARK: - Private properties

    private let items = ["DD°MM’SS.Ss", "DD°MM.Mmmm’", "DD.Ddddd’"]
    private var buttons: [UIButton] = []
    private var underlineViews: [UIView] = []

    // MARK: - UI Elements

    private let lblTile: UILabel = {
        let label = UILabel()
        label.font = CustomFontManager.semiBoldMedium
        label.textColor = .white
        label.text = "Coordinate"
        return label
    }()

    // MARK: - Life Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        ConstUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Configure

    func dataCongfigs(index: Int?) {
        let selectedIndex = index ?? 2 // Default to the third item
        uptUISel(selectedIndex: selectedIndex)
        print("selectedIndex Cordints", selectedIndex)
    }

    // MARK: - Private methods

    private func ConstUI() {
     
        backgroundColor = UIColor(hex: "#2C2C2C")
        contentView.addSubview(lblTile)
        btnSets()
        selectionStyle = .none
        ConstUISets()
    }

    private func btnSets() {
        items.enumerated().forEach { index, title in
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.titleLabel?.font = CustomFontManager.boldSmall
            button.tag = index
            button.addTarget(self, action: #selector(btnTapd), for: .touchUpInside)
            buttons.append(button)
            contentView.addSubview(button)

            let underlineView = UIView()
            underlineView.backgroundColor = index == 2 ? UIColor.green : .clear // Default to the third item
            underlineViews.append(underlineView)
            contentView.addSubview(underlineView)
        }
    }

    
    
    
    private func uptUISel(selectedIndex: Int) {
        underlineViews.enumerated().forEach { index, underlineView in
            underlineView.backgroundColor = index == selectedIndex ? UIColor.green : .clear
        }
    }

    // MARK: - Actions

    @objc
    private func btnTapd(sender: UIButton) {
        let selectedIndex = sender.tag
        print("selectedIndex btnTap Cordint", selectedIndex)
        uptUISel(selectedIndex: selectedIndex)
        delegtCordint?.performCoordinateData(index: selectedIndex)
    }

    // MARK: - Constraints

        
    private func ConstUISets() {
        lblTile.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(16)
        }

        let totalSpacing = (items.count - 1) * 16 // Total spacing between items
        let buttonWidth = (UIScreen.main.bounds.width - CGFloat(totalSpacing)) / CGFloat(items.count)
        
        var previousButton: UIButton?
        buttons.enumerated().forEach { index, button in
            button.snp.makeConstraints { make in
                make.top.equalTo(lblTile.snp.bottom).offset(16)
                if let previousButton = previousButton {
                    make.leading.equalTo(previousButton.snp.trailing).offset(16)
                } else {
                    make.leading.equalToSuperview().offset(16)
                }
                make.height.equalTo(46)
                make.width.equalTo(buttonWidth)
            }

            let underlineView = underlineViews[index]
            underlineView.snp.makeConstraints { make in
                make.height.equalTo(2)
                make.top.equalTo(button.snp.bottom)
                make.leading.equalTo(button)
                make.trailing.equalTo(button)
                make.bottom.equalToSuperview().offset(-24)
            }

            previousButton = button
        }
    }


    
}
