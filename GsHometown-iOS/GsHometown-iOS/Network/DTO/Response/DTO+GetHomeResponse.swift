//
//  DTO+GetHomeResponse.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/21/24.
//

import Foundation

extension DTO {
    struct GetHomeResponse: Codable {
        let status: Int
        let data: HomeImage
    }
}

extension DTO.GetHomeResponse {
    struct HomeImage: Codable {
        let topBanners: [String]
        let monthlyEvents: Banner
        let bottomBanners: [String]
    }
}

extension DTO.GetHomeResponse.HomeImage {
    struct Banner: Codable {
        let mainBanners: [String]
        let subBanners: [String]
    }
}
