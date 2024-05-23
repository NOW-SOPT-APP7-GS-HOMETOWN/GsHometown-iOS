//
//  DetailCoordinator.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/22/24.
//

import UIKit

final class DetailCoordinator: FlowCoordinator {
    var presentationStyle: PresentationStyle
    weak var navigationController: UINavigationController?

    init(presentationStyle: PresentationStyle) {
        self.presentationStyle = presentationStyle
    }

    func initScene() -> UIViewController {
        let detailViewController = DetailViewController()
        return detailViewController
    }
}
