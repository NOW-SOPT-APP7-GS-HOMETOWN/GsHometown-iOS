//
//  MenuCollectionViewCell.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/17/24.
//

import UIKit

import SnapKit

final class MenuCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MenuCollectionViewCell"
    
    private let menuButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        self.addSubview(menuButton)
    }
    
    func setLayout() {
        menuButton.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    func bindData(type: MenuType) {
        menuButton.setImage(type.image, for: .normal)
    }
}
