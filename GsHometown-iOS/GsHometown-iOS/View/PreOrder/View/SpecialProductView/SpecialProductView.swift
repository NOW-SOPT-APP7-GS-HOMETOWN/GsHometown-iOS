//
//  SpecialProductView.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/18/24.
//

import UIKit

class SpecialProductView: UIView {
    private let specialProductHeaderView = HeaderReusableView(title: "푸냥이 푸딩젤리 2탄! 복숭아맛🍑", date: "2024.04.23 ~ 2024.04.25")
    
    private var specialProductCollectionView : UICollectionView
    private var specialProductCollectionViewDataSource = SpecialProductCollectionView()

    override init(frame: CGRect) {
        self.specialProductCollectionView = specialProductCollectionViewDataSource.specialProductCollectionView
    
        super.init(frame: frame)
        setUI()
        setLayout()
        setDiscountEventCollectionView()
        specialProductCollectionView.reloadData()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    private func setUI(){
        self.backgroundColor = GSColor.grey00
        self.addSubview(specialProductHeaderView)
        self.addSubview(specialProductCollectionView)
        self.addSubview(grayDivider)
    }
    
    private func setLayout(){
        specialProductHeaderView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(27.5)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(49)
        }
        specialProductCollectionView.snp.makeConstraints{
            $0.top.equalTo(specialProductHeaderView.snp.bottom).offset(16)
            $0.height.equalTo(196)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview()
        }
        grayDivider.snp.makeConstraints{
            $0.top.equalTo(specialProductCollectionView.snp.bottom).offset(6.5)
            $0.horizontalEdges.equalToSuperview()
        }
    }
    
    private func setDiscountEventCollectionView() {
        specialProductCollectionView.register(
            SpecialProductCollectionViewCell.self,
            forCellWithReuseIdentifier: SpecialProductCollectionViewCell.identifier
        )
        specialProductCollectionView.dataSource = specialProductCollectionViewDataSource
        specialProductCollectionView.delegate = specialProductCollectionViewDataSource
    }
    
    private let grayDivider = grayDivider(height: 7)

}
