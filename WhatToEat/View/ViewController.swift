//
//  ViewController.swift
//  WhatToEat
//
//  Created by JTINGKAO on 2019/11/6.
//  Copyright © 2019 JTINGKAO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func startButton(_ sender: UIButton) {
        performSegue(withIdentifier: "start", sender: self)
    }
}

