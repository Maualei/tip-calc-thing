tip-calc-thing
==============

half assed top calculator thing in swift

//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Alison UmiaNOOOOOOOO on 11/29/14.
//  Copyright (c) 2014 Alison UmiaNO. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet var billTextField: UITextField!
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var tipControl: UISegmentedControl!
    @IBAction func onClearButton(sender: AnyObject) {
        
        
        billTextField.text = ""
        tipLabel.text = String(format: " $ %.2f%", 0.00)
        totalLabel.text = String(format: " $ %.2f%", 0.00)
        
        tipControl.selectedSegmentIndex = 1


    }

    let tipAmounts = [0.10, 0.15, 0.20]
    
    // 
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        // displays the right bar button (done)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem (barButtonSystemItem : UIBarButtonSystemItem.Done, target: self, action: "onDoneButton")
        
        return  true
        
    }
    
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        // removes the right bar item Button from the navigation item
        
        navigationItem.rightBarButtonItem = nil
        
        // update values when finish editing
        
        updateValues()
        
        return true
    }
    
    func onDoneButton()
    {
        view.endEditing(true)
        updateValues()
    }
    
    func updateValues()
    {
        // tip percent -- a double value
        // tipAmounts -- a static array
        // tipControl -- 3 segments  index 0 -- 10% = .10 index 1 -- 15% = .15 index 2 -- 20% = .20
        
        var tipPercentage = tipAmounts[tipControl.selectedSegmentIndex]
        
        // Swift variable holding an NSString
        var billString:NSString = billTextField.text
        
        // using NSString doubleValue to convert
        
        var bill =  billString.doubleValue
        
        var tip = bill * tipPercentage
        var total = bill + tip
        
        tipLabel.text = String(format: " $ %.2f%", tip)
        totalLabel.text = String(format: " $ %.2f%", total)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //set vc(view controller) to be the delegate of the text field
        self.billTextField.delegate = self
        
        totalLabel.text = String(format: " $ %.2f%", 0.00)
        
        
        
        tipControl.addTarget(self, action: "updateValues", forControlEvents: .ValueChanged)
        
        
        //default values set to .15
        tipControl.selectedSegmentIndex = 1
        
        
        
    }
    
    @IBAction func tapDone(sender: UITapGestureRecognizer) {
        
        onDoneButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

