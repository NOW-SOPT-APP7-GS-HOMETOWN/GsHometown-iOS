//
//  AllProductView.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/18/24.
//

import UIKit

class AllProductView: UIView {
    private var allProductCollectionView: UICollectionView
    var allProductCollectionViewDataSource: AllProductCollectionView

    init(
        frame: CGRect,
        delegate: PreOrderCoordinatorDelegate
    ) {
        self.allProductCollectionViewDataSource = AllProductCollectionView(frame: CGRect(x: 0, y: 0, width: 100, height: 100), preOrderCoordinatorDelegate: delegate)
        self.allProductCollectionView = allProductCollectionViewDataSource.allProductCollectionView
        super.init(frame: frame)
        setUI()
        setLayout()
        setDiscountEventCollectionView()
        allProductCollectionView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }

    private func setUI(){
        self.backgroundColor = GSColor.grey00
        self.addSubview(allProductCollectionView)
        self.addSubview(grayDivider)
        allProductCollectionView.isScrollEnabled = false
    }

    private func setLayout(){
        allProductCollectionView.snp.makeConstraints{
            $0.top.equalToSuperview().offset(14)
            $0.height.equalTo(1500.5)
            $0.leading.trailing.equalToSuperview().inset(15)
        }
        grayDivider.snp.makeConstraints{
            $0.top.equalToSuperview().offset(745)
            $0.horizontalEdges.equalToSuperview()
        }
    }

    private func setDiscountEventCollectionView() {
        allProductCollectionView.register(
            AllProductCollectionViewCell.self,
            forCellWithReuseIdentifier: AllProductCollectionViewCell.identifier
        )
        allProductCollectionView.register(HeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderReusableView.identifier)
        allProductCollectionView.dataSource = allProductCollectionViewDataSource
        allProductCollectionView.delegate = allProductCollectionViewDataSource
    }

    private let grayDivider = grayDivider(height: 7)

}
