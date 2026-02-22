//
//  LocalStorageService.swift
//  MediMinder
//
//  Created by Cihan Can Baytoz on 21.02.2026.
//

import Foundation

protocol LocalStorageService {
    func getBool(forKey key: String) -> Bool
    func setBool(_ value: Bool, forKey key: String)
    func getString(forKey key: String) -> String?
    func setString(_ value: String, forKey key: String)
    func getCodable<T: Codable>(_ type: T.Type, forKey key: String) -> T?
    func setCodable<T: Codable>(_ value: T, forKey key: String)
    func remove(forKey key: String)
}
