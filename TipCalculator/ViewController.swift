//
//  ViewController.swift
//  TipCalculator
//
//  Created by Xinghan Wang on 12/6/15.
//  Copyright © 2015 Xinghan Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let tipdefaults = NSUserDefaults.standardUserDefaults()
        let intValue = tipdefaults.integerForKey("tipPercentageIndex")
        tipControl.selectedSegmentIndex = intValue
        
        let colordefaults = NSUserDefaults.standardUserDefaults()
        let Color = colordefaults.integerForKey("Color")
        if Color == 0 {
            view.backgroundColor = UIColor.orangeColor()
        }
        else {
            self.view.backgroundColor = UIColor.greenColor()
        }
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChanged(sender: AnyObject) {
        let tipPercentages = [0.15,0.2,0.25]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
}

