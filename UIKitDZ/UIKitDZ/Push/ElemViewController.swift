// ElemViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol PizzaDelegate: AnyObject {
    func onPizzaReady(type: String)
}

class ElemViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet var closu: UIButton!

    @IBAction func push(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "push") as? PushViewController
        else { return }
        vc.text = "Goga"
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func segue(_ sender: Any) {
        performSegue(withIdentifier: "showVC", sender: "Jonh")
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showVC" {
            if let vc = segue.destination as? SegueViewController {
                guard let text = sender as? String else { return }
                vc.text = text
            }
        }
    }

    @IBAction func fucnt(_ sender: UIButton) {}

    @IBAction func deleg(_ sender: Any) {
        let vcc = DelegateViewController()
        vcc.delegate = self
        navigationController?.pushViewController(vcc, animated: true)
    }

    @IBAction func clos(_ sender: Any) {
        let vc = ClousurViewController()
        vc.completionHandler = { [weak self] text in
            print("text", text)
            self?.closu.setTitle(text, for: .normal)
        }
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func notific(_ sender: Any) {}
}

extension ElemViewController: PizzaDelegate {
    func onPizzaReady(type: String) {
        print("\(type) готова")
    }
}
