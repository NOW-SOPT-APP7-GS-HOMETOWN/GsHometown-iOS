//
//  Main.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/17/24.
//

import UIKit

import SnapKit

class MainView: UIView {
   
    private var menuCollectionViewDataSource = MenuCollectionView()
    
    override init(frame: CGRect) {
        self.menuCollectionView = menuCollectionViewDataSource.menuCollectionView
        
        super.init(frame: frame)
        setUI()
        setLayout()
        setMenuCollectionView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    private func setUI(){
        self.backgroundColor = GSColor.grey00
        self.addSubview(titleLabel)
        self.addSubview(segmentControl)
        self.addSubview(nearStoreView)
        self.addSubview(eventView)
        self.addSubview(menuCollectionView)
        self.addSubview(grayDivider)
    }
    
    private func setLayout(){
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(15)
            $0.leading.equalToSuperview().inset(17)
        }
        segmentControl.snp.makeConstraints{
            $0.height.equalTo(44)
            $0.horizontalEdges.equalToSuperview().inset(15)
            $0.top.equalToSuperview().inset(56)
        }
        nearStoreView.snp.makeConstraints{
            $0.height.equalTo(36)
            $0.horizontalEdges.equalToSuperview().inset(15)
            $0.top.equalToSuperview().inset(120)
        }
        eventView.snp.makeConstraints{
            $0.height.equalTo(151)
            $0.horizontalEdges.equalToSuperview().inset(15)
            $0.top.equalToSuperview().inset(176)
        }
        menuCollectionView.snp.makeConstraints{
            $0.height.equalTo(258)
            $0.horizontalEdges.equalToSuperview().inset(17.5)
            $0.top.equalToSuperview().inset(338)
        }
        grayDivider.snp.makeConstraints{
            $0.top.equalTo(menuCollectionView.snp.bottom).offset(5)
            $0.horizontalEdges.equalToSuperview()
        }
    }
    
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "우리동네편의점 사전예약"
        label.font = GSFont.h1
        label.textColor = GSColor.grey11
        return label
    }()
    
    private let segmentControl = CustomSegmentControl(items: ["매장수령", "택배상품"])
    private let nearStoreView = NearStoreView()
    private let eventView = EventReusableView() // 이 view 아님 -> 수정 필요
    
    private var menuCollectionView : UICollectionView
    private func setMenuCollectionView() {
        menuCollectionView.register(
            MenuCollectionViewCell.self,
            forCellWithReuseIdentifier: MenuCollectionViewCell.identifier
        )
        menuCollectionView.dataSource = menuCollectionViewDataSource
        menuCollectionView.delegate = menuCollectionViewDataSource
    }
    
    private var grayDivider = grayDivider(height: 7)
    

}
