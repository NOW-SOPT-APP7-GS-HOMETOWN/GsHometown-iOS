//
//  SegmentControl.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/17/24.
//

import UIKit

final class CustomSegmentControl: UISegmentedControl {
    
    private var segmentInset: CGFloat = 8
    
    override init(items: [Any]?) {
        super.init(items: items)
        selectedSegmentIndex = 0
        self.backgroundColor = GSColor.grey05
        self.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews(){
        super.layoutSubviews()
        
        self.layer.cornerRadius =  24
        self.backgroundColor = GSColor.grey05

        let selectedImageViewIndex = numberOfSegments
        if let selectedImageView = subviews[selectedImageViewIndex] as? UIImageView
        {
            selectedImageView.backgroundColor = GSColor.grey00
            selectedImageView.image = nil
            
            selectedImageView.bounds = selectedImageView.bounds.insetBy(dx: segmentInset, dy: segmentInset)
            
            selectedImageView.layer.masksToBounds = true
            selectedImageView.layer.cornerRadius = 20
            
            selectedImageView.layer.removeAnimation(forKey: "SelectionBounds")
        }
    }
}
