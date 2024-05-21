//
//  DTO+DeleteLikeRequest.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/21/24.
//

import Foundation

extension DTO {
    struct DeleteLikeRequest: Codable {
        let memberId: Int
        let productId: Int
    }
}
