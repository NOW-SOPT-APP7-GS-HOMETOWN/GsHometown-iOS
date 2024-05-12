//
//  Config.swift
//  GsHometown-iOS
//
//  Created by 한지석 on 5/12/24.
//

import Foundation

enum Config {
    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
            static let apiKey = "API_KEY"
        }
    }

    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist cannot found")
        }
        return dict
    }()
}

extension Config {
    static let baseURL: String = {
        guard let key = Config.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("Base URL is not set in plist for this configuration")
        }
        return key
    }()

    static let apiKey: String = {
        guard let key = Config.infoDictionary[Keys.Plist.apiKey] as? String else {
            fatalError("API KEY is not set in plist for this configuration")
        }
        return key
    }()
}
