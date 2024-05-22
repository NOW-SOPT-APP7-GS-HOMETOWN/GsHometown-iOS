//
//  HomeViewController+.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/17/24.
//

import UIKit

extension HomeViewController {
    internal func addObservers() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(currentEventImageChanged),
            name: .currentEventID,
            object: nil
        )
    }

    @objc
    func currentEventImageChanged(notification: Notification) {
        if let id = notification.userInfo?["currentEventID"] as? Int {
            switch id {
            case 1:
                self.eventCurrentImage = GSImage.mockEvent1!
            case 2:
                self.eventCurrentImage = GSImage.mockEvent2!
            case 3:
                self.eventCurrentImage = GSImage.mockEvent3!
            default:
                self.eventCurrentImage = GSImage.mockEvent1!
            }
            collectionView!.reloadData()
        }
    }

    internal func startTimer() {
        NotificationCenter.default.post(
            name: .startTimer,
            object: nil
        )
    }

    internal func stopTimer() {
        NotificationCenter.default.post(
            name: .stopTimer,
            object: nil)
    }
}
