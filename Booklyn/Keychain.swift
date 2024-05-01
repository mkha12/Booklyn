//
//  Keychain.swift
//  Booklyn
//
//  Created by MARIIA on 01.05.24.
//

import Foundation
import SwiftKeychainWrapper

class KeychainManager {
    static let shared = KeychainManager()

    private init() {}

    func save(_ value: String, for key: String) -> Bool {
        return KeychainWrapper.standard.set(value, forKey: key)
    }

    func retrieve(_ key: String) -> String? {
        return KeychainWrapper.standard.string(forKey: key)
    }

    func delete(_ key: String) -> Bool {
        return KeychainWrapper.standard.removeObject(forKey: key)
    }
}
