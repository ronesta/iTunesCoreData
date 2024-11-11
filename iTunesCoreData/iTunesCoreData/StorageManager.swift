//
//  StorageManager.swift
//  iTunesCoreData
//
//  Created by Ибрагим Габибли on 10.11.2024.
//

import Foundation
import UIKit

class StorageManager {
    private let albumsKey = "albumsKey"
    static let shared = StorageManager()
    private init() {}

    func saveCharacters(_ albums: [Album]) {
        do {
            let data = try JSONEncoder().encode(albums)
            UserDefaults.standard.set(data, forKey: albumsKey)
        } catch {
            print("Failed to encode characters: \(error)")
        }
    }

    func saveImage(_ image: Data, key: String) {
        UserDefaults.standard.set(image, forKey: key)
    }

    func loadCharacters() -> [Album]? {
        if let data = UserDefaults.standard.data(forKey: albumsKey) {
            do {
                let albums = try JSONDecoder().decode([Album].self, from: data)
                return albums
            } catch {
                print("Failed to encode: \(error)")
                return nil
            }
        } else {
            return nil
        }
    }

    func loadImage(key: String) -> Data? {
        return UserDefaults.standard.data(forKey: key)
    }

    func clearAlbums() {
        UserDefaults.standard.removeObject(forKey: albumsKey)
    }

    func clearImage(key: String) {
        UserDefaults.standard.removeObject(forKey: key)
    }
}
