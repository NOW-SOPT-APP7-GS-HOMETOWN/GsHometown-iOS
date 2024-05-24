//
//  GSTabBarType.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/17/24.
//

import UIKit

enum GSTabBarType: CaseIterable {
    case home
    case search
    case payment
    case history
    case myInfo

    var active: UIImage {
        switch self {
        case .home:
            GSImage.homeActive!.withRenderingMode(.alwaysOriginal)
        case .search:
            GSImage.searchActive!.withRenderingMode(.alwaysOriginal)
        case .payment:
            GSImage.payInactive!.withRenderingMode(.alwaysOriginal)
        case .history:
            GSImage.orderHistoryActive!.withRenderingMode(.alwaysOriginal)
        case .myInfo:
            GSImage.myActive!.withRenderingMode(.alwaysOriginal)
        }
    }

    var inactive: UIImage {
        switch self {
        case .home:
            GSImage.homeInactive!.withRenderingMode(.alwaysOriginal)
        case .search:
            GSImage.searchInactive!.withRenderingMode(.alwaysOriginal)
        case .payment:
            GSImage.payActive!.withRenderingMode(.alwaysOriginal)
        case .history:
            GSImage.orderHistoryInactive!.withRenderingMode(.alwaysOriginal)
        case .myInfo:
            GSImage.myInactive!.withRenderingMode(.alwaysOriginal)
        }
    }

    var viewController: UIViewController {
        ViewController()
    }
}
