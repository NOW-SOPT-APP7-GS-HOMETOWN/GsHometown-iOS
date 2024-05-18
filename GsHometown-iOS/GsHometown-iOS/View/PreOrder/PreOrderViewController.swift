//
//  PreOrderViewController.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/17/24.
//

import UIKit

import SnapKit

class PreOrderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    private lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .red
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isScrollEnabled = true
        return scrollView
    }()
        
    
    private lazy var contentView = UIView()
    
    let mainView = MainView()
    let eventView = EventView()
    
    private func setUI() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        contentView.isUserInteractionEnabled = true
        
        mainView.isUserInteractionEnabled = true
        eventView.isUserInteractionEnabled = true
        contentView.addSubview(mainView)
        contentView.addSubview(eventView)
        
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints{
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints{
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView) // 이거 있어야 subview 클릭 가능
            $0.height.equalTo(2000)
        }
        
        mainView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.height.equalTo(606)
            $0.width.equalTo(UIScreen.main.bounds.width)
        }
        eventView.snp.makeConstraints{
            $0.top.equalTo(mainView.snp.bottom)
            $0.height.equalTo(351)
            $0.width.equalTo(UIScreen.main.bounds.width)
        }
    }

}
