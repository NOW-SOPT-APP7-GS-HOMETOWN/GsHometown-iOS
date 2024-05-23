//
//  APITarget+Likes.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/21/24.
//

import Foundation

import Moya

extension APITarget {
    enum Likes {
        case postLike(DTO.PostLikeRequest)
        case deleteLike(DTO.DeleteLikeRequest)
    }
}

extension APITarget.Likes: TargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }
    
    var path: String {
        return "api/likes"
    }
    
    var method: Moya.Method {
        switch self {
        case .postLike:
            return .post
        case .deleteLike:
            return .delete
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .postLike(let postLikeRequest):
            return .requestParameters(
                parameters: ["productId": postLikeRequest.productId],
                encoding: JSONEncoding.default
            )
        case .deleteLike(let deleteLikeRequest):
            return .requestParameters(
                parameters: ["productId": deleteLikeRequest.productId],
                encoding: JSONEncoding.default
            )
        }
    }
    
    var headers: [String : String]? {
        return [
            "Content-Type": "application/json",
            "memberId": "1"
        ]
    }
}
