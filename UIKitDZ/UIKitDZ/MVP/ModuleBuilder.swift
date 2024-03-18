// ModuleBuilder.swift
// Copyright © RoadMap. All rights reserved.

import Foundation
import UIKit

protocol Builder: AnyObject {
    static func createMain() -> UIViewController
}

final class ModuleBuilder: Builder {
    static func createMain() -> UIViewController {
        let view = MVPViewController()
        let person = Person(firstName: "John", lastName: "Connor")
        let presenter = MVPPresenter(view: view, person: person)
        view.presenter = presenter
        return view
    }
}
