//
//  ViewController.swift
//  Counter
//
//  Created by Alfa on 06.01.2026.
//

import UIKit

class ViewController: UIViewController {
    private lazy var dateFormatter = {
        let dateFormatter = DateFormatter()

        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "dd.MM HH:mm"
        
        return dateFormatter
    }()
    
    private var date: String { dateFormatter.string(from: Date()) }
    
    private var count = 0 {
        didSet {
            countText.text = String(count)
        }
    }

    @IBOutlet weak var countText: UILabel!
    @IBOutlet weak var logsTextView: UITextView!

    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var decreaseButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        decreaseButton.tintColor = .blue
        increaseButton.tintColor = .red
        
        logsTextView.text = "История изменений:\n"
    }
    
    @IBAction func onDecreaseTap(_ sender: Any) {
        if count <= 0 {
            log("попытка уменьшить значение счётчика ниже 0")
            return
        }

        count -= 1
        log("значение изменено на -1")
    }
    
    @IBAction func onIncreaseTap(_ sender: Any) {
        count += 1
        log("значение изменено на +1")
    }

    @IBAction func onClearTap(_ sender: Any) {
        count = 0
        log("значение сброшено")
    }
    
    private func log(_ text: String) {
        logsTextView.text += "[\(date)]:" + text + "\n"
        scrollLogsToBottom()
    }
    
    private func scrollLogsToBottom() {
        let range = NSRange(location: logsTextView.text.utf16.count - 1, length: 1)
        logsTextView.scrollRangeToVisible(range)
    }
}

