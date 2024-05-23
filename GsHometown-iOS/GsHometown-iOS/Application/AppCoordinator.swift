//
//  AppCoordinator.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/23/24.
//

import UIKit

final class AppCoordinator: Coordinator {

    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.navigationBar.isHidden = true
    }

    func start() {
        self.goToTabBar()
    }

    func goToTabBar() {
        GSTabBarCoordinator(
            presentationStyle: .push(
                navigationController: navigationController
            )
        ).start()
    }

}
