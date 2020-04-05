//
//  ViewController.swift
//  Weekday Finder
//
//  Created by Ivan Prybolovetz on 4/5/20.
//  Copyright © 2020 Ivan Prybolovetz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topLabel: UILabel!
    
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var monthTF: UITextField!
    @IBOutlet weak var yearTF: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func findDayButton(_ sender: UIButton) {
        
        //Check for nil
        guard let day = dateTF.text, let month = monthTF.text, let year = yearTF.text else { return }
        
        //Set the calendar, collected the date from TextField
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.day = Int(day)
        dateComponents.month = Int(month)
        dateComponents.year = Int(year)
        
        let dateFormatter = DateFormatter()
        //Locale to Russian
        dateFormatter.locale = Locale.init(identifier: "ru_Ru")
        
        dateFormatter.dateFormat = "EEEE"
        
        guard let date = calendar.date(from: dateComponents) else { return }
        
        let weekDay = dateFormatter.string(from: date )
        let capitalizedWeekDay = weekDay.capitalized
        resultLabel.text = capitalizedWeekDay
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true )
    }
}
