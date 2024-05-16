//
//  UICollectionViewLayout+.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/13/24.
//

import UIKit

import UIKit

extension UICollectionViewLayout {
    static func pageSection(type: PageType) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(type.height)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 3,
            leading: 0,
            bottom: 10,
            trailing: 0
        )
        return section
    }

    static func orderServiceLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupHeight: CGFloat = 180
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(groupHeight)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.interItemSpacing = .fixed(9)

        let section = NSCollectionLayoutSection(group: group)

        return section
    }

    static func convenienceLayout() -> NSCollectionLayoutSection {
        let smallSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1)
        )
        let smallItem = NSCollectionLayoutItem(layoutSize: smallSize)

        let middleSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.5)
        )
        let middleItem = NSCollectionLayoutItem(layoutSize: middleSize)

        let largeSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0)
        )
        let largeItem = NSCollectionLayoutItem(layoutSize: largeSize)

        let horizentalGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.5)
        )
        let horizentalGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: horizentalGroupSize,
            subitems: [smallItem, smallItem]
        )

        let verticalGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1)
        )
        let verticalGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: verticalGroupSize,
            subitems: [horizentalGroup, middleItem]
        )

        let groupHeight: CGFloat = 181
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(groupHeight)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [largeItem, verticalGroup]
        )

        let section = NSCollectionLayoutSection(group: group)

        return section
    }

    static func servicesLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .absolute(75),
            heightDimension: .absolute(75)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupHeight: CGFloat = 245 / 3
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(groupHeight)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )

        group.interItemSpacing = .fixed(5)

        let edge = (UIScreen.main.bounds.width - 313 - 32) / 2

        group.edgeSpacing = NSCollectionLayoutEdgeSpacing(
            leading: .fixed(edge),
            top: .none,
            trailing: .fixed(edge),
            bottom: .none)

        let section = NSCollectionLayoutSection(group: group)
        return section
    }

    static func eventLayout() -> NSCollectionLayoutSection {

        let largeSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let largeItem = NSCollectionLayoutItem(layoutSize: largeSize)

        let groupHeight: CGFloat = 270
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.65),
            heightDimension: .fractionalHeight(0.3)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [largeItem]
        )

        let section = NSCollectionLayoutSection(group: group)

        section.orthogonalScrollingBehavior = .none
        section.contentInsets = .init(
            top: 71,
            leading: 16,
            bottom: 14,
            trailing: 0
        )
        let backgroundItem = NSCollectionLayoutDecorationItem.background(elementKind: EventReusableView.identifier)
        section.decorationItems = [backgroundItem]

        return section
    }

    static func eventOfTheWeekLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(71)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(
            top: 10,
            leading: 0,
            bottom: 10,
            trailing: 0
        )
        return section
    }
}
