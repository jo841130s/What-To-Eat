//
//  SecondViewController.swift
//  WhatToEat
//
//  Created by JTINGKAO on 2019/11/6.
//  Copyright © 2019 JTINGKAO. All rights reserved.
//

import UIKit

class SecondViewController:UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    
    @IBOutlet weak var timeSegment: UISegmentedControl!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var foodImage: UIImageView!
    
    @IBOutlet weak var foodPickerView: UIPickerView!
    
    let breakfastArray = ["蛋餅","漢堡","鐵板麵","蘿蔔糕","飯糰","蔥油餅","煎餃","饅頭","三明治","回去睡","稀飯","麥當勞","摩斯漢堡","星巴克","捲餅","包子","雞塊","水果","沙拉","麵包"]
    
    let lunchAndDinnerArray = ["便當","義大利麵","咖哩","牛肉麵","炒麵","炒飯","壽司","牛排","火鍋","關東煮","丼飯","捲餅","沙拉","麥當勞","7-11","Family Mart","摩斯漢堡","漢堡王","鐵板燒","肉羹","燒臘","港式小點","披薩","熱炒","水餃","泡麵","台式小館","烤鴨","泰式","涼麵","減肥","BBQ","拉麵","燒烤"]
    
    let breakfastNumber = 20000
    
    let lunchDinnerNumber = 34000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        foodPickerView.delegate = self
        foodPickerView.dataSource = self
        if timeSegment.selectedSegmentIndex == 0{
            foodPickerView.selectRow(breakfastNumber / 2, inComponent: 0, animated: false)
        }else{
            foodPickerView.selectRow(lunchDinnerNumber / 2, inComponent: 0, animated: false)
        }
        
        foodPickerView.layer.cornerRadius = 10.0
        foodImage.layer.cornerRadius = 10.0
        backgroundView.layer.cornerRadius = 10.0
        timeSegment.setTitleTextAttributes([.font: UIFont(name: "Chalkduster", size: 13.0) ], for: .normal)
        
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 105.0
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if timeSegment.selectedSegmentIndex == 0{
            return breakfastNumber
        }else{
            return lunchDinnerNumber
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if timeSegment.selectedSegmentIndex == 0{
            let number = row % breakfastArray.count
            let titleForRow = breakfastArray[number]
            return titleForRow
        }else{
            let number = row % lunchAndDinnerArray.count
            let titleForRow = lunchAndDinnerArray[number]
            return titleForRow
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if timeSegment.selectedSegmentIndex == 0{
            let number = row % breakfastArray.count
                   let imageName = breakfastArray[number]
                   if let image = UIImage(named: imageName){
                       foodImage.image = image
                   }else{
                       foodImage.image = .none
                   }
                   let position = breakfastNumber / 2 + number
                   foodPickerView.selectRow(position, inComponent: 0, animated: false)
        }else{
            let number = row % lunchAndDinnerArray.count
                   let imageName = lunchAndDinnerArray[number]
                   if let image = UIImage(named: imageName){
                       foodImage.image = image
                   }else{
                       foodImage.image = .none
                   }
                   let position = lunchDinnerNumber / 2 + number
                   foodPickerView.selectRow(position, inComponent: 0, animated: false)
        }
       
    }
    
    
    @IBAction func homeButton(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
