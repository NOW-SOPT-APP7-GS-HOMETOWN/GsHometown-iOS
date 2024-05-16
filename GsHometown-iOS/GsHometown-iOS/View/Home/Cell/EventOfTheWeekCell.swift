//
//  EventOfTheWeekCell.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/14/24.
//

import UIKit

final class EventOfTheWeekCell: UICollectionViewCell {

    private let titleLabel: UILabel = UILabel()
    private let subTitleLabel: UILabel = UILabel()

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
        self.backgroundColor = .white
        titleLabel.do {
            $0.text = "GS더프레시 행사전단"
            $0.font = GSFont.h4
            $0.textColor = GSColor.grey10
        }
        subTitleLabel.do {
            $0.text = "놓칠 수 없는 이번주 할인 행사"
            $0.font = GSFont.b3m
            $0.textColor = GSColor.grey08
        }
    }

    private func setUI() {
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)
    }

    private func setAutoLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(16)
        }
        subTitleLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(16)
        }
    }
}
