//
//  APIProvider.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/21/24.
//

import Foundation

import Moya

final class APIProvider<T: TargetType>: MoyaProvider<T> {
    init() {
        let plugin: [PluginType] = [GsPlugin()]
        super.init(plugins: plugin)
    }

    func request<U: Codable>(
        _ object: U.Type,
        target: T,
        completion: @escaping (NetworkResult<U>) -> ()
    ) {
        request(target) { [weak self] result in
            guard let self = self else {
                completion(.networkFail)
                return
            }
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult = self.judgeStatus(statusCode,
                                                     data,
                                                     object.self)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }

    func judgeStatus<U: Codable>(
        _ statusCode: Int,
        _ data: Data,
        _ object: U.Type
    ) -> NetworkResult<U> {
        switch statusCode {
        case 200..<205:
            return isVaildData(data, object)
        case 400..<500:
            return .requestErr
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }

    private func isVaildData<U: Codable>(
        _ data: Data,
        _ object: U.Type
    ) -> NetworkResult<U> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(
            U.self,
            from: data
        ) else {
            print("⛔️ \(self)애서 디코딩 오류가 발생했습니다 ⛔️")
            return .pathErr
        }
        return .success(decodedData)
    }
}
