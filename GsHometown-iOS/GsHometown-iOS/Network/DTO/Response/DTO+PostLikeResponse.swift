//
//  DTO+PostLikeResponse.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/21/24.
//

import Foundation

extension DTO {
    struct PostLikeResponse: Codable {
        let status: Int
        let data: Like
    }
}

extension DTO.PostLikeResponse {
    struct Like: Codable {
        let isLiked: Bool
    }
}
