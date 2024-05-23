//
//  PreOrderCoordinator.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/22/24.
//

import UIKit

final class PreOrderCoordinator: FlowCoordinator {
    var presentationStyle: PresentationStyle
    weak var navigationController: UINavigationController?

    init(presentationStyle: PresentationStyle) {
        self.presentationStyle = presentationStyle
    }

    func initScene() -> UIViewController {
        let preOrderViewController = PreOrderViewController(delegate: self)
        return preOrderViewController
    }
}

extension PreOrderCoordinator: PreOrderCoordinatorDelegate {
    func goToDetailView() {
        guard let navigationController = navigationController else { return }
        DetailCoordinator(
            presentationStyle: .push(
                navigationController: navigationController
            )
        ).start()
    }
}
