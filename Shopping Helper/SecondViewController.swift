//
//  SecondViewController.swift
//  Shopping Helper
//
//  Created by Sean Lin on 11/1/14.
//  Copyright (c) 2014 Sean Lin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 //number of components
    }
    

    @IBOutlet weak var foodImage: UIImageView!
    @IBOutlet weak var foodPicker: UIPickerView!
    @IBOutlet weak var foodPurachaseDate: UITextField!
    @IBOutlet weak var displayText: UILabel!
    
    @IBOutlet weak var finalShow: UILabel!
    var purchaseText = ""
    var foodChoose = 0
    var foodString = "Broccoli"
    
    func formatADate()->String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let d = NSDate()
        let s = dateFormatter.string(from: d as Date)
        return s
    }

    
    let food = ["Broccoli","Spinach","Cabbage","Cilantro","Tomato","Carrot","Eggplant"]
    
    //Methods to implement the picker
    //Required for the UIPickerViewDataSource protocol

    
    //Required for the UIPickerViewDataSource protocol
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return food.count //returns number of rows of data
    }
    
    //Picker Delegate methods
    //Returns the title for a given row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return food[row] //returns the content of the row
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        foodChoose = row
        NSLog("You choose "+"\(row)"+" which is \(food[row]) foodChoose="+"\(foodChoose)")
        foodImage.image = UIImage(named: "\(food[row]).png")
    }
    @IBAction func fridgeBPressed(_ sender: UIButton) {

        displayText.text = "In a fridge"
        if(!purchaseText.isEmpty){
            var pMonth = ""
            var pDay = ""
            var pYear = ""
            pMonth = dateParse(purchaseDate: purchaseText).0
            pDay = dateParse(purchaseDate: purchaseText).1
            pYear = dateParse(purchaseDate: purchaseText).2
            let monthI = Int(pMonth)
            var dayI = Int(pDay)
            let yearI = Int(pYear)
            switch foodChoose{
                case 0 :
                    dayI! = dayI! + 10
                    foodString = "Broccoli"
                case 1 :
                    dayI! = dayI! + 5
                    foodString = "Spinach"
                case 2 :
                    dayI! = dayI! + 12
                    foodString = "Cabbage"
                case 3 :
                    dayI! =  dayI! + 8
                    foodString = "Cilantro"
                case 4 :
                    dayI! = dayI! + 15
                    foodString = "Tomato"
                case 5 :
                    dayI! = dayI! + 13
                    foodString = "Carrot"
                case 6 :
                    dayI! = dayI! + 11
                    foodString = "Eggplant"
                default :
                    dayI! = dayI!
            }
            let eMonth = updateDate(Month: monthI!, Day: dayI!, Year: yearI!).0
            let eDay = updateDate(Month: monthI!, Day: dayI!, Year: yearI!).1
            let eYear = updateDate(Month: monthI!, Day: dayI!, Year: yearI!).2
            
            var eShow = ""
            if(eMonth<10 && eDay > 9){
                eShow = "0"+String(eMonth)+"/"+String(eDay)+"/"+String(eYear)
            }
            else if (eMonth>9 && eDay<10){
                eShow = String(eMonth)+"/"+"0"+String(eDay)+"/"+String(eYear)
            }
            else if(eMonth<10 && eDay<10){
                eShow = "0"+String(eMonth)+"/"+"0"+String(eDay)+"/"+String(eYear)
            }
            else{
                eShow = String(eMonth)+"/"+String(eDay)+"/"+String(eYear)
            }
            finalShow.text = "expiration date is " + eShow

        }

    }
    @IBAction func AmbientBPressed(_ sender: UIButton) {
        displayText.text = "With ambient temperature"
        if(!purchaseText.isEmpty){
            var pMonth = ""
            var pDay = ""
            var pYear = ""
            pMonth = dateParse(purchaseDate: purchaseText).0
            pDay = dateParse(purchaseDate: purchaseText).1
            pYear = dateParse(purchaseDate: purchaseText).2
            let monthI = Int(pMonth)
            var dayI = Int(pDay)
            let yearI = Int(pYear)
            switch foodChoose{
            case 0 :
                dayI! = dayI! + 7
                foodString = "Broccoli"
            case 1 :
                dayI! = dayI! + 3
                foodString = "Spinach"
            case 2 :
                dayI! = dayI! + 5
                foodString = "Cabbage"
            case 3 :
                dayI! =  dayI! + 4
                foodString = "Cilantro"
            case 4 :
                dayI! = dayI! + 10
                foodString = "Tomato"
            case 5 :
                dayI! = dayI! + 11
                foodString = "Carrot"
            case 6 :
                dayI! = dayI! + 7
                foodString = "Eggplant"
            default :
                dayI! = dayI!
            }
            let eMonth = updateDate(Month: monthI!, Day: dayI!, Year: yearI!).0
            let eDay = updateDate(Month: monthI!, Day: dayI!, Year: yearI!).1
            let eYear = updateDate(Month: monthI!, Day: dayI!, Year: yearI!).2
            
            var eShow = ""
            if(eMonth<10 && eDay > 9){
                eShow = "0"+String(eMonth)+"/"+String(eDay)+"/"+String(eYear)
            }
            else if (eMonth>9 && eDay<10){
                eShow = String(eMonth)+"/"+"0"+String(eDay)+"/"+String(eYear)
            }
            else if(eMonth<10 && eDay<10){
                eShow = "0"+String(eMonth)+"/"+"0"+String(eDay)+"/"+String(eYear)
            }
            else{
                eShow = String(eMonth)+"/"+String(eDay)+"/"+String(eYear)
            }
            finalShow.text = "Expiration date is " + eShow
        }

    }
    
    func updateResult(){
        NSLog("in updateResult")
        purchaseText = foodPurachaseDate.text!
        if(!purchaseText.isEmpty){
            if(purchaseText.count==10){
                var pMonth = ""
                var pDay = ""
                var pYear = ""
                pMonth = dateParse(purchaseDate: purchaseText).0
                pDay = dateParse(purchaseDate: purchaseText).1
                pYear = dateParse(purchaseDate: purchaseText).2
                NSLog("Month="+pMonth)
                NSLog("Day="+pDay)
                NSLog("Year="+pYear)
                let monthI = Int(pMonth)
                let dayI = Int(pDay)
                let yearI = Int(pYear)
                let isCalendarCorrect = checkCalendar(Month: monthI!, Day: dayI!, Year: yearI!)
                if(isCalendarCorrect){
                    NSLog("yeah!!The date you typed is correct!!")
                }
                else{
                    let currentTime = formatADate()
                    let alert = UIAlertController(title: "Warning", message: "Wrong calendar format!!", preferredStyle: UIAlertControllerStyle.alert)
                    let cancelAction:UIAlertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
                    let okAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {action in
                        self.foodPurachaseDate.text=currentTime
                        self.updateResult()})
                    alert.addAction(cancelAction)
                    alert.addAction(okAction)
                    present(alert, animated: true, completion: nil)
                    
                }


            }
            else{
                let currentTime = formatADate()
                let alert = UIAlertController(title: "Warning", message: "Wrong calendar format!!", preferredStyle: UIAlertControllerStyle.alert)
                let cancelAction:UIAlertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
                let okAction:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {action in
                    self.foodPurachaseDate.text=currentTime
                    self.updateResult()})
                alert.addAction(cancelAction)
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)
            }
        }
        else{
            finalShow.text = ""
        }
    }
    
    func dateParse(purchaseDate :String)->(String,String,String){
        
        let mm = purchaseDate.substring(to: 2)
        let temp = purchaseDate.substring(to: 5)
        let dd = temp.substring(from: 3)
        let yyyy = purchaseDate.substring(from: 6)
//        let yyyy = (purchaseDate.substringFromIndex(purchaseDate.startIndex.advancedBy(6)))
        return (mm,dd,yyyy)
    }
    
    func checkCalendar(Month:Int,Day:Int,Year:Int)->Bool{
        if(Month>12||Month<1){
            return false
        }
        else if (Day < 0){
            return false
        }
        else {
            switch Month{
            case 1:
                if(Day>31){
                    return false
                }
            case 2:
                if(leapYearCheck(year: Year)){
                    NSLog(String(Year)+" is a leap year")
                    if (Day > 29){
                        return false
                    }
                    else{
                        return true
                    }
                }
                else{
                    if(Day > 28){
                        return false
                    }
                    else{
                        return true
                    }
                }
            case 3:
                if(Day>31){
                    return false
                }
                else {
                    return true
                }
            case 4:
                if(Day>30){
                    return false
                }
                else {
                    return true
                }
            case 5:
                if(Day>31){
                    return false
                }
                else {
                    return true
                }
            case 6:
                if(Day>30){
                    return false
                }
                else {
                    return true
                }
            case 7:
                if(Day>31){
                    return false
                }
                else {
                    return true
                }
            case 8:
                if(Day>31){
                    return false
                }
                else {
                    return true
                }
            case 9:
                if(Day>30){
                    return false
                }
                else {
                    return true
                }
            case 10:
                if(Day>31){
                    return false
                }
                else {
                    return true
                }
            case 11:
                if(Day>30){
                    return false
                }
                else {
                    return true
                }
            case 12:
                if(Day>31){
                    return false
                }
                else {
                    return true
                }
                
            default:
                return true
            }
        }
        return true
    }
    func leapYearCheck(year:Int)->Bool{
        if (((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0))){
            return true
        }
        else {
            return false
        }
    }
    func updateDate(Month:Int,Day:Int,Year:Int)->(Int,Int,Int){
        var m = Month
        var d = Day
        var y = Year
        switch m {
        case 1,3,5,7,8,10:
            if(d<32){
                return(m,d,y)
            }
            else{
                m = m + 1
                d = d - 31
                return(m,d,y)
            }
        case 2:
            if(leapYearCheck(year: y)){
                if(d<30){
                    return(m,d,y)
                }
                else{
                    m=m+1
                    d=d-29
                }
            }
        case 4,6,9,11:
            if(d<31){
                return(m,d,y)
            }
            else{
                m = m + 1
                d = d - 30
                return(m,d,y)
            }
        case 12:
            if(d<32){
                return(m,d,y)
            }
            else{
                m = 1
                d = d - 31
                y = y + 1
                return(m,d,y)
            }
        default :
            return(m,d,y)
        }
        return(m,d,y)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    func textFieldDidEndEditing(_ textField: UITextField) {
        NSLog("in EndEditing")
        updateResult()
    }

    
    override func viewDidLoad() {
        foodPurachaseDate.delegate = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

