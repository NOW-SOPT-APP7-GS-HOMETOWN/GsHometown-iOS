//
//  MyInfoViewController.swift
//  GsHometown-iOS
//
//  Created by 이수민 on 5/21/24.
//

import UIKit

import SnapKit

class MyInfoViewController: UIViewController {

    private let rootView = MyInfoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        self.view = rootView
    }
    
}
