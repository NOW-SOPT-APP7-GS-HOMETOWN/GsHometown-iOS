//
//  OrderServiceCell.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/13/24.
//

import UIKit

import SnapKit
import Then

final class OrderServiceCell: UICollectionViewCell {

    weak var delegate: HomeCoordinatorDelegate?
    private let titleLabel: UILabel = UILabel()
    private let subTitleLabel: UILabel = UILabel()
    private let pickUpButton: UIButton = UIButton()
    private let deliveryButton: UIButton = UIButton()
    private let preOrderButton: UIButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setAutoLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setStyle() {
        self.layer.cornerRadius = 20
        titleLabel.do {
            $0.font = GSFont.h4
            $0.textColor = GSColor.grey10
        }
        subTitleLabel.do {
            $0.font = GSFont.b4m
            $0.textColor = GSColor.grey10
        }
        pickUpButton.do {
            $0.layer.cornerRadius = 20
            $0.backgroundColor = .white
        }
        deliveryButton.do {
            $0.layer.cornerRadius = 20
            $0.backgroundColor = .white
        }
        preOrderButton.do {
            $0.layer.cornerRadius = 14
            $0.backgroundColor = .white
            $0.addTarget(self, action: #selector(preorderButtonTapped), for: .touchUpInside)
        }
    }

    private func setUI() {
        [
            titleLabel,
            subTitleLabel,
            pickUpButton,
            deliveryButton,
            preOrderButton
        ].forEach {
            self.addSubview($0)
        }
    }

    private func setAutoLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.leading.equalToSuperview().inset(16)
        }
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(1)
            $0.leading.equalToSuperview().inset(16)
        }
        pickUpButton.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalTo(deliveryButton.snp.leading).offset(-8)
            $0.height.equalTo(58)
        }
        deliveryButton.snp.makeConstraints {
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(8)
            $0.leading.equalTo(pickUpButton.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(58)
            $0.width.equalTo(pickUpButton.snp.width)
        }
        preOrderButton.snp.makeConstraints {
            $0.top.equalTo(pickUpButton.snp.bottom).offset(8)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(42)
        }
    }

    @objc
    func preorderButtonTapped(_ sender: UIButton) {
        self.delegate?.goToPreOrderView()
    }

    func bindData(type: OrderServiceType) {
        self.backgroundColor = type.backgroundColor
        titleLabel.text = type.title
        subTitleLabel.text = type.subtitle
        pickUpButton.setImage(type.pickUpImage, for: .normal)
        deliveryButton.setImage(type.deliveryImage, for: .normal)
        preOrderButton.setImage(type.preOrderImage, for: .normal)
    }
}
