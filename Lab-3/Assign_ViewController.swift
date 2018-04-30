//
//  Assign_ViewController.swift
//  Lab-3
//
//  Created by Shweta Kothari on 4/28/18.
//  Copyright © 2018 Shweta Kothari. All rights reserved.
//

import UIKit
import NotificationBannerSwift


class Assign_ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    
    
    @IBOutlet var picker1: UIPickerView!
    @IBOutlet var picker2: UIPickerView!
    @IBOutlet var picker3: UIPickerView!
    @IBOutlet var picker4: UIPickerView!
    

    
    @IBOutlet var lab1: UILabel!
    @IBOutlet var lab2: UILabel!
    @IBOutlet var lab3: UILabel!
    @IBOutlet var lab4: UILabel!
    
    
    
    let nums = ["1","2","3","4","5","6","7","8","9"]
    var num1=0, num2=0, num3 = 0, num4 = 0
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return nums.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView == picker1
        {
            num1 = Int(nums[row])!
            lab1.text = nums[row]
        }
        if pickerView == picker2
        {
            num2 = Int(nums[row])!
            lab2.text = nums[row]
        }
        if pickerView == picker3
        {
            num3 = Int(nums[row])!
            lab3.text = nums[row]
        }
        if pickerView == picker4
        {
            num4 = Int(nums[row])!
            lab4.text = nums[row]
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return nums[row]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }
    
   
    
    
    
    @IBAction func Assign_Action(_ sender: Any) {
        
        
        if( num1 == 0 || num2 == 0 || num3 == 0 || num4 == 0 )
        {
            let banner = NotificationBanner(title: "Error !!", subtitle: "Pls select all the 4 numbers", style: .danger)
            banner.show()
        }
        else
        {
            performSegue(withIdentifier: "try_segue", sender: self )
        }
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var mainC = segue.destination as! ViewController
        
    
            mainC.assigned = true
            mainC.num1 = num1
            mainC.num2 = num2
            mainC.num3 = num3
            mainC.num4 = num4
        
        
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
