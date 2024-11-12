//
//  AlbumViewController.swift
//  iTunesCoreData
//
//  Created by Ибрагим Габибли on 03.11.2024.
//

import Foundation
import UIKit
import SnapKit

class AlbumViewController: UIViewController {
    var album: Album?

    let albumImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        return image
    }()

    let albumNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    }()

    let artistNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .systemGray
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupAlbum()
    }

    private func setupViews() {
        view.addSubview(albumImageView)
        view.addSubview(albumNameLabel)
        view.addSubview(artistNameLabel)

        albumImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
            make.height.width.equalTo(200)
        }

        albumNameLabel.snp.makeConstraints { make in
            make.top.equalTo(albumImageView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.leading.equalTo(albumImageView.snp.trailing).offset(10)
            make.trailing.equalToSuperview().inset(10)
        }

        artistNameLabel.snp.makeConstraints { make in
            make.top.equalTo(albumNameLabel.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
        }
    }

    private func setupAlbum() {
        guard let album else {
            return
        }

        let UrlString = album.artworkUrl100
        ImageLoader.shared.loadImage(from: UrlString) { [weak self] loadedImage in
            DispatchQueue.main.async {
                self?.albumImageView.image = loadedImage
            }
        }

        albumNameLabel.text = album.collectionName
        artistNameLabel.text = album.artistName
    }
}
