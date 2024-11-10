//
//  AlbumCollectionViewCell.swift
//  iTunesCoreData
//
//  Created by Ибрагим Габибли on 03.11.2024.
//

import UIKit
import SnapKit

class AlbumCollectionViewCell: UICollectionViewCell {
    static let id = "AlbumCollectionViewCell"

    let albumImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 30
        image.clipsToBounds = true
        image.contentMode = .scaleToFill

        return image
    }()

    let albumLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)

        return label
    }()

    let singerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()

    let trackCountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()

    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.hidesWhenStopped = true
        return activityIndicator
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        customizeCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        albumImage.image = nil
        albumLabel.text = nil
        singerLabel.text = nil
        trackCountLabel.text = nil
        activityIndicator.stopAnimating()
    }

    private func setupViews() {
        contentView.addSubview(activityIndicator)
        contentView.addSubview(albumImage)
        contentView.addSubview(albumLabel)
        contentView.addSubview(singerLabel)
        contentView.addSubview(trackCountLabel)

        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }

        albumImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(10)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(60)
        }

        albumLabel.snp.makeConstraints { make in
            make.leading.equalTo(albumImage.snp.trailing).inset(-10)
            make.trailing.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(10)
        }

        singerLabel.snp.makeConstraints { make in
            make.leading.equalTo(albumLabel)
            make.trailing.equalToSuperview().inset(70)
            make.bottom.equalToSuperview().inset(10)
        }

        trackCountLabel.snp.makeConstraints { make in
            make.leading.equalTo(singerLabel.snp.trailing).inset(-5)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }

    private func customizeCell() {
        backgroundColor = .systemBrown
    }
}
