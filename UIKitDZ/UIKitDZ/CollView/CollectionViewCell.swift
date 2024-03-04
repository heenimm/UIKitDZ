// CollectionViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class CollectionViewCell: UICollectionViewCell {
    weak var textlabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(label)
//        label.frame = contentView.bounds
        textlabel = label
        contentView.backgroundColor = .gray
        textlabel.textAlignment = .center
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

        ])
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
