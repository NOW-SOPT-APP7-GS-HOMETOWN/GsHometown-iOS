//
//  ScrollToTopButton.swift
//  GsHometown-iOS
//
//  Created by 오연서 on 5/20/24.
//

import Foundation

import UIKit
import Then

final class ScrollToTopButton: UIButton {
    
    private let scrollToTopButton = UIButton().then {
        $0.setImage(UIImage.scrollToTop, for: .normal)
        $0.layer.cornerRadius = 23
    }
    
    private var scrollView: UIScrollView?
    
    init(scrollView: UIScrollView) {
        self.scrollView = scrollView
        super.init(frame: .zero)
        
        setupHierarchy()
        setupLayout()
        setupActions()
    }
    
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func scrollToTop() {
        scrollView?.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
}

private extension ScrollToTopButton {
    
    func setupHierarchy() {
        addSubview(scrollToTopButton)
    }
    
    func setupLayout() {
        scrollToTopButton.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.size.equalTo(46)
        }
    }
    
    func setupActions() {
        scrollToTopButton.addTarget(self, action: #selector(scrollToTop), for: .touchUpInside)
    }
}
