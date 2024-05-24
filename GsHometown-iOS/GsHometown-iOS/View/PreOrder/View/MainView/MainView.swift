//
//  Main.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/17/24.
//

import UIKit

import SnapKit

class MainView: UIView {
   
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "우리동네편의점 사전예약"
        label.font = GSFont.h1
        label.textColor = GSColor.grey11
        return label
    }()
    private var menuCollectionView = MenuCollectionView()
    private let segmentControl = CustomSegmentControl(items: ["매장수령", "택배상품"])
    private let nearStoreView = NearStoreView()
    var bannerView = BannerView()
    private var grayDivider = grayDivider(height: 7)
    private var gsNavigationBar = GSNavigationBar()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    private func setUI(){
        self.backgroundColor = GSColor.grey00
        [
            gsNavigationBar,
            titleLabel,
            segmentControl,
            nearStoreView,
            bannerView,
            menuCollectionView,
            grayDivider
        ].forEach { self.addSubview($0) }
    }
    
    private func setLayout(){
        gsNavigationBar.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(gsNavigationBar.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(17)
        }
        segmentControl.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(17)
            $0.height.equalTo(44)
            $0.horizontalEdges.equalToSuperview().inset(15)
        }
        nearStoreView.snp.makeConstraints{
            $0.top.equalTo(segmentControl.snp.bottom).offset(20)
            $0.height.equalTo(36)
            $0.horizontalEdges.equalToSuperview().inset(15)
        }
        bannerView.snp.makeConstraints{
            $0.height.equalTo(155)
            $0.horizontalEdges.equalToSuperview().inset(15)
            $0.top.equalTo(nearStoreView.snp.bottom).offset(20)
        }
        menuCollectionView.snp.makeConstraints{
            $0.height.equalTo(258)
            $0.horizontalEdges.equalToSuperview().inset(15)
            $0.top.equalTo(bannerView.snp.bottom).offset(7)
        }
        grayDivider.snp.makeConstraints{
            $0.top.equalTo(menuCollectionView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
        }
    }
}
