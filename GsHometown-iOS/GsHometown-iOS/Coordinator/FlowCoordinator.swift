//
//  FlowCoordinator.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/22/24.
//

import UIKit

protocol FlowCoordinator: Coordinator {
    var presentationStyle: PresentationStyle { get set }
    var navigationController: UINavigationController? { get set }

    func start()
    func initScene() -> UIViewController
}

extension FlowCoordinator {
    func start() {
        switch presentationStyle {
        case .push(let navigationController):
            self.navigationController = navigationController
            let initScene = initScene()
            self.navigationController?.pushViewController(initScene, animated: true)
        case .none:
            self.navigationController = UINavigationController(rootViewController: initScene())
        }
    }
}
