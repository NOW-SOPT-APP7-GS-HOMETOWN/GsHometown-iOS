//
//  HomeSectionType.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/13/24.
//

import UIKit

import Moya

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
            Advertisement.mockDataForSmall.count
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
            Advertisement.mockDataForLarge.count
        }
    }
}
