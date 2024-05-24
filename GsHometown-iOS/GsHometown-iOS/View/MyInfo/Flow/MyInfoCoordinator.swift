//
//  MyInfoCoordinator.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/24/24.
//

import UIKit

final class MyInfoCoordinator: FlowCoordinator {
    var presentationStyle: PresentationStyle
    weak var navigationController: UINavigationController?

    init(presentationStyle: PresentationStyle) {
        self.presentationStyle = presentationStyle
    }

    func initScene() -> UIViewController {
        let myInfoViewController = MyInfoViewController()
        return myInfoViewController
    }
}
