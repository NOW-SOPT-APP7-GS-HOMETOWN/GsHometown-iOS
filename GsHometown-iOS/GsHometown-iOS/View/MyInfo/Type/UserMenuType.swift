//
//  UserMenuType.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/22/24.
//

import UIKit

enum UserMenuType {

    case orderInfo
    case purchaseInfo
    case discountInfo
    case myInfo
    case noticeInfo
    
    var title: String {
        switch self {
        case .orderInfo:
            "주문 정보"
        case .purchaseInfo:
            "결제 정보"
        case .discountInfo:
            "할인 정보"
        case .myInfo:
            "나의 정보"
        case .noticeInfo:
            "문의 및 공지"
        }
    }
    
    var menuArray: [String] {
        switch self {
        case .orderInfo:
            ["장바구니", "주문 내역", "나만의 냉장고 보관함", "모바일 영수증"]
        case .purchaseInfo:
            ["결제·적립·할인 설정", "현금영수증 번호 관리", "GS Pay 관리", "GS Prime 카드 신청", "모바일팝 가입하기"]
        case .discountInfo:
            ["통신사 할인"]
        case .myInfo:
            ["개인 정보 관리", "나의 와이너리", "이벤트 참여 내역", "우리동네GS 클럽 정보", "주소 관리", "리워즈 전환", "아동급식카드 관리"]
        case .noticeInfo:
            ["챗봇상담 문의", "자주 묻는 질문", "공지사항", "고객센터"]
        }
    }
    
}
