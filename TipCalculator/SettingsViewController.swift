//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Xinghan Wang on 12/6/15.
//  Copyright © 2015 Xinghan Wang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipdefaultControl: UISegmentedControl!
   
    @IBOutlet weak var backgroundcolorControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        let tipdefaults = NSUserDefaults.standardUserDefaults()
        let tipdefaultValue = tipdefaults.integerForKey("tipPercentageIndex")
        tipdefaultControl.selectedSegmentIndex = tipdefaultValue
        
        let colordefaults = NSUserDefaults.standardUserDefaults()
        let colordefaultValue = colordefaults.integerForKey("Color")
        backgroundcolorControl.selectedSegmentIndex = colordefaultValue
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onValueChanged(sender: AnyObject) {
        let tipdefaults = NSUserDefaults.standardUserDefaults()
        tipdefaults.setInteger(tipdefaultControl.selectedSegmentIndex, forKey: "tipPercentageIndex")
        tipdefaults.synchronize()
        
    }
    
    @IBAction func onBackgroundChanged(sender: AnyObject) {
        let colordefaults = NSUserDefaults.standardUserDefaults()
        colordefaults.setInteger(backgroundcolorControl.selectedSegmentIndex, forKey: "Color")
        colordefaults.synchronize()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
