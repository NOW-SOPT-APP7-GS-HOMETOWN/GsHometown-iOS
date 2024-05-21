//
//  UserInfoView.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/21/24.
//

import UIKit

import SnapKit
import Then

class UserInfoView: UIView {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setStyle()
    }
    
    private func setUI() {
        self.backgroundColor = GSColor.grey00
        [welcomeLabel, userNameButton, noticeGradeButton].forEach{
            userInfoView.addSubview($0)
        }
        [userInfoView, integratedMemeberButton, rewardStackView, historyStackView].forEach{
            self.addSubview($0)
        }
    }
    
    private func setLayout() {
        welcomeLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(2)
            $0.leading.equalToSuperview()
            $0.height.equalTo(20)
        }
        userNameButton.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(115)
            $0.height.equalTo(20)
        }
        noticeGradeButton.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(24)
            $0.width.equalTo(69)
        }
        
        userInfoView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(15)
        }
        integratedMemeberButton.snp.makeConstraints{
            $0.top.equalToSuperview().inset(46)
            $0.horizontalEdges.equalToSuperview().inset(15)
            $0.height.equalTo(54)
        }
        rewardStackView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(120)
            $0.horizontalEdges.equalToSuperview().inset(15)
            $0.height.equalTo(69)
        }
        historyStackView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(212)
            $0.horizontalEdges.equalToSuperview().inset(15)
            $0.height.equalTo(52)
        }
    }
    
    private let userInfoView = UIView()
    
    private let welcomeLabel = UILabel().then{
        $0.text = "WELCOME"
        $0.textColor = GSColor.blue03
        $0.font = GSFont.h2
    }
    
    private lazy var userNameButton = UIButton().then{
        $0.setTitle("이솝트님", for: .normal)
        $0.setTitleColor(GSColor.grey10, for: .normal)
        $0.titleLabel?.font = GSFont.h2
        $0.setImage(GSImage.arrowRight, for: .normal)
        $0.semanticContentAttribute = .forceRightToLeft
        $0.imageEdgeInsets = UIEdgeInsets(top: 4, left: 8, bottom: 4, right: 0)
    }
    
    private lazy var noticeGradeButton = UIButton().then{
        $0.setImage(GSImage.noticeGrade, for: .normal)
    }
    
    private lazy var integratedMemeberButton = UIButton().then{
        $0.layer.cornerRadius = 11
        $0.layer.borderWidth = 1
        $0.layer.borderColor = GSColor.grey05.cgColor
        $0.setTitle("통합 회원으로 전환하고 추가 혜택받기", for: .normal)
        $0.setTitleColor(GSColor.grey10, for: .normal)
        $0.titleLabel?.font = GSFont.b2s
        $0.setImage(GSImage.arrowRight, for: .normal)
        $0.semanticContentAttribute = .forceRightToLeft
    }
    
    private let rewardStackView = UIStackView().then{
        $0.backgroundColor = GSColor.grey02
        $0.layer.cornerRadius = 16
        $0.isLayoutMarginsRelativeArrangement = true
        $0.axis = .horizontal
        $0.layoutMargins.top = 13
        $0.layoutMargins.left = 31
        $0.layoutMargins.right = -31
        $0.distribution = .fillEqually
    }
    
    private func makeRewardStackLabelView(for reward : UserRewardsType) -> UIView{
        let view = UIView()
        let nameLabel = makeRewardStackLabel(text: reward.title, textColor: GSColor.grey08, font: GSFont.b4s!)
        let scoreLabel = makeRewardStackLabel(text: reward.score, textColor: GSColor.grey10, font: GSFont.b3b!)
        view.addSubview(nameLabel)
        view.addSubview(scoreLabel)
        nameLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(3)
            $0.leading.equalToSuperview()
            $0.height.equalTo(14)
        }
        scoreLabel.snp.makeConstraints{
            $0.top.equalToSuperview().inset(16)
            $0.leading.equalToSuperview()
            $0.height.equalTo(20)
        }
        return view
    }
    
    private func makeRewardStackLabel(text: String, textColor: UIColor, font: UIFont) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = font
        return label
    }
    
    private lazy var historyStackView = UIStackView().then{
        $0.isLayoutMarginsRelativeArrangement = true
        $0.axis = .horizontal
        $0.layoutMargins.left = 32.5
        $0.layoutMargins.right = 32.5
        $0.distribution = .fillEqually
    }

    private func makeHistoryStackButton(for history : UserHistoryType) -> UIButton{
        let button = UIButton()
        button.setTitle(history.title, for: .normal)
        button.setImage(history.image, for: .normal)
        button.setTitleColor(GSColor.grey08, for: .normal)
        if let titleLabel = button.titleLabel{
            titleLabel.font = GSFont.b4s
        }
        button.titleEdgeInsets = UIEdgeInsets(top: 32, left: -((button.titleLabel?.frame.width)!)-12, bottom: 0, right: 0)
        button.imageEdgeInsets = UIEdgeInsets(top: -22, left: 26, bottom: 0, right: 0) //수정필요
        return button
    }
  

    func setStyle(){
        [makeRewardStackLabelView(for: .thePopRewards),
         makeRewardStackLabelView(for: .gsPoint),
         makeRewardStackLabelView(for: .couponBox)
        ].forEach{
            rewardStackView.addArrangedSubview($0)
        }
        [makeHistoryStackButton(for: .recentProduct),
         makeHistoryStackButton(for: .likeProduct),
         makeHistoryStackButton(for: .myReview),
         makeHistoryStackButton(for: .giftBox)
        ].forEach{
            historyStackView.addArrangedSubview($0)
        }
    }

}
