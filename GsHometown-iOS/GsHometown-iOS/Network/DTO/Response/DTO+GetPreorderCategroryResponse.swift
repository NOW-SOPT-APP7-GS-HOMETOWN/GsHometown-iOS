//
//  DTO+GetPreorderCategroryResponse.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/24/24.
//

import Foundation

extension DTO {
    struct GetPreorderCategoryResponse: Codable {
        let status: Int
        let data: PreorderCategory
    }
}

extension DTO.GetPreorderCategoryResponse {
    struct PreorderCategory: Codable {
        let category: String
        let products: [Products]
    }
}

extension DTO.GetPreorderCategoryResponse.PreorderCategory {
    struct Products: Codable {
        let productId: String
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

