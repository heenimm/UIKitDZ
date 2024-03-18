// MVPViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

final class MVPViewController: UIViewController {
    var presenter: MainViewPresenterProtocol!

    lazy var greetingLAbel: UILabel = {
        let label = UILabel(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        return label
    }()

    lazy var okButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 100, y: 200, width: 200, height: 100))
        button.setTitle("Tap", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupSubviews()
    }

    @objc func tappedButton() {
        presenter.showGreeting()
    }

    func setupSubviews() {
        view.addSubview(greetingLAbel)
        view.addSubview(okButton)
    }
}

extension MVPViewController: MainViewProtocol {
    func setGreeting(greeting: String) {
        greetingLAbel.text = greeting
    }
}
