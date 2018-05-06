//
//  ViewController.swift
//  Lab-3
//
//  Created by Shweta Kothari on 4/21/18.
//  Copyright © 2018 Shweta Kothari. All rights reserved.
//

import UIKit
import NotificationBannerSwift

var seconds = 0
var skip_count = 0
var attempt_count = 1
var succeeded_count = 0

var check_back_pressed = false
var clear_pressed = false


class ViewController: UIViewController {
    
    // variables for timer
    
    var timer = Timer()
    var num1 = 0
    var num2 = 0
    var num3 = 0
    var num4 = 0
    var assigned = false
   
    
    // timer label from UI
    @IBOutlet var timer_lable: UILabel!
    @IBOutlet weak var resultText: UILabel!
    @IBOutlet var num4_out: UIButton!
    @IBOutlet var num3_out: UIButton!
    @IBOutlet var num2_out: UIButton!
    @IBOutlet var num1_out: UIButton!
   
    @IBOutlet var succeded_tex: UILabel!
    
    @IBOutlet weak var skipped: UILabel!
    @IBOutlet weak var attempt: UILabel!
    
    @IBOutlet weak var done_button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        resultText.text = ""
        Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.checkLabelChange), userInfo: nil, repeats: true)
        //call this method to start timer
        attempt.text = String(attempt_count)
        
        runTimer()
        
        skipped.text = String(skip_count)
        attempt.text = String(attempt_count)
        succeded_tex.text = String(succeeded_count)
        
        
        
        if( assigned == true)
        {
            
            if( !(resultText.text?.isEmpty)! ||  check_back_pressed  || clear_pressed )
            {
                skip_count =  skip_count + 1
                skipped.text = String( skip_count )
            }
            
            
            num1_out.setTitle("\(num1)", for: .normal)
            num2_out.setTitle("\(num2)", for: .normal)
            num3_out.setTitle("\(num3)", for: .normal)
            num4_out.setTitle("\(num4)", for: .normal)
            
            assigned = false
        }
        else
        {
           
            generateRandomNumbers();
        }
        
        
    }
    
    @objc func checkLabelChange()
    {
        if(resultText.text?.isEmpty)!
        {
            done_button.isEnabled = false
            done_button.backgroundColor = UIColor.lightGray
        }else
        {
            if(!done_button.isEnabled)
            {
              done_button.isEnabled = true
                done_button.backgroundColor = UIColor.white
            }
        }
    }
    
    // action maethods for sidebar buttons
    @IBAction func Assign(_ sender: Any) {
        skipped.text =  String( Int(skipped.text!)! + 1 )
    }
    
    /*@IBAction func show_me_button(_ sender: Any) {
        restart_timer()
    }*/
   
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
        var para:Bool = false;
        var numericExpression = resultText.text as! String
        let characters = Array(numericExpression)
        if (numericExpression.contains("(") || numericExpression.contains(")"))
        {
            para = true;
        }
        if(!para || isBalanced(sequence: characters))
        {
        let expr = NSExpression(format: numericExpression)
        let res = expr.expressionValue(with: nil, context: nil) as! Double
        let soultion = bingo(x:res)
        
        if (soultion)
        {
            succeeded_count += 1
            succeded_tex.text = String(succeeded_count)
            let banner = NotificationBanner(title: "Correct !!", subtitle: "", style: .success)
            banner.show()
            
            //Dialog
            var o = "Binggo!!! " + numericExpression + "=24"
            let alert = UIAlertController(title: o, message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Next Puzzle", style: .cancel, handler: nil))
            
            self.present(alert, animated: true)
            generateNewPuzzle()
        }
        else{
            
            let banner = NotificationBanner(title: "Incorrect. Please try again!", subtitle: "", style: .danger)
            banner.show()
            attempt_count += 1
            attempt.text = String(attempt_count)
        }
        }
        else{
            let banner = NotificationBanner(title: "Paranthesis mismatch. Please try again!", subtitle: "", style: .danger)
            banner.show()
            attempt_count += 1
            attempt.text = String(attempt_count)
        }
        
        
    }
    
    func isBalanced(sequence: [Character]) -> Bool {
        var stack = [Character]()
        for bracket  in sequence {
            switch bracket {
            case "(":
                stack.append(bracket)
            case  ")":
                if stack.isEmpty || (bracket == ")" && stack.last != "(")  {
                    return false
                }
                stack.removeLast()
            default:
                let y = 0//fatalError("unknown bracket found")
            }
        }
        return stack.isEmpty
    }
    
    
   
    @IBAction func Back_Button(_ sender: Any) {
        
        check_back_pressed = true
        
        
        if( !(resultText.text?.isEmpty)! )
        {
            
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
    
    
    
    @IBAction func show_me(_ sender: UIBarButtonItem) {
        let n1:Int! = Int(num1_out.titleLabel?.text as! String)
        
        let n2:Int! = Int(num2_out.titleLabel?.text as! String)
        
        let n3:Int! = Int(num3_out.titleLabel?.text as! String)
        
        let n4:Int! = Int(num4_out.titleLabel?.text as! String)
        
        let solution = getSolution(a:n1,b:n2,c:n3,d:n4)
        
        if(!solution.isEmpty){
            
            /*let banner = NotificationBanner(title: "Solution: ", subtitle: "\(solution)", style: .success)
            banner.show()*/
            let alert = UIAlertController(title: "solution: \(solution)", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
            
        else{
            let alert = UIAlertController(title: "Sorry, there are actually no solutions", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            
        }
        skip_count += 1
        skipped.text = String(skip_count)
        generateNewPuzzle()
        
    }
    
    @IBAction func Clear(_ sender: Any) {
        resultText.text = ""
        
        clear_pressed = true
        
        
        
        if(!num1_out.isEnabled)
        {
            num1_out.isEnabled = true
            num1_out.backgroundColor = #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
        }
        if(!num2_out.isEnabled)
        {
            num2_out.isEnabled = true
            num2_out.backgroundColor = #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
        }
        if(!num3_out.isEnabled)
        {
            num3_out.isEnabled = true
            num3_out.backgroundColor = #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
        }
        if(!num4_out.isEnabled)
        {
            num4_out.isEnabled = true
            num4_out.backgroundColor = #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
        }
        
    }
    
    
    
    @IBAction func skip_button(_ sender: Any) {
        skip_count += 1
        skipped.text = String(skip_count)
        generateNewPuzzle()
    }
    
    
    //Generates New puzzle: increase attempt count: restart timer
    func generateNewPuzzle()
        
    {
        
        resultText.text = ""
        
        
        
        attempt_count = 1
        
        attempt.text = String(attempt_count)
        if(!num1_out.isEnabled)
        {
            num1_out.isEnabled = true
            num1_out.backgroundColor = #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
        }
        if(!num2_out.isEnabled)
        {
            num2_out.isEnabled = true
            num2_out.backgroundColor = #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
        }
        if(!num3_out.isEnabled)
        {
            num3_out.isEnabled = true
            num3_out.backgroundColor = #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
        }
        if(!num4_out.isEnabled)
        {
            num4_out.isEnabled = true
            num4_out.backgroundColor = #colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1)
        }
        
        generateRandomNumbers()
        
        restart_timer()
        
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
            rand1 = arc4random_uniform(9)+1
            num1 = Int(rand1)
            repeat{
            rand2 = arc4random_uniform(9)+1
            }while rand2 == rand1
            num2 = Int(rand2)
            repeat{
            rand3 = arc4random_uniform(9)+1
            }while (rand3 == rand1) || (rand3 == rand2)
            num3 = Int(rand3)
            repeat{
            rand4 = arc4random_uniform(9)+1
            }while (rand4 == rand1) || (rand4 == rand2) || (rand4 == rand3)
            num4 = Int(rand4)
        }while getSolution(a: num1, b: num2, c: num3, d: num4) == ""
        num1_out.setTitle("\(num1)", for: .normal)
        num2_out.setTitle("\(num2)", for: .normal)
        num3_out.setTitle("\(num3)", for: .normal)
        num4_out.setTitle("\(num4)", for: .normal)
    }
}


