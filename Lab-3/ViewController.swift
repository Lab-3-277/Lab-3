//
//  ViewController.swift
//  Lab-3
//
//  Created by Shweta Kothari on 4/21/18.
//  Copyright © 2018 Shweta Kothari. All rights reserved.
//

import UIKit
import NotificationBannerSwift


class ViewController: UIViewController {
    
    // variables for timer
    var seconds = 0
    var timer = Timer()
    
    // timer label from UI
    @IBOutlet var timer_lable: UILabel!
    @IBOutlet weak var resultText: UILabel!
   
    @IBOutlet var succeded_tex: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
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
        
        timer_lable.text = String(min) + ":" + String(sec)
        seconds += 1 
    }
    
    func restart_timer() {
        seconds = 0
    }
    

    
    
    
    
    
    
    
    
    
    
    
    
   
    
    @IBAction func buttonFour(_ sender: UIButton) {
        let number = sender.titleLabel?.text
        resultText.text?.append("\(number as! String)")
        sender.isEnabled = false
        sender.backgroundColor = #colorLiteral(red: 0.218662435, green: 0, blue: 0.3628733235, alpha: 1)
    }
    
    @IBAction func buttonThree(_ sender: UIButton) {
        let number = sender.titleLabel?.text
        resultText.text?.append("\(number as! String)")
        sender.isEnabled = false
         sender.backgroundColor = #colorLiteral(red: 0.218662435, green: 0, blue: 0.3628733235, alpha: 1)
    }
    
    @IBAction func buttonTwo(_ sender: UIButton) {
        let number = sender.titleLabel?.text
        resultText.text?.append("\(number as! String)")
        sender.isEnabled = false
          sender.backgroundColor = #colorLiteral(red: 0.218662435, green: 0, blue: 0.3628733235, alpha: 1)
    }
    
    @IBAction func buttonOne(_ sender: UIButton) {
        let number = sender.titleLabel?.text
        resultText.text?.append("\(number as! String)")
        sender.isEnabled = false
         sender.backgroundColor = #colorLiteral(red: 0.218662435, green: 0, blue: 0.3628733235, alpha: 1)
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
    
    
    @IBAction func Done_button(_ sender: Any) {
        let N:Double = 24
        let P:Double = 0.0000001
        var numericExpression = resultText.text as! String
        let expr = NSExpression(format: numericExpression)
        let res = expr.expressionValue(with: nil, context: nil) as! Double
        if (abs(res - N) < P)
        {
            resultText.text = "24"
            let banner = NotificationBanner(title: "Correct !!", subtitle: "", style: .success)
            banner.show()
            
            //Dialog
            var o = "Binggo!!! " + numericExpression + "=24"
            let alert = UIAlertController(title: o, message: "", preferredStyle: .alert)
            
            
            alert.addAction(UIAlertAction(title: "Next Puzzle", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
        }
        else{
            let banner = NotificationBanner(title: "Incorrect. Please try again!", subtitle: "", style: .danger)
            banner.show()
        }
        
        

    }
    
    
    @IBOutlet var num4_out: UIButton!
    @IBOutlet var num3_out: UIButton!
    @IBOutlet var num2_out: UIButton!
    @IBOutlet var num1_out: UIButton!
    @IBAction func Back_Button(_ sender: Any) {
        // write code to delete one from result text box
        var numericExpression = resultText.text as! String
       
        
        if( num1_out.titleLabel?.text ==  String(numericExpression.last!)   )
        {
            num1_out.isEnabled = true
            num1_out.backgroundColor = #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
        }
        if( num2_out.titleLabel?.text ==  String(numericExpression.last!)   )
        {
            num2_out.isEnabled = true
            num2_out.backgroundColor = #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
        }
        if( num3_out.titleLabel?.text ==  String(numericExpression.last!)   )
        {
            num3_out.isEnabled = true
            num3_out.backgroundColor = #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
        }
        if( num4_out.titleLabel?.text ==  String(numericExpression.last!)   )
        {
            num4_out.isEnabled = true
            num4_out.backgroundColor = #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
        }
        
        resultText.text = String(numericExpression.dropLast())
    }
}

