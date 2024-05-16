//
//  ConvenienceCell.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/13/24.
//

import UIKit

import SnapKit
import Then

final class ConvenienceCell: UICollectionViewCell {

    private let convenienceButton = UIButton()

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
    }

    private func setUI() {
        self.addSubview(convenienceButton)
    }

    private func setAutoLayout() {
        convenienceButton.snp.makeConstraints {
            $0.verticalEdges.horizontalEdges.equalToSuperview()
        }
    }

    func bindData(type: ConvenienceType) {
        self.convenienceButton.setImage(
            type.buttonImage,
            for: .normal
        )
    }
}
