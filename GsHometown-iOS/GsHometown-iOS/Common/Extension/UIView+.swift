//
//  UIView+.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/17/24.
//

import UIKit

extension UIView {
    static func grayDivider(height: CGFloat) -> UIView {
        let view = UIView()
        view.backgroundColor = GSColor.grey03
        view.heightAnchor.constraint(equalToConstant: height).isActive = true
        return view
    }
}
