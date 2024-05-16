//
//  OrderServiceType.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/14/24.
//

import UIKit

enum OrderServiceType {
    case gs25
    case gsTheFresh

    var title: String {
        switch self {
        case .gs25:
            "GS25"
        case .gsTheFresh:
            "GS더프레시"
        }
    }

    var subtitle: String {
        switch self {
        case .gs25:
            "언제나 가까이"
        case .gsTheFresh:
            "신선함이 가득"
        }
    }

    var backgroundColor: UIColor {
        switch self {
        case .gs25:
            return GSColor.blue02
        case .gsTheFresh:
            return GSColor.green01
        }
    }

    var pickUpImage: UIImage? {
        switch self {
        case .gs25:
            return GSImage.pickUpBlue
        case .gsTheFresh:
            return GSImage.pickUpGreen
        }
    }

    var deliveryImage: UIImage? {
        switch self {
        case .gs25:
            return GSImage.deliveryBlue
        case .gsTheFresh:
            return GSImage.deliveryGreen
        }
    }

    var preOrderImage: UIImage? {
        switch self {
        case .gs25:
            return GSImage.preOrder
        case .gsTheFresh:
            return GSImage.martPreOrder
        }
    }
}
