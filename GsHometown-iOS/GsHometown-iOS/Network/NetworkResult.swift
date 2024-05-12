//
//  NetworkResult.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/12/24.
//

import Foundation

enum NetworkResult<T> {
    case success(T)               // 서버 통신 성공했을 때,
    case requestErr               // 요청 에러 발생했을 때,
    case decodedErr               // 디코딩 오류 발생했을 때
    case pathErr                  // 경로 에러 발생했을 때,
    case serverErr                // 서버의 내부적 에러가 발생했을 때,
    case networkFail              // 네트워크 연결 실패했을 때

    func statusDescription() {
        switch self {
        case .success:
            print("is GOOOD")
        case .requestErr:
            print("요청 오류 입니다")
        case .decodedErr:
            print("디코딩 오류 입니다")
        case .pathErr:
            print("경로 오류 입니다")
        case .serverErr:
            print("서버 오류입니다")
        case .networkFail:
            print("네트워크 오류입니다")
        }
    }
}
