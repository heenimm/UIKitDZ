// MVPPresenter.swift
// Copyright © RoadMap. All rights reserved.

import Foundation

protocol MainViewProtocol: AnyObject {
    func setGreeting(greeting: String)
}

protocol MainViewPresenterProtocol: AnyObject {
    init(view: MainViewProtocol, person: Person)
    func showGreeting()
}

final class MVPPresenter: MainViewPresenterProtocol {
    let view: MainViewProtocol
    let person: Person

    init(view: MainViewProtocol, person: Person) {
        self.view = view
        self.person = person
    }

    func showGreeting() {
        let greeting = person.firstName + " " + person.lastName
        view.setGreeting(greeting: greeting)
    }
}
