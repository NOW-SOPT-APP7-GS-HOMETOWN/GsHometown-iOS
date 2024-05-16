//
//  PageType.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/13/24.
//

import Foundation

enum PageType {
    case small
    case large

    var height: CGFloat {
        switch self {
        case .small:
            return 86
        case .large:
            return 157
        }
    }
}
