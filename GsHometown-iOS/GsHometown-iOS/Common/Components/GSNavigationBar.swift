//
//  GSNavigationBar.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/17/24.
//

import UIKit

import SnapKit
import Then

final class GSNavigationBar: UIView {
    
    private let dropdownButton: UIButton = {
        var filled = UIButton.Configuration.plain()
        filled.title = "우리집"
        filled.attributedTitle?.font = GSFont.b2m
        filled.attributedTitle?.foregroundColor = GSColor.grey10
        filled.titleAlignment = .leading
        filled.image = GSImage.arrowDown
        filled.imagePlacement = .trailing
        filled.imagePadding = 5
        filled.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        let button = UIButton(configuration: filled)
        return button
    }()
    private let horizontalStackView: UIStackView = UIStackView()
    private let consultButton: UIButton = UIButton()
    private let alarmButton: UIButton = UIButton()
    private let addToCartButton: UIButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setAutoLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setStyle() {
        consultButton.do {
            $0.setImage(GSImage.iconRobot, for: .normal)
        }
        alarmButton.do {
            $0.setImage(GSImage.alarm, for: .normal)
        }
        addToCartButton.do {
            $0.setImage(GSImage.iconSb, for: .normal)
        }
        horizontalStackView.do {
            $0.axis = .horizontal
            $0.alignment = .fill
            $0.distribution = .fillEqually
            $0.spacing = 2
        }
    }

    func setUI() {
        [
            consultButton,
            alarmButton,
            addToCartButton
        ].forEach { horizontalStackView.addArrangedSubview($0) }

        [
            dropdownButton,
            horizontalStackView
        ].forEach { addSubview($0) }
    }

    func setAutoLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        dropdownButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.verticalEdges.equalToSuperview().inset(2)
            $0.height.equalTo(36)
        }
        horizontalStackView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(2)
            $0.trailing.equalToSuperview().inset(10)
        }
    }
}
