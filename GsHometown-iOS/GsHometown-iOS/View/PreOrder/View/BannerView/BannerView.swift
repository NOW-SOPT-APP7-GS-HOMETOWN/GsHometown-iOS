//
//  BannerView.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/22/24.
//

import UIKit

import SnapKit
import Then

class BannerView: UIView {

    private var collectionView: UICollectionView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        makeCollectionView()
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }

    private func setUI(){
        self.addSubview(collectionView!)
    }

    private func setLayout(){
        collectionView!.snp.makeConstraints {
            $0.verticalEdges.horizontalEdges.equalToSuperview()
        }
    }

    private func makeCollectionView() {
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.scrollDirection = .horizontal

        let layout = UICollectionViewCompositionalLayout { _, _ in
            return UICollectionViewLayout.pageSection(type: .large)
        }
        self.collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: layout
        )
        self.collectionView!.isScrollEnabled = false
        self.collectionView!.backgroundColor = GSColor.grey00
        self.collectionView!.showsVerticalScrollIndicator = false
        self.collectionView!.delegate = self
        self.collectionView!.dataSource = self
        registerCells()
        self.addSubview(collectionView!)
    }

    private func registerCells() {
        self.collectionView!.register(
            PageCell.self,
            forCellWithReuseIdentifier: PageCell.cellIdentifier
        )
    }

    private let grayDivider = grayDivider(height: 7)
}

extension BannerView: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 3
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: PageCell.cellIdentifier,
            for: indexPath
        ) as? PageCell else {
            return UICollectionViewCell()
        }
        cell.posterImageView.image = GSImage.mockPreorderAd
        return cell
    }
}
