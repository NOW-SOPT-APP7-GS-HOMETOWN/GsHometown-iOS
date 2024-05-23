//
//  EventCell.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/13/24.
//

import UIKit

import Kingfisher

final class EventCell: UICollectionViewCell {

    let bannerImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setAutoLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUI() {
        self.addSubview(bannerImageView)
    }

    private func setAutoLayout() {
        bannerImageView.snp.makeConstraints {
            $0.verticalEdges.horizontalEdges.equalToSuperview()
        }
    }

    func bindData(image: String) {
        let image = URL(string: image)
        self.bannerImageView.kf.setImage(with: image)
    }
}
