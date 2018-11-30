//
//  ItemViewController.swift
//  Shopping Helper
//
//  Created by Sean Lin on 11/6/14.
//  Copyright (c) 2014 Sean Lin. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {

    @IBOutlet weak var itemTextfield: UITextField!
    
    var addItem = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField:UITextView)->Bool{
        textField.resignFirstResponder()
        return true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier=="donesegue"{
            if !itemTextfield.text!.isEmpty{
            addItem=itemTextfield.text!
            }
        }
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
