//
//  MyInfoViewController.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/21/24.
//

import UIKit

class MyInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        // Do any additional setup after loading the view.
    }
    
    private func setUI() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        contentView.isUserInteractionEnabled = true
        
        [userInfoView].forEach{
            contentView.addSubview($0)
        }
    }

    private func setLayout() {
        scrollView.snp.makeConstraints{
            $0.edges.equalTo(view.safeAreaLayoutGuide)
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
    }
    
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    private lazy var contentView = UIView()
    private let userInfoView = UserInfoView()
}
