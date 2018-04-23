//
//  ViewController.swift
//  Lab-3
//
//  Created by Shweta Kothari on 4/21/18.
//  Copyright © 2018 Shweta Kothari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navview.layer.shadowOpacity = 1
        navview.layer.shadowRadius = 61
    }

    
    @IBAction func plusButton(_ sender: Any) {
        navview.isHidden = !navview.isHidden
    }
    
    @IBOutlet var navview: UIView!
}

