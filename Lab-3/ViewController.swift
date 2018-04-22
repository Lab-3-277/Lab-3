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
        navview.isHidden = true
        
       
    }

    @IBAction func navButton(_ sender: Any) {
        navview.isHidden = true
        
        
        navview.bringSubview(toFront: navview)

    }
    
    @IBOutlet var navview: UIView!
    
    
}

