//
//  ConvenienceType.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/14/24.
//

import UIKit

enum ConvenienceType: Int {
    case refrigerator
    case findProduct
    case bookDelivery
    case wine25

    var buttonImage: UIImage {
        switch self {
        case .refrigerator:
            GSImage.myRefrigerator!
        case .findProduct:
            GSImage.findProduct!
        case .bookDelivery:
            GSImage.bookPackage!
        case .wine25:
            GSImage.wine!
        }
    }
}
