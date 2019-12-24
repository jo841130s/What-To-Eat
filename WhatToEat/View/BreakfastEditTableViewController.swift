//
//  EditTableViewController.swift
//  WhatToEat
//
//  Created by 黃冠中 on 2019/12/24.
//  Copyright © 2019 JTINGKAO. All rights reserved.
//

import UIKit
import RealmSwift

class BreakfastEditTableViewController : UITableViewController {
    let realm = try! Realm()
    
    let breakfastArray = ["蛋餅","漢堡","鐵板麵","蘿蔔糕","飯糰","蔥油餅","煎餃","饅頭","三明治","回去睡","稀飯","麥當勞","摩斯漢堡","星巴克","捲餅","包子","雞塊","水果","沙拉","麵包"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return breakfastArray.count
    }
    
    func save(food: Food) {
        do {
            try realm.write {
                realm.add(food)
            }
        } catch  {
            print(error)
        }
        
    }
}
