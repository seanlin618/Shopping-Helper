//
//  CalculatorViewController.swift
//  Shopping Helper
//
//  Created by Sean Lin on 12/6/14.
//  Copyright (c) 2014 Sean Lin. All rights reserved.
//

import UIKit
import AVFoundation

class CalculatorViewController: UIViewController {
    
    var isTypingNumber = false
    var firstNumber = 0.0
    var secondNumber = 0.0
    var operation = ""
    var vocalLan = "0"
    var soundSwitch = 1
    var pointSw = 0
    
    var backgroundMusicPlayer: AVAudioPlayer!
    
    
    @IBAction func voiceOn(sender: AnyObject) {
        soundSwitch = 1
    }
    @IBAction func voiceOff(sender: AnyObject) {
        soundSwitch = 0
    }
    func playBackgroundMusic(filename: String) {
        let url = Bundle.main.url(
            forResource: filename, withExtension: nil)
        if (url == nil) {
            print("Could not find file: \(filename)")
            return
        }
        
        var error: NSError? = nil
        do {
            backgroundMusicPlayer =
                try AVAudioPlayer(contentsOf: url!)
        } catch let error1 as NSError {
            error = error1
            backgroundMusicPlayer = nil
        }
        if backgroundMusicPlayer == nil {
            print("Could not create audio player: \(error!)")
            return
        }
        
        backgroundMusicPlayer.numberOfLoops = 0
        backgroundMusicPlayer.prepareToPlay()
        backgroundMusicPlayer.play()
    }

    
    @IBOutlet weak var calculatorDisplay: UILabel!
    @IBOutlet weak var languageControl: UISegmentedControl!
    @IBAction func languageChange(sender: UISegmentedControl) {
        if languageControl.selectedSegmentIndex == 0 {
            vocalLan = "0"
        }
        else if languageControl.selectedSegmentIndex == 1{
            vocalLan = "1"
        }
        else if languageControl.selectedSegmentIndex == 2{
            vocalLan = "2"
        }
    }
    @IBAction func numberTapped(sender: AnyObject) {
        let number:String = sender.currentTitle ?? ""
        
        playMusic(button: number,onOff: soundSwitch)
        
        if isTypingNumber {
            if number=="."{
                if(pointSw == 1){
                    NSLog("ininin")
                }
                else{
                    pointSw = 1
                    NSLog("ininin!!!")
                    calculatorDisplay.text = calculatorDisplay.text! + number
                }
            }
            else{
                calculatorDisplay.text = calculatorDisplay.text! + number
            }
        } else {
            
            if number == "0"{
            }
            else{
                isTypingNumber = true
                if number=="." {
                    pointSw = 1
                    calculatorDisplay.text = "0" + number
                }
                else{
                    calculatorDisplay.text = number
                }
            }
        }
        
    }
    @IBAction func calculationTapped(sender: AnyObject) {
        
        isTypingNumber = false
        firstNumber = NSString(string:calculatorDisplay.text!).doubleValue
        NSLog("firstNumber = \(firstNumber)")
        operation = sender.currentTitle!!
        
        playMusic(button: operation, onOff: soundSwitch)


        
        
        NSLog("Operation = \(operation)")
    }
    @IBAction func equalsTapped(sender: AnyObject) {
        var result = 0.0
        isTypingNumber = false
        let button = sender.currentTitle
        playMusic(button: button!!, onOff: soundSwitch)
        secondNumber = NSString(string:calculatorDisplay.text!).doubleValue
        NSLog("secondNumber = \(secondNumber)")
        NSLog("Operation = \(operation)")
        
        if operation == "+" {
            result = firstNumber + secondNumber
        } else if operation == "-" {
            result = firstNumber - secondNumber
        }else if operation == "x" {
            result = firstNumber * secondNumber
        }else if operation == "/" {
            result = firstNumber / secondNumber
        }

        
        calculatorDisplay.text = "\(result)"
    }
    @IBAction func clearAll(sender: AnyObject) {
        
        let button = sender.currentTitle
        
        playMusic(button: button!!, onOff: soundSwitch)

        isTypingNumber = false
        firstNumber = 0.0
        secondNumber = 0.0
        operation = ""
        calculatorDisplay.text = "0.0"
        pointSw = 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func playMusic(button:String,onOff:Int){
        
        if onOff == 1 {
            if button == "1" {
                playBackgroundMusic(filename: vocalLan+"one.mp3")
            }
            else if button == "2"{
                playBackgroundMusic(filename: vocalLan+"two.mp3")
            }
            else if button == "3"{
                playBackgroundMusic(filename: vocalLan+"three.mp3")
            }
            else if button == "4"{
                playBackgroundMusic(filename: vocalLan+"four.mp3")
            }
            else if button == "5"{
                playBackgroundMusic(filename: vocalLan+"five.mp3")
            }
            else if button == "6"{
                playBackgroundMusic(filename: vocalLan+"six.mp3")
            }
            else if button == "7"{
                playBackgroundMusic(filename: vocalLan+"seven.mp3")
            }
            else if button == "8"{
                playBackgroundMusic(filename: vocalLan+"eight.mp3")
            }
            else if button == "9"{
                playBackgroundMusic(filename: vocalLan+"nine.mp3")
            }
            else if button == "0"{
                playBackgroundMusic(filename: vocalLan+"zero.mp3")
            }
            else if button == "="{
                playBackgroundMusic(filename: vocalLan+"equals.mp3")
            }
            else if button == "+" {
                playBackgroundMusic(filename: vocalLan+"plus.mp3")
            } else if button == "-" {
                playBackgroundMusic(filename: vocalLan+"minus.mp3")
            }else if button == "x" {
                playBackgroundMusic(filename: vocalLan+"times.mp3")
            }else if button == "/" {
                playBackgroundMusic(filename: vocalLan+"devidedBy.mp3")
            }
            else if button == "AC" {
                playBackgroundMusic(filename: vocalLan+"ac.mp3")
            }
            else if button == "." {
                playBackgroundMusic(filename: vocalLan+"point.mp3")
            }
        }
        else if onOff == 0 {
            
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
