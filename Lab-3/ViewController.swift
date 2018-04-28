//
//  ViewController.swift
//  Lab-3
//
//  Created by Shweta Kothari on 4/21/18.
//  Copyright © 2018 Shweta Kothari. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // variables for timer
    var seconds = 0
    var timer = Timer()
    
    // timer label from UI
    @IBOutlet var timer_lable: UILabel!
    @IBOutlet weak var resultText: UILabel!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navview.isHidden = true
        resultText.text = ""
        
        //call this method to start timer
        runTimer()
    }
    
    
    
    
    // action maethods for sidebar buttons
    @IBAction func Assign(_ sender: Any) {
        restart_timer()
    }
    
    @IBAction func show_me_button(_ sender: Any) {
        restart_timer()
    }
   
    // functions for timer
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(ViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    @objc func updateTimer() {
        var min = Int(seconds) / 60 % 60
        var sec = Int(seconds) % 60
        
        timer_lable.text = String(min) + ":" + String(seconds)
        seconds += 1 
    }
    
    func restart_timer() {
        seconds = 0
    }
    

    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func navPlus(_ sender: Any) {
        navview.isHidden = !navview.isHidden
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
        let op = sender.titleLabel?.text
        resultText.text?.append("\(op as! String)")
    }
    
    @IBAction func buttonRightPara(_ sender: UIButton) {
        let op = sender.titleLabel?.text
        resultText.text?.append("\(op as! String)")
    }
    
    @IBAction func buttonDone(_ sender: UIButton) {
        restart_timer()
        
        var numericExpression = resultText.text as! String
        let expr = NSExpression(format: numericExpression)
        if let result = expr.expressionValue(with: nil, context: nil) as? Double {
            
        }
    }
    
}

