//
//  UserMenuView.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/22/24.
//

import UIKit

import SnapKit

class UserMenuView: UIView {

    private var orderInfoView : UIView!
    private var purchaseInfoView : UIView!
    private var discountInfoView : UIView!
    private var myInfoView : UIView!
    private var noticeInfoView : UIView!
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = GSColor.grey00
        setUI()
        setLayout()
    }
    
    private func setUI() {
        orderInfoView = createMenuView(for : .orderInfo)
        purchaseInfoView = createMenuView(for : .purchaseInfo)
        discountInfoView = createMenuView(for : .discountInfo)
        myInfoView = createMenuView(for : .myInfo)
        noticeInfoView = createMenuView(for : .noticeInfo)
        
        [orderInfoView, purchaseInfoView, discountInfoView, myInfoView, noticeInfoView].forEach{
            self.addSubview($0)
        }
    }
    
    private func setLayout() {
        orderInfoView.snp.makeConstraints{
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalTo(146)
        }
        purchaseInfoView.snp.makeConstraints{
            $0.top.equalTo(orderInfoView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(191)
        }
        discountInfoView.snp.makeConstraints{
            $0.top.equalTo(purchaseInfoView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(105)
        }
        myInfoView.snp.makeConstraints{
            $0.top.equalTo(discountInfoView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(236)
        }
        noticeInfoView.snp.makeConstraints{
            $0.top.equalTo(myInfoView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(136)
        }
    }
    
    private func createMenuView(for type: UserMenuType) -> UIView {
        let view = UIView()
        let headerView = ReusableMenuHeaderView(title: type.title)
        view.addSubview(headerView)
        headerView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(53)
        }
        let menuCount = type.menuArray.count
        for i in 0..<(menuCount + 1) / 2 {
            let firstMenuIndex = 2*i
            let secondMenuIndex = 2*i + 1
            
            let menuStackView = ReusableStackView(firstMenu: type.menuArray[firstMenuIndex], secondMenu: (menuCount % 2 == 1 && secondMenuIndex == menuCount) ? nil : type.menuArray[secondMenuIndex])
            view.addSubview(menuStackView)
            menuStackView.snp.makeConstraints {
                $0.top.equalTo(headerView.snp.bottom).offset(Double(44 * i))
                $0.leading.trailing.equalToSuperview()
                $0.height.equalTo(44)
            }
        }
        return view
    } // 각각의 메뉴 뷰 그리는 함수
}
