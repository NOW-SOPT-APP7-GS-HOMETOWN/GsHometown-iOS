//
//  DetailViewController.swift
//  GsHometown-iOS
//
//  Created by 오연서 on 5/17/24.
//

import UIKit

import SnapKit
import Then

class DetailViewController: UIViewController {

    var eventCurrentImage = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = GSColor.grey02
        setAutolayout()
    }

    private func setAutolayout() {
        eventCurrentImage.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(15)
            $0.verticalEdges.equalToSuperview()
        }
    }

}
