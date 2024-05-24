//
//  GSTabBarCoordinator.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/22/24.
//

import UIKit

final class GSTabBarCoordinator: FlowCoordinator {

    var presentationStyle: PresentationStyle
    weak var navigationController: UINavigationController?

    init(presentationStyle: PresentationStyle) {
        self.presentationStyle = presentationStyle
    }

    private func createTabBarItem(
        type: GSTabBarType
    ) -> UIViewController {
        let tabBarItem = UITabBarItem(
            title: nil,
            image: type.inactive,
            selectedImage: type.active
        )
        tabBarItem.imageInsets.top = type == .payment ? -31 : 5
        let currentViewController = type.viewController
        currentViewController.tabBarItem = tabBarItem
        return currentViewController
    }

    func initScene() -> UIViewController {
        let tabBarController = GSTabBarController()
        var viewControllers: [UIViewController] = []
        let home = GSTabBarType.home
        let homeTabBarItem = UITabBarItem(
            title: nil,
            image: home.inactive,
            selectedImage: home.active
        )
        homeTabBarItem.imageInsets.top = 5
        let homeCoordinator = HomeCoordinator(presentationStyle: .none)
        homeCoordinator.start()
        guard let homeViewController = homeCoordinator.navigationController else {
            return UIViewController()
        }
        homeViewController.tabBarItem = homeTabBarItem
        viewControllers.append(homeViewController)

        GSTabBarType.allCases.forEach {
            if $0 != .home && $0 != .myInfo {
                let tabBarItem = UITabBarItem(
                    title: nil,
                    image: $0.inactive,
                    selectedImage: $0.active
                )
                tabBarItem.imageInsets.top = $0 == .payment ? -31 : 5
                let currentViewController = $0.viewController
                currentViewController.tabBarItem = tabBarItem
                viewControllers.append(currentViewController)
            }
        }

        let myInfo = GSTabBarType.myInfo
        let myInfoTabBarItem = UITabBarItem(
            title: nil,
            image: myInfo.inactive,
            selectedImage: myInfo.active
        )
        let myInfoCoordinator = MyInfoCoordinator(presentationStyle: .none)
        myInfoCoordinator.start()
        guard let myInfoViewController = myInfoCoordinator.navigationController else {
            return UIViewController()
        }
        myInfoViewController.tabBarItem = myInfoTabBarItem
        viewControllers.append(myInfoViewController)

        tabBarController.setViewControllers(viewControllers, animated: true)
        return tabBarController
    }
}
