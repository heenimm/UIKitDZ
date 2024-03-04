// PushViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class PushViewController: UIViewController {
    var text = ""

    @IBOutlet var mainLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = text
    }
}
