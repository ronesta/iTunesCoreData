//
//  SearchHistoryManager.swift
//  iTunesCoreData
//
//  Created by Ибрагим Габибли on 13.11.2024.
//

import Foundation
import UIKit

class SearchHistoryManager {
    static let shared = SearchHistoryManager()
    private let historyKey = "searchHistory"

    func saveSearchTerm(_ term: String) {
        var history = getSearchHistory()
        if !history.contains(term) {
            history.append(term)
            UserDefaults.standard.set(history, forKey: historyKey)
        }
    }

    func getSearchHistory() -> [String] {
        return UserDefaults.standard.array(forKey: historyKey) as? [String] ?? []
    }

    func clearHistory() {
        UserDefaults.standard.removeObject(forKey: historyKey)
    }
}
