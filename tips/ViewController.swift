//
//  ViewController.swift
//  tips
//
//  Created by Jayne Vidheecharoen on 8/16/14.
//  Copyright (c) 2014 Jayne Vidheecharoen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet var tipLabel : UILabel!
    @IBOutlet var billField : UITextField!
    @IBOutlet var totalLabel : UILabel!
    @IBOutlet var tipControl : UISegmentedControl!
    @IBOutlet var twoLabel : UILabel!
    @IBOutlet var threeLabel : UILabel!
    @IBOutlet var billView : UIView!
    @IBOutlet var totalView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = " "
        totalLabel.text = " "
        
        // set the start position and alpha.
        self.totalView.alpha = 0
        self.billView.center = CGPoint(x: 160, y: 200);
        self.totalView.center = CGPoint(x: 160, y: 525);
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
        
        
        if billField.text.isEmpty {
            
        UIView.animateWithDuration(0.7, animations: {
            self.billView.center = CGPoint(x: 160, y: 200);
            self.totalView.center = CGPoint(x: 160, y: 525);
            self.totalView.alpha = 0
            })
        }
        else{
        UIView.animateWithDuration(0.7, animations: {
            self.billView.center = CGPoint(x: 160, y: 100);
            self.totalView.center = CGPoint(x: 160, y: 400);
            self.totalView.alpha = 1
            })
        }
    }
    @IBAction func onTap(sender : AnyObject) {
    view.endEditing(true)
    }
}

