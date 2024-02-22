//
//  ViewController.swift
//  Counter
//
//  Created by navi on 19.02.2024.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var changeHistory: UITextView!
    
    private var count = 0
       
    @IBOutlet private weak var countLabel: UILabel!
    
    private var date = Date()
    
    @IBAction private func tapDownButton(_ sender: UIButton) {
        if count > 0 {
            count -= 1
            countLabel.text = "Значение счётчика: \(count)"
            changeHistory.text = "\(date.formatRusDate): значение изменено на -1"
        } else {
            count = 0
            changeHistory.text = "\(date.formatRusDate): попытка уменьшить значение счётчика ниже 0"
        }
    }
    
    
    @IBAction private func tapUpButton(_ sender: UIButton) {
        count += 1
        countLabel.text = "Значение счётчика: \(count)"
        changeHistory.text = "\(date.formatRusDate): значение изменено на +1"
    }
    
    
    @IBAction private func resetButton(_ sender: UIButton) {
        count = 0
        countLabel.text = "Значение счётчика: \(count)"
        changeHistory.text = "\(date.formatRusDate): значение сброшено"
    }
    
}

extension Date {
    var formatRusDate: String {
        let dateFormat = DateFormatter()
        dateFormat.locale = Locale(identifier: "ru_RU")
        dateFormat.setLocalizedDateFormatFromTemplate("dd.MM.yyyy HH:mm:ss")
        return dateFormat.string(from: Date())
    }
}

