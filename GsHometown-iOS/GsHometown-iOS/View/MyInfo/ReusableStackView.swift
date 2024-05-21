//
//  ResuableTwoStackView.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/22/24.
//

import UIKit

import SnapKit
import Then

class ReusableStackView: UIStackView {
    
    init(firstMenu: String, secondMenu: String?) {
        super.init(frame: .zero)
        setStyle()
        setUI(firstMenu: firstMenu, secondMenu: secondMenu)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI(firstMenu : String, secondMenu : String?){
        let firstButton = makeMenuButton(title: firstMenu)
        self.addArrangedSubview(firstButton)
        if let secondMenu = secondMenu {
            let secondButton = makeMenuButton(title: secondMenu)
            self.addArrangedSubview(secondButton)
        }
    }
    
    private func setStyle(){
        self.isLayoutMarginsRelativeArrangement = true
        self.axis = .horizontal
        self.layoutMargins.top = 12
        self.layoutMargins.bottom = 12
        self.distribution = .fillEqually
    }
    
    private func makeMenuButton(title : String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(GSColor.grey10, for: .normal)
        if let titleLabel = button.titleLabel{
            titleLabel.font = GSFont.b2m
        }
        button.contentHorizontalAlignment = .left
        return button
    }
}
