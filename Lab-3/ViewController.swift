//
//  ViewController.swift
//  Lab-3
//
//  Created by Shweta Kothari on 4/21/18.
//  Copyright © 2018 Shweta Kothari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        navview.isHidden = true
        resultText.text = ""
    }

    @IBAction func navButton(_ sender: Any) {
        navview.isHidden = true
        
        
        navview.bringSubview(toFront: navview)

    }
    
    @IBOutlet var navview: UIView!
    
    @IBAction func buttonFour(_ sender: UIButton) {
        let number = sender.titleLabel?.text
        resultText.text?.append("\(number as! String)")
    }
    
    @IBAction func buttonThree(_ sender: UIButton) {
        let number = sender.titleLabel?.text
        resultText.text?.append("\(number as! String)")
    }
    
    @IBAction func buttonTwo(_ sender: UIButton) {
        let number = sender.titleLabel?.text
        resultText.text?.append("\(number as! String)")    }
    
    @IBAction func buttonOne(_ sender: UIButton) {
        let number = sender.titleLabel?.text
        resultText.text?.append("\(number as! String)")
    }
    
    @IBAction func buttonAdd(_ sender: UIButton) {
        let op = sender.titleLabel?.text
        resultText.text?.append("\(op as! String)")
    }
    
    
    @IBAction func buttonSub(_ sender: UIButton) {
        let op = sender.titleLabel?.text
        resultText.text?.append("\(op as! String)")
    }
    
    
    @IBAction func buttonMul(_ sender: UIButton) {
        let op = sender.titleLabel?.text
        resultText.text?.append("\(op as! String)")
    }
    
    @IBAction func buttonDiv(_ sender: UIButton) {
        let op = sender.titleLabel?.text
        resultText.text?.append("\(op as! String)")
    }
    
    
    @IBAction func buttonLeftPara(_ sender: UIButton) {
        resultText.text = ""
    }
    
    @IBAction func buttonRightPara(_ sender: UIButton) {
        resultText.text = ""
    }
}

