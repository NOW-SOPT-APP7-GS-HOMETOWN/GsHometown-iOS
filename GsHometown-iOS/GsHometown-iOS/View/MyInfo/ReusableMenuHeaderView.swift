//
//  ReusableMenuHeaderView.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/22/24.
//

import UIKit

import SnapKit
import Then

class ReusableMenuHeaderView: UIView {

    private let thinGrayDivider : UIView = UIView()
    private lazy var menuTitleLabel : UILabel = UILabel()
    private let topArrowButton : UIButton = UIButton()
    
    init(title: String) {
        super.init(frame: .zero)
        menuTitleLabel.text = title
        setUI()
        setLayout()
        setStyle()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [thinGrayDivider, menuTitleLabel, topArrowButton].forEach {
            self.addSubview($0)
        }
    }
    
    private func setLayout() {
        thinGrayDivider.snp.makeConstraints{
            $0.top.leading.equalToSuperview()
            $0.height.equalTo(1)
            $0.width.equalTo(345)
        }
        menuTitleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(20.5)
            $0.leading.equalToSuperview()
            $0.height.equalTo(21)
        }
        topArrowButton.snp.makeConstraints{
            $0.top.equalToSuperview().inset(25)
            $0.trailing.equalTo(thinGrayDivider.snp.trailing)
            $0.width.height.equalTo(12)
        }
    }
    
    private func setStyle(){
        thinGrayDivider.backgroundColor = GSColor.grey05
        
        menuTitleLabel.font = GSFont.h4
        menuTitleLabel.textColor = GSColor.grey10
        
        topArrowButton.setImage(GSImage.arrowTop, for: .normal)
    }
}
