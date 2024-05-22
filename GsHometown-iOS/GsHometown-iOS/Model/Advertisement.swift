//
//  Advertisement.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/13/24.
//

import UIKit

struct Advertisement {
    let id: Int
    let image: UIImage
    let pageNumber: Int
}

extension Advertisement {
    static let mockDataForSmall: [Advertisement] = [
        Advertisement(id: 0, image: GSImage.mockAdSmall!, pageNumber: 1),
        Advertisement(id: 1, image: GSImage.mockAdSmall!, pageNumber: 2),
        Advertisement(id: 2, image: GSImage.mockAdSmall!, pageNumber: 3),
        Advertisement(id: 3, image: GSImage.mockAdSmall!, pageNumber: 4),
        Advertisement(id: 4, image: GSImage.mockAdSmall!, pageNumber: 5),
        Advertisement(id: 5, image: GSImage.mockAdSmall!, pageNumber: 6)
    ]
    static let mockDataForLarge: [Advertisement] = [
        Advertisement(id: 0, image: GSImage.mockAdLarge!, pageNumber: 1),
        Advertisement(id: 1, image: GSImage.mockAdLarge!, pageNumber: 2),
        Advertisement(id: 2, image: GSImage.mockAdLarge!, pageNumber: 3),
        Advertisement(id: 3, image: GSImage.mockAdLarge!, pageNumber: 4),
        Advertisement(id: 4, image: GSImage.mockAdLarge!, pageNumber: 5),
        Advertisement(id: 5, image: GSImage.mockAdLarge!, pageNumber: 6)
    ]
}
