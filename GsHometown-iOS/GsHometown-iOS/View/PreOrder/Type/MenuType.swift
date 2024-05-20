//
//  MenuType.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/17/24.
//

import UIKit

enum MenuType: Int, CaseIterable {
    case convenienceResturant
    case mealBox
    case dosirock
    case bread
    case easyFood
    case salad
    case bookAlcohol
    case freshFood
    case kimbob
    case sideDish
    case sandwich

    var image: UIImage {
        switch self {
        case .convenienceResturant:
            GSImage.convenienceResturant!
        case .mealBox:
            GSImage.mealBox!
        case .dosirock:
            GSImage.dosirock!
        case .bread:
            GSImage.bread!
        case .easyFood:
            GSImage.easyFood!
        case .salad:
            GSImage.salad!
        case .bookAlcohol:
            GSImage.bookAlcohol!
        case .freshFood:
            GSImage.freshFood!
        case .kimbob:
            GSImage.kimbob!
        case .sideDish:
            GSImage.sideDish!
        case .sandwich:
            GSImage.sandwich!
        }
    }
}
