//
//  SpecialProductCollectionViewCell.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/18/24.
//

import UIKit

import SnapKit

final class SpecialProductCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SpecialProductCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        [productImageView, pickupImageView, shoppingCartImageView, productNameLabel, priceLabel].forEach{
            self.addSubview($0)
        }
    }
    
    func setLayout() {
        productImageView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(111)
            $0.width.equalTo(110)
        }
        pickupImageView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(118)
            $0.leading.equalToSuperview()
        }
        shoppingCartImageView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(120)
            $0.trailing.equalToSuperview().inset(5)
            $0.width.height.equalTo(14)
        }
        productNameLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(143)
            $0.leading.equalToSuperview()
            $0.width.equalTo(110)
        }
        priceLabel.snp.makeConstraints{
            $0.top.equalTo(productNameLabel.snp.top).inset(33)
            $0.leading.equalToSuperview()
            $0.height.equalTo(20)
        }
    }
    
    func bindData(_ specialProductData : Product) {
        productImageView.image = specialProductData.productImg
        productNameLabel.text = specialProductData.productName
        priceLabel.text = specialProductData.price
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
    
    private lazy var priceLabel : UILabel = {
        let label = UILabel()
        label.textColor = GSColor.grey10
        label.font = GSFont.b3m
        return label
    }()
    
}
