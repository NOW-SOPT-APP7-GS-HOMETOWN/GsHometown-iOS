//
//  HomeSectionType.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/13/24.
//

import UIKit

enum HomeSectionType: Int, CaseIterable {
    case advertisementSmall
    case orderServices
    case convenienceServices
    case services
    case event
    case eventOfTheWeek
    case advertisementLarge

    var section: Int {
        return self.rawValue
    }

    func cellForItem(
        _ collectionView: UICollectionView,
        _ indexPath: IndexPath,
        currentEventImage: UIImage
    ) -> UICollectionViewCell {
        switch self {
        case .advertisementSmall:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PageCell.cellIdentifier,
                for: indexPath
            ) as? PageCell else {
                return UICollectionViewCell()
            }
            cell.posterImageView.image = GSImage.mockAdSmall
            return cell
        case .orderServices:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: OrderServiceCell.cellIdentifier,
                for: indexPath
            ) as? OrderServiceCell else {
                return UICollectionViewCell()
            }
            cell.bindData(type: indexPath.row == 0 ? .gs25 : .gsTheFresh)
            return cell
        case .convenienceServices:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ConvenienceCell.cellIdentifier,
                for: indexPath
            ) as? ConvenienceCell else {
                return UICollectionViewCell()
            }
            cell.bindData(type: ConvenienceType(rawValue: indexPath.row)!)
            return cell
        case .services:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ServiceCell.cellIdentifier,
                for: indexPath
            ) as? ServiceCell else {
                return UICollectionViewCell()
            }
            cell.bindData(type: ServiceType(rawValue: indexPath.row)!)
            return cell
        case .event:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: EventCell.cellIdentifier,
                for: indexPath
            ) as? EventCell else {
                return UICollectionViewCell()
            }
            cell.bindData(image: currentEventImage)
            return cell
        case .eventOfTheWeek:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: EventOfTheWeekCell.cellIdentifier,
                for: indexPath
            ) as? EventOfTheWeekCell else {
                return UICollectionViewCell()
            }
            return cell
        case .advertisementLarge:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PageCell.cellIdentifier,
                for: indexPath
            ) as? PageCell else {
                return UICollectionViewCell()
            }
            cell.posterImageView.image = GSImage.mockAdLarge
            return cell
        }
    }

    func createSection() -> NSCollectionLayoutSection {
        switch self {
        case .advertisementSmall:
            return UICollectionViewLayout.pageSection(type: .small)
        case .orderServices:
            return UICollectionViewLayout.orderServiceLayout()
        case .convenienceServices:
            return UICollectionViewLayout.convenienceLayout()
        case .services:
            return UICollectionViewLayout.servicesLayout()
        case .event:
            return UICollectionViewLayout.eventLayout()
        case .eventOfTheWeek:
            return UICollectionViewLayout.eventOfTheWeekLayout()
        case .advertisementLarge:
            return UICollectionViewLayout.pageSection(type: .large)
        }

    }

    var numberOfItems: Int {
        switch self {
        case .advertisementSmall:
            3
        case .orderServices:
            2
        case .convenienceServices:
            4
        case .services:
            ServiceType.allCases.count
        case .event:
            1
        case .eventOfTheWeek:
            1
        case .advertisementLarge:
            3
        }
    }
}
