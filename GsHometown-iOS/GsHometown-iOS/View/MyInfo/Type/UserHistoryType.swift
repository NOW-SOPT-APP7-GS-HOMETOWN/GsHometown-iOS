//
//  UserHistoryType.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/21/24.
//

import UIKit

enum UserHistoryType {
    case recentProduct
    case likeProduct
    case myReview
    case giftBox
    
    var title: String {
        switch self {
        case .recentProduct:
            "최근본상품"
        case .likeProduct:
            "찜"
        case .myReview:
            "나의리뷰"
        case .giftBox:
            "선물함"
        }
    }
    
    var image: UIImage {
        switch self {
        case .recentProduct:
            GSImage.iconRecent!
        case .likeProduct:
            GSImage.iconLove!
        case .myReview:
            GSImage.iconWriting!
        case .giftBox:
            GSImage.iconGift!
        }
    }
}
