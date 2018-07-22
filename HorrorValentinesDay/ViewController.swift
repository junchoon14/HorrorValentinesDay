//
//  ViewController.swift
//  HorrorValentinesDay
//
//  Created by Jason Hsu on 2018/7/22.
//  Copyright © 2018 junchoon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var anniversaryDisplayLabel: UILabel!
    
    @IBOutlet weak var todayDisplayLabel: UILabel!
   
    @IBOutlet weak var timeIntervalDisplayLabel: UILabel!
    
    //Date Picker選擇完成後，開始執行程式
    @IBAction func showPicker(_ sender: UIDatePicker) {
        //今天的日期
        let now = Date()
        let anniversary = datePicker.date
        //日期格式修訂
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy年 MM月 dd日"
        //let interval = anniversary.timeIntervalSince(now)
        anniversaryDisplayLabel.text = formatter.string(from: anniversary)
        todayDisplayLabel.text = formatter.string(from: now)
        //使用calendar.curren得到使用者的日曆，來計算差值，並列出年月日
        let diffDateComponents = Calendar.current.dateComponents([.year,.month,.day], from: now, to: anniversary)
        timeIntervalDisplayLabel.text = "\(String(describing: diffDateComponents.year!))年" + " \(String(describing: diffDateComponents.month!))月" + " \(String(describing: diffDateComponents.day!))日"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //設定Date Picker
        //只顯示日期
        datePicker.datePickerMode = .date
        //顯示中文
        datePicker.locale = Locale(identifier: "zh_CN")
        //日期從今天開始選擇
        datePicker.minimumDate = Date()

        
    }


}

