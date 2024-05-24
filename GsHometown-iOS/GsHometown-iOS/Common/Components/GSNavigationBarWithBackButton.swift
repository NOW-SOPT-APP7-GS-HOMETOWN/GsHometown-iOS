//
//  GSNavigationBarWithBackButton.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/24/24.
//

import UIKit

final class GSNavigationBarWithBackButton: UIView {

    let backButton: UIButton = UIButton()
    private let horizontalStackView: UIStackView = UIStackView()
    private let basketButton: UIButton = UIButton()
    private let searchButton: UIButton = UIButton()
    private let homeButton: UIButton = UIButton()

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
        backButton.do {
            $0.setImage(GSImage.backButton, for: .normal)
        }
        searchButton.do {
            $0.setImage(GSImage.searchButton, for: .normal)
        }
        homeButton.do {
            $0.setImage(GSImage.homeButton, for: .normal)
        }
        basketButton.do {
            $0.setImage(GSImage.basketButton, for: .normal)
        }
        horizontalStackView.do {
            $0.axis = .horizontal
            $0.alignment = .fill
            $0.distribution = .fillEqually
            $0.spacing = 16
        }
    }

    func setUI() {
        [
            searchButton,
            homeButton,
            basketButton
        ].forEach { horizontalStackView.addArrangedSubview($0) }

        [
            backButton,
            horizontalStackView
        ].forEach { addSubview($0) }
    }

    func setAutoLayout() {
        self.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        backButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.verticalEdges.equalToSuperview().inset(2)
            $0.height.equalTo(20)
        }
        horizontalStackView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(2)
            $0.trailing.equalToSuperview().inset(10)
        }
    }
}
