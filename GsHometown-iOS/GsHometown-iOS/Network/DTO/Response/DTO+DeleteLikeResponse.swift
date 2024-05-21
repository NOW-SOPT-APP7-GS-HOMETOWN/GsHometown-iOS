//
//  DTO+DeleteLikeResponse.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/21/24.
//

import Foundation

extension DTO {
    struct DeleteLikeResponse: Codable {
        let status: Int
        let data: Like
    }
}

extension DTO.DeleteLikeResponse {
    struct Like: Codable {
        let isLiked: Bool
    }
}
