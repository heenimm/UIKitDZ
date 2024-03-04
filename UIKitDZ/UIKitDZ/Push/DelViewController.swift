// DelViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class DelViewController: UIViewController {
    @IBOutlet var dataTF: UITextField!

    @IBOutlet var dataTF1: UITextField!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc2 = segue.destination as? DefferViewController {
            vc2.dt1 = dataTF.text!
            vc2.dt2 = dataTF1.text!
            vc2.dataClosure = { [weak self] text in
                self?.dataTF.text = text
            }
            vc2.dataClosure2 = { [weak self] text in
                self?.dataTF1.text = text
            }
        }
    }
}
