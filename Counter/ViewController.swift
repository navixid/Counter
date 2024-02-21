//
//  ViewController.swift
//  Counter
//
//  Created by navi on 19.02.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var changeHistory: UITextView!
    
    private var count = 0
       
    @IBOutlet weak var countLabel: UILabel!
    
    private var date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
      
    
    @IBAction func tapDownButton(_ sender: UIButton) {
        if count > 0 {
            count -= 1
            countLabel.text = "Значение счётчика: \(count)"
            changeHistory.text = "\(date.formatRusDate): значение изменено на -1"
        } else {
            count = 0
            changeHistory.text = "\(date.formatRusDate): попытка уменьшить значение счётчика ниже 0"
        }
    }
    
    
    @IBAction func tapUpButton(_ sender: UIButton) {
        count += 1
        countLabel.text = "Значение счётчика: \(count)"
        changeHistory.text = "\(date.formatRusDate): значение изменено на +1"
    }
    
    
    @IBAction func resetButton(_ sender: UIButton) {
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

