//
//  DTO+GetPreorderInfoResponse.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/21/24.
//

import Foundation

extension DTO {
    struct GetPreorderInfoResponse: Codable {
        let status: Int
        let data: PreorderInfo
    }
}

extension DTO.GetPreorderInfoResponse {
    struct PreorderInfo: Codable {
        let topBanners: [String]
        let headerTitle: String
        let date: String
        let products: [Products]
    }
}

extension DTO.GetPreorderInfoResponse.PreorderInfo {
    struct Products: Codable {
        let image: String
        let title: String
        let price: Int
        let originalPrice: Int
        let cardPrice: Int
        let isGsDiscount: Bool
        let starRating: Double
        let reviewCount: Int
    }
}
