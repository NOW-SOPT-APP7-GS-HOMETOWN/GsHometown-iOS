//
//  APITarget+All.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/21/24.
//

import Foundation

import Moya

extension APITarget {
    enum All {
        case getHome
    }
}

extension APITarget.All: TargetType {
    var baseURL: URL {
        return URL(string: Config.baseURL)!
    }

    var path: String {
        "/api"
    }

    var method: Moya.Method {
        .get
    }

    var task: Moya.Task {
        .requestPlain
    }

    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}
