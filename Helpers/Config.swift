//
//  Config.swift
//  Booklyn
//
//  Created by MARIIA on 29.04.24.
//

import Foundation

struct Config {
    static let apiKey: String = {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "GIDClientID") as? String else {
            fatalError("API Key must be set in the Info.plist")
        }
        return key
    }()
}

