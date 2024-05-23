//
//  HomeCoordinator.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/22/24.
//

import UIKit

final class HomeCoordinator: FlowCoordinator {
    var presentationStyle: PresentationStyle
    weak var navigationController: UINavigationController?

    init(presentationStyle: PresentationStyle) {
        self.presentationStyle = presentationStyle
    }

    func initScene() -> UIViewController {
        let homeViewController = HomeViewController(homeCoordinatorDelegate: self)
        return homeViewController
    }
}

extension HomeCoordinator: HomeCoordinatorDelegate {
    func goToPreOrderView() {
        guard let navigationController = navigationController else { return }
        PreOrderCoordinator(
            presentationStyle: .push(
                navigationController: navigationController
            )
        ).start()
    }
}
