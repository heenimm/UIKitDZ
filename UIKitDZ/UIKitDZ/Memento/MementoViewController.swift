// MementoViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

struct LineModel {
    var start: CGPoint
    var end: CGPoint
    var color: UIColor
    init(start: CGPoint, end: CGPoint, color: UIColor) {
        self.start = start
        self.end = end
        self.color = color
    }
}

class StateLinesMemento {
    var linesArray: [LineModel]

    init(lines: [LineModel]) {
        linesArray = lines
    }
}

class LinesManager {
    static let shared = LinesManager()
    var linesArray = [LineModel]()

    func save() -> StateLinesMemento {
        StateLinesMemento(lines: linesArray)
    }

    func load(state: StateLinesMemento) {
        linesArray = state.linesArray
    }

    func printLines(in view: UIView) {
        for subView in view.layer.sublayers! {
            subView.removeFromSuperlayer()
        }
        for line in linesArray {
            let path = UIBezierPath()
            path.move(to: line.start)
            path.addLine(to: line.end)
            drawShapeLayer(path, line.color, view: view)
        }
    }

    func drawShapeLayer(_ path: UIBezierPath, _ lineColor: UIColor, view: UIView) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        view.setNeedsDisplay()
        // после всех изменений заставляет вьюшку перерисоваться
    }
}

class CarrierState {
    var state: StateLinesMemento?
    var linesManager: LinesManager?

    init(linesManager: LinesManager) {
        self.linesManager = linesManager
    }

    public func aveLines() {
        state = linesManager?.save()
    }

    public func loadLine() {
        guard state != nil else { return }
        linesManager?.load(state: state!)
    }
}

class MementoViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
