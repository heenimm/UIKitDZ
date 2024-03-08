// StateViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

protocol NetworkState {
    func payment(amount: Int) -> Bool
}

class Connected: NetworkState {
    func payment(amount: Int) -> Bool {
        print("Операция прошла успешно")
        return true
    }
}

class Disconnected: NetworkState {
    func payment(amount: Int) -> Bool {
        print("Операция ne прошла успешно")
        return false
    }
}

class Cart {
    private var state: NetworkState = Connected()
    var balance = 6000
    func setState(_ newState: NetworkState) {
        state = newState
    }

    func pay(amount: Int) {
        guard balance >= amount else {
            print("Денег не достаточно")
            return
        }
        guard state.payment(amount: amount) else {
            print("Платеж не прошел")
            return
        }
        print("Платеж прошел успешно")
    }
}

class StateViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        let cart = Cart()
        print(cart.balance)
        cart.pay(amount: 2000)
    }

    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
     }
     */
}
