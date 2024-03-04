// SegueViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class SegueViewController: UIViewController {
    var text: String!
    @IBOutlet var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = text
    }
}
