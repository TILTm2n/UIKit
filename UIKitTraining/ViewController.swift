//
//  ViewController.swift
//  UIKitTraining
//
//  Created by Eugene on 03.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let picker = UIDatePicker() //необходим для выбора даты и времени
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.center = self.view.center
        
        self.view.addSubview(picker)
        
        picker.addTarget(self, action: #selector(datePickerChange(datePicker:)), for: .valueChanged)
        
        picker.datePickerMode = .date
        
        //для создания обратного отсчета
        //picker.datePickerMode = .countDownTimer
        //picker.countDownDuration = 2 * 60
        
        var oneYear = TimeInterval()
        
        oneYear = 365 * 24 * 60 * 60
        
        let todayDay = Date()
        
        let oneYearFromToday = todayDay.addingTimeInterval(oneYear)
        let twoYearFromToday = todayDay.addingTimeInterval(2 * oneYear)
        
        picker.minimumDate = oneYearFromToday
        picker.maximumDate = twoYearFromToday
        
        
        
    }
    
    @objc
    func datePickerChange(datePicker: UIDatePicker){
        if datePicker.isEqual(self.picker){
            print("dateChange = ", datePicker.date)
        }
    }

}


