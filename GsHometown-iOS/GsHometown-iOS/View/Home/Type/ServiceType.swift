//
//  ServiceType.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/14/24.
//

import UIKit

enum ServiceType: Int, CaseIterable {
    case aroundStore
    case sale
    case onePlus
    case thefresh
    case coupon
    case giftCard
    case subscribe
    case lunchBox
    case event
    case attendence
    case gift
    case lifeAndCulture

    var image: UIImage {
        switch self {
        case .aroundStore:
            GSImage.aroundStore!
        case .sale:
            GSImage.sale!
        case .onePlus:
            GSImage.onePlus!
        case .thefresh:
            GSImage.thefresh!
        case .coupon:
            GSImage.coupon!
        case .giftCard:
            GSImage.giftCard!
        case .subscribe:
            GSImage.subscribe!
        case .lunchBox:
            GSImage.lunchBox!
        case .event:
            GSImage.event!
        case .attendence:
            GSImage.attendence!
        case .gift:
            GSImage.gift!
        case .lifeAndCulture:
            GSImage.lifeAndCulture!
        }
    }
}
