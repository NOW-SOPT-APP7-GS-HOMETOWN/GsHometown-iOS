//
//  AllProductCollectionView.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/18/24.
//

import UIKit

class AllProductCollectionView: UIView, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var preOrderCoordinatorDelegate: PreOrderCoordinatorDelegate
    var productData : [[Product]] = []
    var headerTitle : [String] = []

    init(
        frame: CGRect,
        preOrderCoordinatorDelegate: PreOrderCoordinatorDelegate
    ) {
        self.preOrderCoordinatorDelegate = preOrderCoordinatorDelegate
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    lazy var allProductCollectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productData[section].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AllProductCollectionViewCell.identifier, for: indexPath) as? AllProductCollectionViewCell else { return UICollectionViewCell() }
        cell.bindData(productData[indexPath.section][indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 165, height: 236)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 104
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 14
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 24, left: 0, bottom: 131, right: 0)
    }



    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader, let header =  collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderReusableView.identifier, for: indexPath) as? HeaderReusableView else {return UICollectionReusableView()}
        header.configure(with: headerTitle[indexPath.section], date: nil)
        return header
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let width = UIScreen.main.bounds.width - 30
        return CGSize(width: width, height: 21)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        self.preOrderCoordinatorDelegate.goToDetailView()
    }
}
