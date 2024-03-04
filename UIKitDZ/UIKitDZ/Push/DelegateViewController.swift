// DelegateViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class DelegateViewController: UIViewController {
    var delegate: PizzaDelegate?

    private lazy var saveButton: UIButton = {
        let button = UIButton(frame: CGRect(origin: .zero, size: CGSize(width: 300, height: 300)))
        button.setTitle("Push data", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(data), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        view.addSubview(saveButton)
    }

    @IBAction func onButtonAction() {}

    @objc func data() {
        delegate?.onPizzaReady(type: "Cezzar")
        navigationController?.popToRootViewController(animated: true)
    }
}
