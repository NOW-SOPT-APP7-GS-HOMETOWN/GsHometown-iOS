//
//  EventHeaderView.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/18/24.
//

import UIKit

class HeaderReusableView: UIView {

    init(title : String, date : String) {
        super.init(frame: .zero)
        setUI()
        setLayout()
        headerTitleLabel.text = title
        dateLabel.text = date
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    private func setUI() {
        [headerTitleLabel, showMoreView, dateLabel].forEach {
            self.addSubview($0)
        }
        showMoreView.addSubview(showMoreLabel)
        showMoreView.addSubview(showMoreImageView)
    }
    
    private func setLayout() {
        headerTitleLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(262)
            $0.height.equalTo(19)
        }
        showMoreView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(3)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(47)
            $0.height.equalTo(13)
        }
        dateLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(34)
            $0.leading.equalToSuperview()
            $0.height.equalTo(14)
        }
        showMoreLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(0.5)
            $0.leading.equalToSuperview()
            $0.width.equalTo(32)
            $0.height.equalTo(12)
        }
        showMoreImageView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(0.5)
            $0.trailing.equalToSuperview()
            $0.width.equalTo(12)
            $0.height.equalTo(12)
        }
    }
    
    private let headerTitleLabel : UILabel = {
        let label = UILabel()
        label.textColor = GSColor.grey10
        label.font = GSFont.b1
        return label
    }()
    
    private let showMoreView : UIView = {
        let view = UIView()
        return view
    }()
    
    private let showMoreLabel : UILabel = {
        let label = UILabel()
        label.text = "더보기"
        label.font = GSFont.b4m
        label.textColor = GSColor.grey09
        return label
    }()
    
    private let showMoreImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = GSImage.arrowRight
        return imageView
    }()
    
    private let dateLabel : UILabel = {
        let label = UILabel()
        label.textColor = GSColor.grey08
        label.font = GSFont.b4m
        return label
    }()
    

}
