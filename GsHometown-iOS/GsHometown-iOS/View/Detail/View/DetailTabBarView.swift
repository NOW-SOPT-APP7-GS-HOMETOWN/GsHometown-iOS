//
//  DetailTabBarView.swift
//  GsHometown-iOS
//
//  Created by 오연서 on 5/20/24.
//

import UIKit

import SnapKit
import Then

class DetailTabBarView: UIView {
    
    private let giftButton = UIButton().then {
        $0.setImage(GSImage.iconGift, for: .normal)
    }
    
    private let addCartButton = UIButton().then {
        $0.setTitle("장바구니 담기", for: .normal)
        $0.setTitleColor(GSColor.grey10, for: .normal)
        $0.titleLabel?.font = GSFont.b2s
        $0.backgroundColor = GSColor.grey05
        $0.layer.cornerRadius = 24
    }
    
    private let bookButton = UIButton().then {
        $0.setTitle("예약 주문하기", for: .normal)
        $0.titleLabel?.font = GSFont.b2s
        $0.backgroundColor = GSColor.grey10
        $0.layer.cornerRadius = 24
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupHierarchy()
        setupLayout()
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension DetailTabBarView {
    
    func setupStyle() {
        self.backgroundColor = .white
    }
    
    func setupHierarchy() {
        addSubview(giftButton)
        addSubview(addCartButton)
        addSubview(bookButton)
    }
    
    func setupLayout() {
        giftButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(17)
            $0.size.equalTo(20)
        }
        
        addCartButton.snp.makeConstraints{
            $0.centerY.equalTo(giftButton)
            $0.leading.equalTo(giftButton.snp.trailing).offset(30)
            $0.height.equalTo(44)
            $0.width.equalTo(150)
        }
        
        bookButton.snp.makeConstraints{
            $0.centerY.equalTo(giftButton)
            $0.leading.equalTo(addCartButton.snp.trailing).offset(5)
            $0.height.equalTo(44)
            $0.width.equalTo(150)
        }
    }
}
