//
//  NearStoreView.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/17/24.
//

import UIKit

import SnapKit

final class NearStoreView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = GSColor.navy01
        self.layer.cornerRadius = 18
        self.clipsToBounds = true
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    private func setUI() {
        self.addSubview(pickUpZoneImageView)
        self.addSubview(pickUpZoneLabel)
        self.addSubview(showMoreImageView)
    }
    
    private func setLayout() {
        pickUpZoneImageView.snp.makeConstraints{
            $0.width.equalTo(58)
            $0.height.equalTo(22)
            $0.verticalEdges.equalToSuperview().inset(7)
            $0.leading.equalToSuperview().inset(8)
        }
        pickUpZoneLabel.snp.makeConstraints{
            $0.verticalEdges.equalToSuperview().inset(11)
            $0.leading.equalToSuperview().inset(74)
        }
        showMoreImageView.snp.makeConstraints{
            $0.verticalEdges.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(25)
        }
    }
    
    let pickUpZoneImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = GSImage.pickUpZone
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let pickUpZoneLabel : UILabel = {
        let label = UILabel()
        label.text = "GS25 당산진미점 · 6.5km"
        label.font = GSFont.b4m
        label.textColor = GSColor.grey00
        return label
    }()
    
    let showMoreImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = GSImage.arrowRight
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
}
