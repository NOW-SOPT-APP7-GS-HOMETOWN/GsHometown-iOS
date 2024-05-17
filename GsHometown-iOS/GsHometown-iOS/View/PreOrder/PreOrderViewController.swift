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
    
    private func setUI() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        contentView.addSubview(mainView)
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints{
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.height.equalTo(2000)
        }
        
        mainView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.height.equalTo(596)
            $0.width.equalTo(UIScreen.main.bounds.width)
        }
    }

}
