// DetailViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class DetailViewController: UIViewController {
    weak var collectionView: UICollectionView!

    /// здесь загружается вью для контроллера представлений
    override func loadView() {
        super.loadView()

        /// UICollectionViewLayout()  - это был единственный способ создания макета, пока в 2020 не появился композишнл.
        /// Также там можно указать собственный созданный макет
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cv)
        NSLayoutConstraint.activate([
            cv.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            cv.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height)

        ])
        collectionView = cv
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .white
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
    }
}

extension DetailViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CollectionViewCell",
            for: indexPath
        ) as? CollectionViewCell else { return UICollectionViewCell() }

        cell.textlabel.text = String(indexPath.row + 1)
        return cell
    }
}

extension DetailViewController: UICollectionViewDelegate {}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(width: collectionView.bounds.size.width - 16, height: 120)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        50
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        UIEdgeInsets(top: 80, left: 80, bottom: 80, right: 80)
    }
}
