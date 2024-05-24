//
//  GSTabBarController.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/17/24.
//

import UIKit

final class GSTabBarController: UITabBarController {

    private var gsTabBar = GSTabBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setValue(gsTabBar, forKey: "tabBar")
        setStyle()
//        setTabBarItem()
//        setDelegate()
    }

    private func setStyle() {
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = GSColor.grey00
        tabBar.backgroundColor = .white
        tabBar.tintColor = GSColor.grey10
        tabBar.unselectedItemTintColor = GSColor.grey07
        tabBar.standardAppearance = appearance
    }

    private func setTabBarItem() {
        let viewControllers = GSTabBarType.allCases.map { createTabBarItem(type: $0) }
        setViewControllers(viewControllers, animated: false)
    }

//    private func setDelegate() {
//        self.delegate = self
//    }
}

final class GSTabBar: UITabBar {
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var size = super.sizeThatFits(size)
        size.height += 15
        return size
    }
}

extension GSTabBarController {
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
}

//extension GSTabBarController: UITabBarControllerDelegate {
//    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
//        guard let tabBarItems = tabBarController.tabBar.items else { return }
//        let animatedButton = tabBarController.tabBar.subviews[3]
//        print(tabBarController.tabBar.subviews)
//        UIView.animate(withDuration: 0.1) {
//            animatedButton.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
//        } completion: { _ in
//            UIView.animate(withDuration: 0.1) {
//                animatedButton.transform = CGAffineTransform.identity
//            }
//        }
//        tabBarItems[2].image = selectedIndex == 0 ?
//        GSTabBarType.payment.inactive : GSTabBarType.payment.active
//        tabBarItems[2].imageInsets.top = selectedIndex == 0 ? -31 : 5
//    }
//}
