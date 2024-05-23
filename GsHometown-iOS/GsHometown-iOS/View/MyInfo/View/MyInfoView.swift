//
//  MyInfoView.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/22/24.
//

import UIKit

class MyInfoView: UIView {

    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    private var contentView : UIView = UIView()
    private let userInfoView : UserInfoView = UserInfoView()
    private let firstGrayDivider : UIView = UIView.grayDivider(height: 7)
    private let userMenuView : UIView = UserMenuView()
    private let secondGrayDivider : UIView = UIView.grayDivider(height: 11)
    private let logoutView : UIView = ReusableStackView(firstMenu: "로그아웃", secondMenu: nil)
    private var scrollToTopButton: ScrollToTopButton?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setScrollButton()
    }
    
    private func setUI() {
        self.backgroundColor = GSColor.grey00
        self.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        contentView.isUserInteractionEnabled = true
        
        [userInfoView, firstGrayDivider, userMenuView, secondGrayDivider, logoutView].forEach{
            contentView.addSubview($0)
        }
    }

    private func setLayout() {
        scrollView.snp.makeConstraints{
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
        contentView.snp.makeConstraints{
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView) // 이거 있어야 subview 클릭 가능
            $0.height.equalTo(1525)
        }
        userInfoView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(264)
        }
        firstGrayDivider.snp.makeConstraints{
            $0.top.equalTo(userInfoView.snp.top).offset(288)
            $0.horizontalEdges.equalToSuperview()
        }
        userMenuView.snp.makeConstraints{
            $0.top.equalTo(userInfoView.snp.bottom).offset(31)
            $0.leading.equalToSuperview().inset((UIScreen.main.bounds.width - 345)/2)
            $0.trailing.equalToSuperview()
        }
        secondGrayDivider.snp.makeConstraints{
            $0.top.equalToSuperview().inset(1125)
            $0.horizontalEdges.equalToSuperview()
        }
        logoutView.snp.makeConstraints{
            $0.top.equalTo(secondGrayDivider.snp.bottom).offset(14)
            $0.leading.equalToSuperview().inset((UIScreen.main.bounds.width - 345)/2)
            $0.trailing.equalToSuperview()
        }
    }

    private func setScrollButton() {
        scrollToTopButton = ScrollToTopButton(scrollView: scrollView) //해당 화면의 scrollView
        guard let scrollToTopButton = scrollToTopButton else { return }
        self.addSubview(scrollToTopButton)
        
        scrollToTopButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }
}
