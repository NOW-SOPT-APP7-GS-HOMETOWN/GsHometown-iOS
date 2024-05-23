//
//  UserHistoryType.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/21/24.
//

import UIKit

enum UserRewardsType {
    case thePopRewards
    case gsPoint
    case couponBox
    
    var title: String {
        switch self {
        case .thePopRewards:
            "더팝리워즈"
        case .gsPoint:
            "GS&POINT"
        case .couponBox:
            "쿠폰함"
        }
    }
    
    var score: String {
        switch self {
        case .thePopRewards:
            "0점"
        case .gsPoint:
            "0P"
        case .couponBox:
            "3장"
        }
    }
}
