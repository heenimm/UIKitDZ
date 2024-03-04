// ClousurViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

class ClousurViewController: UIViewController {
    var completionHandler: ((String) -> Void)?

    private let maxNumberCount = 11
    private let regex = try? NSRegularExpression(pattern: "[\\+\\s-\\(\\)]", options: .caseInsensitive)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(saveButton)
        view.addSubview(textField)
        view.addSubview(mySwitch)
        view.addSubview(myTextView)
        textField.delegate = self
    }

    private let mySwitch: UISwitch = {
        let mySwitch = UISwitch(frame: CGRect(
            x: 100,
            y: 500,
            width: 0,
            height: 0
        ))
        mySwitch.setOn(true, animated: true)
        return mySwitch
    }()

    private lazy var saveButton: UIButton = {
        let button = UIButton(frame: CGRect(
            x: 20,
            y: 100,
            width: 400,
            height: 50
        ))
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Push data", for: .normal)
        button.backgroundColor = .darkGray
        button.addTarget(self, action: #selector(data), for: .touchUpInside)
        return button
    }()

    private let myTextView: UITextView = {
        let textView = UITextView(frame: CGRect(
            x: 20,
            y: 300,
            width: 400,
            height: 150
        ))
        textView.isScrollEnabled = true
        textView.text = """
        UITextView supports the display of text using custom style information and also supports text editing.
        """
        textView.font = .italicSystemFont(ofSize: 18)
        textView.backgroundColor = .cyan
        textView.contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return textView
    }()

    private let textField: UITextField = {
        let textField = UITextField(frame: CGRect(
            origin: .init(
                x: 20,
                y: 200
            ),
            size: CGSize(
                width: 300,
                height: 50
            )
        ))
        textField.keyboardType = .numberPad
        textField.backgroundColor = .gray
        return textField
    }()

    @objc func data() {
        completionHandler?("Success")
        navigationController?.popToRootViewController(animated: true)
    }

    private func format(phoneNumber: String, shouldRemoveLast: Bool) -> String {
        ""
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        myTextView.resignFirstResponder()
        textField.resignFirstResponder()
    }

    private func updateTextView(parameter: Notification) {
//        let userInfo =
    }
}

extension ClousurViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        true
    }
}

extension ClousurViewController: UITextViewDelegate {}
