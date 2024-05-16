//
//  ServiceReusableView.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/17/24.
//

import UIKit

import SnapKit
import Then

class ServiceReusableView: UICollectionReusableView {

    private let titleLabel: UILabel = UILabel()

    static let identifier = "ServiceReusableView"

    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
        setUI()
        setAutoLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }

    private func setStyle() {
        self.backgroundColor = .white
        self.layer.cornerRadius = 20
        titleLabel.do {
            $0.font = GSFont.h4
            $0.textColor = GSColor.grey10
            $0.text = "많이 찾는 서비스"
        }
    }

    private func setUI() {
        addSubview(titleLabel)
    }

    private func setAutoLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(14)
            $0.leading.equalToSuperview().inset(16)
        }
    }

}
