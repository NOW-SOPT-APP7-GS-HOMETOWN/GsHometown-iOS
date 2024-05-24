//
//  EventCollectionViewCell.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/17/24.
//

import UIKit

import SnapKit
import Kingfisher

final class DiscountEventCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DiscountEventCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        [productImageView, pickupImageView, shoppingCartImageView, productNameLabel, cardDiscountLabel, cardDiscountPriceLabel, priceLabel, originalPriceLabel, gspayDiscountImageView].forEach{
            self.addSubview($0)
        }
    }
    
    func setLayout() {
        productImageView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(116)
        }
        pickupImageView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(123)
            $0.leading.equalToSuperview()
        }
        shoppingCartImageView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(125)
            $0.trailing.equalToSuperview().inset(5)
            $0.width.height.equalTo(14)
        }
        productNameLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(150)
            $0.leading.equalToSuperview().inset(1)
            $0.width.equalTo(103)
        }
        cardDiscountLabel.snp.makeConstraints{
            $0.top.equalTo(productNameLabel.snp.top).inset(34)
            $0.leading.equalToSuperview()
            $0.width.equalTo(52)
            $0.height.equalTo(14)
        }
        cardDiscountPriceLabel.snp.makeConstraints{
            $0.top.equalTo(cardDiscountLabel.snp.top).inset(16)
            $0.leading.equalToSuperview()
            $0.height.equalTo(14)
        }
        priceLabel.snp.makeConstraints{
            $0.top.equalTo(cardDiscountPriceLabel.snp.bottom)
            $0.leading.equalToSuperview()
            $0.height.equalTo(20)
        }
        originalPriceLabel.snp.makeConstraints{
            $0.top.equalTo(priceLabel.snp.top).inset(4)
            $0.leading.equalTo(priceLabel.snp.trailing).offset(2)
            $0.height.equalTo(12)
        }
        gspayDiscountImageView.snp.makeConstraints{
            $0.top.equalTo(productNameLabel.snp.top).inset(90)
            $0.leading.equalToSuperview()
            $0.width.equalTo(64)
            $0.height.equalTo(17)
        }
    }
    
    func bindData(_ discountEventData : DiscountEvent) {
        productImageView.kf.setImage(with: URL(string: discountEventData.image))
        productNameLabel.text = discountEventData.title
        cardDiscountPriceLabel.text = String(discountEventData.cardPrice) + "원"
        priceLabel.text = String(discountEventData.price) + "원"
        originalPriceLabel.strikethrough(from: String(discountEventData.originalPrice)+"점", at: String(discountEventData.originalPrice)+"점")
    }
    
    private lazy var productImageView : UIImageView  = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 8
        return imageView
    }()
    
    private let pickupImageView : UIImageView  = {
        let imageView = UIImageView()
        imageView.image = GSImage.zonePickUpSmall
        return imageView
    }()
    
    private let shoppingCartImageView : UIImageView  = {
        let imageView = UIImageView()
        imageView.image = GSImage.iconSb
        return imageView
    }()
    
    private lazy var productNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = GSColor.grey09
        label.font = GSFont.b4m
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        return label
    }()
    
    private let cardDiscountLabel : UILabel = {
        let label = UILabel()
        label.textColor = GSColor.red01
        label.font = GSFont.b4m
        label.text = "카드할인가"
        return label
    }()
    
    private lazy var cardDiscountPriceLabel : UILabel = {
        let label = UILabel()
        label.textColor = GSColor.red01
        label.font = GSFont.b4m
        return label
    }()
    
    private lazy var priceLabel : UILabel = {
        let label = UILabel()
        label.textColor = GSColor.grey10
        label.font = GSFont.b3m
        return label
    }()
    
    private lazy var originalPriceLabel : UILabel = {
        let label = UILabel()
        label.textColor = GSColor.grey06
        label.font = GSFont.d1s
        return label
    }()
    
    private let gspayDiscountImageView : UIImageView  = {
        let imageView = UIImageView()
        imageView.image = GSImage.gspayDiscount
        return imageView
    }()
    
}
