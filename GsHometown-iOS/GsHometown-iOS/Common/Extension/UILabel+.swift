//
//  String+.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/18/24.
//

import UIKit

extension UILabel {
    func strikethrough(from text: String?, at range: String?) {
        guard let text = text,
              let range = range else { return }
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttributes([NSAttributedString.Key.strikethroughStyle: NSUnderlineStyle.single.rawValue], range: NSString(string: text).range(of: range))
        self.attributedText = attributedString
    }
}
