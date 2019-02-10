//
//  FirstViewController.swift
//  Shopping Helper
//
//  Created by Sean Lin on 11/1/14.
//  Copyright (c) 2014 Sean Lin. All rights reserved.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var storeWebView: UIWebView!
    @IBOutlet weak var storeSpinner: UIActivityIndicatorView!
    
    var webPage = "https://www.walmart.com"
    
    var backgroundMusicPlayer: AVAudioPlayer!
    
    var christmasMusic  = "christmas"
    
    var delta = CGPoint(x:12, y:4) //initialize the delta to move 12 pixels horizontally, 4 pixels vertically
    var snowRadius = CGFloat()
    var snowRadius2 = CGFloat()
    var timer = Timer()
    var timer2 = Timer()
    var translation = CGPoint(x:0.0, y:0.0) //specifies how many pixels the image will move
    var angle: CGFloat=0.0 //angle for rotation
    var angle2: CGFloat=0.3
    
    @IBOutlet weak var snowImage: UIImageView!
    @IBOutlet weak var snowImage2: UIImageView!
 
    
    @objc func moveImage() {
        let duration = 0.1
        UIView.beginAnimations("Snowflake", context: nil)
        UIView.animate(withDuration: duration, animations:{self.snowImage.transform=CGAffineTransform(rotationAngle: self.angle)
            self.snowImage.center = CGPoint(x:self.snowImage.center.x +
                self.delta.x, y:self.snowImage.center.y + self.delta.y)
        })
        
        UIView.commitAnimations()
        angle += 0.02
        //amount by which you increment the angle //if it's a full rotation reset the angle
        if angle > CGFloat(2*M_PI) {
            angle=0
        }
        if snowImage.center.x + translation.x > self.view.bounds.size.width-snowRadius || snowImage.center.x + translation.x < snowRadius{ delta.x = -delta.x
        }
        if snowImage.center.y + translation.y > self.view.bounds.size.height - snowRadius || snowImage.center.y + translation.y < snowRadius {
            delta.y = -delta.y
        }
    }
    @objc func moveImage2() {
        let duration2 = 0.1
        UIView.beginAnimations("Snowflake2", context: nil)
        UIView.animate(withDuration: duration2, animations:{self.snowImage2.transform=CGAffineTransform(rotationAngle: self.angle2)
            self.snowImage2.center = CGPoint(x:self.snowImage2.center.x +
                self.delta.x, y:self.snowImage2.center.y + self.delta.y)
        })
        
        UIView.commitAnimations()
        angle2 += 0.02
        //amount by which you increment the angle //if it's a full rotation reset the angle
        if angle2 > CGFloat(2*M_PI) {
            angle2=0
        }
        if snowImage2.center.x + translation.x > self.view.bounds.size.width-snowRadius2 || snowImage2.center.x + translation.x < snowRadius2{ delta.x = -delta.x
        }
        if snowImage2.center.y + translation.y > self.view.bounds.size.height - snowRadius2 || snowImage2.center.y + translation.y < snowRadius2 {
            delta.y = -delta.y
        }
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
        backgroundMusicPlayer.volume = 0.2
        backgroundMusicPlayer.numberOfLoops = 0
        backgroundMusicPlayer.prepareToPlay()
        backgroundMusicPlayer.play()
    }

    
    
    @IBAction func TargetBPressed(_ sender: UIButton) {
//    @IBAction func TargetBPressed(sender: UIButton) {
        webPage = "http://www.target.com"
        loadWebPage(urlString: webPage)
    }
    @IBAction func KingBPressed(_ sender: UIButton) {
        webPage = "https://www.kingsoopers.com"
        loadWebPage(urlString: webPage)
    }

    @IBAction func WalmartBPressed(_ sender: UIButton) {
    
//    @IBAction func WalmartBPressed(_ sender: UIButton) {
        webPage = "https://www.walmart.com"
        loadWebPage(urlString: webPage)
    }
    
    @IBAction func RakutenBPressed(_ sender: UIButton) {
        webPage = "https://www.rakuten.co.jp"
        loadWebPage(urlString: webPage)
    }
    func loadWebPage(urlString: String){
        //the string passed should be a properly formed url
        let url = URL(string:urlString)
        //creates a NSURL object with the string passed in
        let request = URLRequest(url:url!)
        storeWebView.loadRequest(request)
    }
    
    override func viewDidLoad() {
        storeWebView.delegate = self
        loadWebPage(urlString: webPage)
        snowRadius=snowImage.frame.size.width/2
        snowRadius2=snowImage2.frame.size.width/2
        timer = Timer.scheduledTimer(timeInterval: 0.1,
            target: self, selector: #selector(FirstViewController.moveImage), userInfo: nil, repeats: true)
        timer2 = Timer.scheduledTimer(timeInterval: 0.1,
            target: self, selector: #selector(FirstViewController.moveImage2), userInfo: nil, repeats: true)

        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        storeSpinner.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        storeSpinner.stopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        let christmasDice = Int(arc4random_uniform(5)) // generate 0~4
        
        playBackgroundMusic(filename: "\(christmasDice)"+christmasMusic+".mp3")
        NSLog("Now playing "+"\(christmasDice)"+christmasMusic+".mp3...")
    }
    override func viewDidDisappear(_ animated: Bool) {
        backgroundMusicPlayer.stop()
    }
    


}

