//
//  EventView.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/17/24.
//

import UIKit

class EventView: UIView {
    var discountEventHeaderView = HeaderReusableView()
    
    var discountEventCollectionView : UICollectionView
    var discountEventCollectionViewDataSource = DiscountEventCollectionView()

    override init(frame: CGRect) {
        self.discountEventCollectionView = discountEventCollectionViewDataSource.discountEventCollectionView
    
        super.init(frame: frame)
        setUI()
        setLayout()
        setDiscountEventCollectionView()
        discountEventCollectionView.reloadData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    private func setUI(){
        self.backgroundColor = GSColor.grey00
        self.addSubview(discountEventHeaderView)
        self.addSubview(discountEventCollectionView)
        self.addSubview(grayDivider)
    }
    
    private func setLayout(){
        discountEventHeaderView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(21)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }
        discountEventCollectionView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(84)
            $0.height.equalTo(257)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview() // 이거 안 쓰면 collectionView 안 뜬다...!
        }
        grayDivider.snp.makeConstraints{
            $0.top.equalTo(discountEventCollectionView.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
        }
    }
    
    private func setDiscountEventCollectionView() {
        discountEventCollectionView.register(
            DiscountEventCollectionViewCell.self,
            forCellWithReuseIdentifier: DiscountEventCollectionViewCell.identifier
        )
        discountEventCollectionView.dataSource = discountEventCollectionViewDataSource
        discountEventCollectionView.delegate = discountEventCollectionViewDataSource
    }
    
    private let grayDivider = grayDivider(height: 7)
}
