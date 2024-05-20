//
//  DTO+GetDetailProductResponse.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/21/24.
//

import Foundation

extension DTO {
    struct GetDetailProductResponse: Codable {
        let thumbnail: String
        let title: String
        let isLiked: Bool
        let price: Int
        let isReceiveAvailable: Bool
        let starRating: Double
        let reviewCount: Int
        let detailImage: String
    }
}
