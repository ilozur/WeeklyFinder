//
//  ViewController.swift
//  weeklyFinder
//
//  Created by Edmond Podlegaev on 05.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var DateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    @IBOutlet weak var labelOfWeekday: UILabel!
    
    @IBAction func buttonFind(_ sender: UIButton) {
        
        guard let day = DateTF.text, let month = monthTF.text, let year = yearTF.text else { return }
        
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateFormatter = DateFormatter();
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "en_EN")
        
        guard let date = calendar.date(from: dateComponents) else { return }
        
        let weekday = dateFormatter.string(from: date)
        let capitalizedWeekday = weekday.capitalized
        
        labelOfWeekday.text = capitalizedWeekday
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

