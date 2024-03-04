// DefferViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class DefferViewController: UIViewController {
    @IBOutlet var dataVCTF: UITextField!
    @IBOutlet var dataVCTF1: UITextField!
    @IBAction func dataVCButton(_ sender: Any) {
        dataClosure?(dataVCTF.text!)
        dataClosure2?(dataVCTF1.text!)
        dismiss(animated: true)
    }

    var dt1 = ""
    var dt2 = ""

    typealias Closure = (String) -> ()
    var dataClosure: Closure?
    var dataClosure2: Closure?

    override func viewDidLoad() {
        super.viewDidLoad()
        dataVCTF.text = dt1
        dataVCTF1.text = dt2
    }
}
