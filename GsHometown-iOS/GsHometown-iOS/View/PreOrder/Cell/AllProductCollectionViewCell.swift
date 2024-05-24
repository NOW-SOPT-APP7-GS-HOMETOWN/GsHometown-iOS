//
//  AllProductCollectionViewCell.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/18/24.
//

import UIKit

import SnapKit
import Kingfisher

final class AllProductCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "AllProductCollectionViewCell"
    
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
            $0.height.width.equalTo(165)
        }
        pickupImageView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(173)
            $0.leading.equalToSuperview()
            $0.width.equalTo(52)
            $0.height.equalTo(20)
        }
        shoppingCartImageView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(173)
            $0.trailing.equalToSuperview().inset(18)
            $0.width.height.equalTo(20)
        }
        productNameLabel.snp.makeConstraints{
            $0.top.equalTo(productImageView.snp.bottom).offset(34)
            $0.leading.equalToSuperview()
            $0.height.equalTo(14)
        }
        priceLabel.snp.makeConstraints{
            $0.top.equalTo(productNameLabel.snp.top).offset(18)
            $0.leading.equalToSuperview()
            $0.height.equalTo(17)
        }
    }
    
    func bindData(_ product : Product) {
        productImageView.kf.setImage(with: URL(string: product.productImg))
        productNameLabel.text = product.productName
        priceLabel.text = String(product.price) + "원"
    }
    
    private lazy var productImageView : UIImageView  = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 13
        imageView.clipsToBounds = true
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
        label.font = GSFont.b2s
        return label
    }()
    
}
