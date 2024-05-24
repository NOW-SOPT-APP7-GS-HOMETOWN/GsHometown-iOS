//
//  APITarget+Products.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/21/24.
//

import Foundation

import Moya

extension APITarget {
    enum Products {
        case getPreorderInfo(DTO.GetPreorderInfoRequest)
        case getDetailProduct(DTO.GetDetailProductRequest)
    }
}

extension APITarget.Products: TargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }

    var path: String {
        switch self {
        case .getPreorderInfo:
            return "api/products"
        case .getDetailProduct(let getDetailProductRequest):
            return "api/products/\(getDetailProductRequest.productId)"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Moya.Task {
        switch self {
        case .getPreorderInfo(let getPreorderInfoRequest):
            return .requestParameters(
                parameters: ["type": getPreorderInfoRequest.type],
                encoding: URLEncoding.default
            )
        case .getDetailProduct:
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        switch self {
        case .getPreorderInfo:
            return ["Content-Type": "application/json"]
        case .getDetailProduct:
            return [
                "Content-Type": "application/json",
                "memberId": "1"
            ]
        }
    }
}

