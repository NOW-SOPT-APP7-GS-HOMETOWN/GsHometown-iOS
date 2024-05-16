//
//  EventOfTheMonth.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/16/24.
//

import UIKit

struct EventOfTheMonth {
    let id: Int
    let item: UIImage
}

extension EventOfTheMonth {
    static let mockData: [EventOfTheMonth] = [
        EventOfTheMonth(id: 1, item: GSImage.mockEvent1!),
        EventOfTheMonth(id: 2, item: GSImage.mockEvent2!),
        EventOfTheMonth(id: 3, item: GSImage.mockEvent3!),
        EventOfTheMonth(id: 1, item: GSImage.mockEvent1!),
        EventOfTheMonth(id: 2, item: GSImage.mockEvent2!),
        EventOfTheMonth(id: 3, item: GSImage.mockEvent3!),
        EventOfTheMonth(id: 1, item: GSImage.mockEvent1!),
        EventOfTheMonth(id: 2, item: GSImage.mockEvent2!),
        EventOfTheMonth(id: 3, item: GSImage.mockEvent3!)
    ]

    static let addedMockData: [EventOfTheMonth] = [
        EventOfTheMonth(id: 1, item: GSImage.mockEvent1!),
        EventOfTheMonth(id: 2, item: GSImage.mockEvent2!),
        EventOfTheMonth(id: 3, item: GSImage.mockEvent3!)
    ]
}
