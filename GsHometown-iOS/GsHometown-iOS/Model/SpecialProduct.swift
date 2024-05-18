//
//  SpecialProduct.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/18/24.
//

import UIKit

struct SpecialProduct {
    let productImg : UIImage?
    let productName : String
    let price : String
}

extension SpecialProduct {
    static let mockData : [SpecialProduct] = [
        SpecialProduct(productImg: GSImage.mockSpecialProduct, productName: "(예약)핑크푸냥이푸딩젤리(2입)", price: "5000원")
    ]
}

