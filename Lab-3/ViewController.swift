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
    var num1 = 0
    var num2 = 0
    var num3 = 0
    var num4 = 0
    
    // timer label from UI
    @IBOutlet var timer_lable: UILabel!
    @IBOutlet weak var resultText: UILabel!
    @IBOutlet var num4_out: UIButton!
    @IBOutlet var num3_out: UIButton!
    @IBOutlet var num2_out: UIButton!
    @IBOutlet var num1_out: UIButton!
   
    @IBOutlet var succeded_tex: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        resultText.text = ""
       
        //call this method to start timer
        runTimer()
        generateRandomNumbers();
        
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
            //resultText.text = "24"
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
    
    func getSolution(a:Int,b:Int,c:Int,d:Int)->String
    {
        var n:[Int] = [a,b,c,d]
        var c:[Character] = ["+","-","*","/"]
        for w in 0...3{
            for x in 0...3{
                if(x==w){
                    continue;
                }
                for y in 0...3{
                    if(y==x || y==w)
                    {
                        continue;
                    }
                    for z in 0...3{
                        if(z==w||z==x||z==y)
                        {
                            continue;
                        }
                        for i in 0...3{
                            for j in 0...3{
                                for k in 0...3{
                                    var res:String = eval(e:n[w],f:n[x],g:n[y],h:n[z],x:c[i],y:c[j],z:c[k])
                                    if(!res.isEmpty)
                                    {
                                        return res
                                    }
                                }
                            }
                        }
                        
                    }
                }
                
            }
        }
        return ""
    }
    
    
    func eval(e:Int,f:Int,g:Int,h:Int,x:Character,y:Character,z:Character)->String
    {
        do{
        var a = Double(e)
        var b = Double(f)
        var c = Double(g)
        var d = Double(h)
    
        if (bingo(x:evalu(a:evalu(a:evalu(a:a,x:x,b:b),x:y,b:c),x:z,b:d))) {
            return "((\(e)\(x)\(f))\(y)\(g))\(z)\(h)";
        }
        if (bingo(x:evalu(a:evalu(a:a, x:x, b:evalu(a:b, x:y, b:c)), x:z, b:d))) {
            return "(\(e)\(x)(\(f)\(y)\(g)))\(z)\(h)";
        }
        if (bingo(x:evalu(a:a, x:x, b:evalu(a:evalu(a:b, x:y, b:c), x:z, b:d)))) {
            return "\(e)\(x)((\(f)\(y)\(g))\(z)\(h))";
        }
        if (bingo(x:evalu(a:a, x:x, b:evalu(a:b, x:y, b:evalu(a:c, x:z, b:d))))) {
            return "\(e)\(x)(\(f)\(y)(\(g)\(z)\(h)))";
        }
        if (bingo(x:evalu(a:evalu(a:a, x:x, b:b), x:y, b:evalu(a:c, x:z, b:d)))) {
            return "((\(e)\(x)\(f))\(y)(\(g)\(z)\(h)))";
        }
        }catch{
                
            }
            
        return ""
    }
    
    func bingo(x:Double)->Bool {
        let N:Double = 24
        return abs(x - N) < 0.0000001
    }
    
    
    func evalu(a:Double,x:Character, b:Double)->Double{
        switch (x) {
        case "+":
            return a + b
        case "-":
            return a - b
        case "*":
            return a * b
        default:
            return a / b
        }
    }
    
    func generateRandomNumbers()
    {
        var rand1:UInt32 = 0
        var rand2:UInt32 = 0
        var rand3:UInt32 = 0
        var rand4:UInt32 = 0
        repeat {
            rand1 = arc4random_uniform(10)+1
            num1 = Int(rand1)
            repeat{
            rand2 = arc4random_uniform(10)+1
            }while rand2 == rand1
            num2 = Int(rand2)
            repeat{
            rand3 = arc4random_uniform(10)+1
            }while (rand3 == rand1) || (rand3 == rand2)
            num3 = Int(rand3)
            repeat{
            rand4 = arc4random_uniform(10)+1
            }while (rand4 == rand1) || (rand4 == rand2) || (rand4 == rand3)
            num4 = Int(rand4)
        }while getSolution(a: num1, b: num2, c: num3, d: num4) == ""
        num1_out.setTitle("\(num1)", for: .normal)
        num2_out.setTitle("\(num2)", for: .normal)
        num3_out.setTitle("\(num3)", for: .normal)
        num4_out.setTitle("\(num4)", for: .normal)
    }
}


