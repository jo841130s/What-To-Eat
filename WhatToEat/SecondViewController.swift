//
//  SecondViewController.swift
//  WhatToEat
//
//  Created by JTINGKAO on 2019/11/6.
//  Copyright © 2019 JTINGKAO. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController : UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    
    @IBOutlet weak var arrows: UIStackView!
    @IBOutlet weak var arrow: UIStackView!
    @IBOutlet weak var timeSegment: UISegmentedControl!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var foodPickerView: UIPickerView!
    
    let breakfastArray = FoodOptionController().breakfastArray
    
    let lunchAndDinnerArray = FoodOptionController().lunchAndDinnerArray
    
    let breakfastNumber = 20000
    
    let lunchDinnerNumber = 36000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeButton.layer.cornerRadius = 10.0
        
        arrow.transform = CGAffineTransform(scaleX: 1, y: -1)
        arrows.transform = CGAffineTransform(scaleX: 1, y: -1)
        
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
    
    
    @IBAction func editButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goToEdit", sender: self)
    }
    
    
}
