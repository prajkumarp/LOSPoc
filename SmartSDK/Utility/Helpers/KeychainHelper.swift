//
//  KeychainHelper.swift
//  ZestMoney
//
//  Created by rajkumar.panneerselvam@zestmoney.in on 17/07/23.
//

import Foundation
import Security

struct KeychainHelper{
    
    // Read value from keychain
    func getKeychainValue(for key: String) -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: key,
            kSecReturnData as String: true
        ]

        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)

        if status == errSecSuccess,
            let retrievedData = dataTypeRef as? Data,
            let value = String(data: retrievedData, encoding: .utf8) {
            return value
        } else {
            return "Not found"
        }
    }

    // Write value to keychain
    func setKeychainValue(value: String, for key: String) -> Bool {
        if let data = value.data(using: .utf8) {
            let query: [String: Any] = [
                kSecClass as String: kSecClassGenericPassword,
                kSecAttrService as String: key,
                kSecValueData as String: data,
                kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlocked
            ]

            SecItemDelete(query as CFDictionary)

            let status = SecItemAdd(query as CFDictionary, nil)

            return status == errSecSuccess
        } else {
            return false
        }
    }
    
}
