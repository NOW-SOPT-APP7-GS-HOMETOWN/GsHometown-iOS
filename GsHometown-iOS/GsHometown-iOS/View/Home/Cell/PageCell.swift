//
//  PageCell.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/13/24.
//

import UIKit

import SnapKit
import Then

final class PageCell: UICollectionViewCell {

    let posterImageView: UIImageView = UIImageView()
    private let pageLabel: UILabel = UILabel()

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
        pageLabel.do {
            $0.font = GSFont.b5m
            $0.textColor = GSColor.grey00
            $0.backgroundColor = GSColor.grey12
        }
    }

    private func setUI() {
        self.addSubview(posterImageView)
        self.addSubview(pageLabel)
    }

    private func setAutoLayout() {
        posterImageView.snp.makeConstraints {
            $0.verticalEdges.horizontalEdges.equalToSuperview()
        }

        pageLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(12)
            $0.bottom.equalToSuperview().inset(12)
        }
    }
}
