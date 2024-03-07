// FlyViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class FlyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let one = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        let two = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        print(one === two)
        let flyColor = UIColor.rgba(1, 2, 1, 1)
    }
}

extension UIColor {
    static var colorStore: [String: UIColor] = [:]
    class func rgba(
        _ red: CGFloat,
        _ green: CGFloat,
        _ blue: CGFloat,
        _ alpha: CGFloat
    ) -> UIColor {
        let key = "\(red)\(green)\(blue)\(alpha)"
        if let color = colorStore[key] {
            return color
        }
        let color = UIColor(
            red: red,
            green: green,
            blue: blue,
            alpha: alpha
        )
        colorStore[key] = color
        return color
    }
}
