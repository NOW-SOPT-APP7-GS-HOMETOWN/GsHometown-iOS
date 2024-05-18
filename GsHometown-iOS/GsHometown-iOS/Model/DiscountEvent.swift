//
//  DiscountEvent.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/17/24.
//

import UIKit

struct DiscountEvent {
    let productImg : UIImage?
    let productName : String
    let cardDiscountPrice : String
    let price : String
    let originalPrice : String
}

extension DiscountEvent {
    static let mockData : [DiscountEvent] = [
        DiscountEvent(productImg: GSImage.mockDiscountProduct, productName: "예약)한돈구이용삼겹살(400G)", cardDiscountPrice: "8900원", price: "9900원", originalPrice: "12900원"),
        DiscountEvent(productImg: GSImage.mockDiscountProduct, productName: "예약)한돈구이용삼겹살(400G)", cardDiscountPrice: "8900원", price: "9900원", originalPrice: "12900원"),
        DiscountEvent(productImg: GSImage.mockDiscountProduct, productName: "예약)한돈구이용삼겹살(400G)", cardDiscountPrice: "8900원", price: "9900원", originalPrice: "12900원"),
        DiscountEvent(productImg: GSImage.mockDiscountProduct, productName: "예약)한돈구이용삼겹살(400G)", cardDiscountPrice: "8900원", price: "9900원", originalPrice: "12900원")
    ]
}
