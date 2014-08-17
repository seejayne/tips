//
//  ViewController.swift
//  tips
//
//  Created by Jayne Vidheecharoen on 8/16/14.
//  Copyright (c) 2014 Jayne Vidheecharoen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet var tipLabel : UILabel
    @IBOutlet var billField : UITextField
    @IBOutlet var totalLabel : UILabel
    @IBOutlet var tipControl : UISegmentedControl
    @IBOutlet var twoLabel : UILabel
    @IBOutlet var threeLabel : UILabel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = " "
        totalLabel.text = " "
        self.tipLabel.alpha = 0
        self.totalLabel.alpha = 0
        self.twoLabel.alpha = 0
        self.threeLabel.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender : AnyObject) {
        var tipPercentages = [0.18,0.2,0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        var divtwo = total / 2
        var divthree = total / 3
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        twoLabel.text = "$\(divtwo)"
        threeLabel.text = "$\(divthree)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        twoLabel.text = String(format: "$%.2f", divtwo)
        threeLabel.text = String(format: "$%.2f", divthree)
        
        // Optionally initialize the property to a desired starting value
        UIView.animateWithDuration(0.9, animations: {
            // This causes first view to fade in and second view to fade out
            self.tipLabel.alpha = 1
            self.totalLabel.alpha = 1
            self.twoLabel.alpha = 1
            self.threeLabel.alpha = 1
        
            })
    
    }
    @IBAction func onTap(sender : AnyObject) {
    view.endEditing(true)
    }
}

