//
//  ServiceCell.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/13/24.
//

import UIKit

import SnapKit
import Then

final class ServiceCell: UICollectionViewCell {

    private let serviceButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setAutoLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUI() {
        self.addSubview(serviceButton)
    }

    private func setAutoLayout() {
        serviceButton.snp.makeConstraints {
            $0.verticalEdges.horizontalEdges.equalToSuperview()
        }
    }

    func bindData(type: ServiceType) {
        self.serviceButton.setImage(
            type.image,
            for: .normal
        )
    }
}
