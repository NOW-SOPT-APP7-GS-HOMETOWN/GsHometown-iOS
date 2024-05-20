//
//  SpecialProduct.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/18/24.
//

import UIKit

struct Product {
    let productImg : UIImage?
    let productName : String
    let price : String
}

extension Product {
    static let specialProductMockData : [Product] = [
        Product(productImg: GSImage.mockSpecialProduct, productName: "(예약)핑크푸냥이푸딩젤리(2입)", price: "5000원")
    ]
    
    static let sideDishProductMockData : [Product] = [
        Product(productImg: GSImage.mockSideDishProduct, productName: "NEW이거닭강정(오리지널)", price: "5,200원"),
        Product(productImg: GSImage.mockSideDishProduct, productName: "NEW이거닭강정(오리지널)", price: "5,200원"),
        Product(productImg: GSImage.mockSideDishProduct, productName: "NEW이거닭강정(오리지널)", price: "5,200원"),
        Product(productImg: GSImage.mockSideDishProduct, productName: "NEW이거닭강정(오리지널)", price: "5,200원")
    ]
    
    static let convenientProductMockData : [Product] = [
        Product(productImg: GSImage.mockConvenientProduct, productName: "핫매콤야끼우동313G", price: "3,900원"),
        Product(productImg: GSImage.mockConvenientProduct, productName: "핫매콤야끼우동313G", price: "3,900원"),
        Product(productImg: GSImage.mockConvenientProduct, productName: "핫매콤야끼우동313G", price: "3,900원"),
        Product(productImg: GSImage.mockConvenientProduct, productName: "핫매콤야끼우동313G", price: "3,900원")
    ]
}

