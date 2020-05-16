//
//  ViewController.swift
//  boiledEggTImer1
//
//  Created by Kazuki Harada on 2020/05/09.
//  Copyright © 2020 Harada Kazuki. All rights reserved.
//

import UIKit
import AudioToolbox

class ViewController: UIViewController {
    
    var timer = Timer()
    var count = Int()
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var timerFinishedLabel: UILabel!
    
    @IBOutlet weak var hardLabel: UILabel!
    @IBOutlet weak var littleHardLabel: UILabel!
    @IBOutlet weak var softBoiledLabel: UILabel!
    
    var labelArray:[UILabel] = []

    @IBOutlet weak var startButton1: UIButton!
    @IBOutlet weak var startButton2: UIButton!
    @IBOutlet weak var startButton3: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        count = 0
    }

    @IBAction func startBtn1(_ sender: Any) {
        
        startTimer()
        hardLabel.textColor = .orange
        startButton2.isEnabled = false
        startButton3.isEnabled = false
        
    }
    
    @IBAction func startBtn2(_ sender: Any) {
        
        startTimer2()
        littleHardLabel.textColor = .orange
        startButton1.isEnabled = false
        startButton3.isEnabled = false

    }
    
    @IBAction func startBtn3(_ sender: Any) {
        
        startTimer3()
        softBoiledLabel.textColor = .orange
        startButton2.isEnabled = false
        startButton1.isEnabled = false

    }
    
    @IBAction func stop(_ sender: Any) {
        
        timer.invalidate()
        
    }
    
    @IBAction func timerReset(_ sender: Any) {
        
        timer.invalidate()
        count = 0
        timerLabel.text = String(count)
        timerFinishedLabel.text = String("")
        startButton1.isEnabled = true
        startButton2.isEnabled = true
        startButton3.isEnabled = true
        labelArray = [hardLabel,littleHardLabel,softBoiledLabel]
        labelArray[0].textColor = .black
        labelArray[1].textColor = .black
        labelArray[2].textColor = .black
        
    }
    
    
    //    タイマーの機能（固め）
        func startTimer(){
            
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeUpdate), userInfo: nil, repeats: true)
            
        }
        
    //    タイマーが押されたとき（固め）
        @objc func timeUpdate(){
            
            if count < 720 {
                
                count += 1
                
            }
            
            timerLabel.text = String(count)
            
            if count >= 720 {
                
                vibrate()
                
                timerFinishedLabel.text = String("固めに出来上がりました！！")
                
            }
            
        }

    //    タイマーの機能（やや固め）
          func startTimer2(){
              
              timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeUpdate2), userInfo: nil, repeats: true)
              
          }
          
      //    タイマーが押されたとき（やや固め）
          @objc func timeUpdate2(){
              
              if count < 600 {
                  
                  count += 1
                  
              }
              
              timerLabel.text = String(count)
              
              if count >= 600 {
                  
                  vibrate()
                  
                  timerFinishedLabel.text = String("やや固めに出来上がりました！！")
                  
              }
              
          }

    //    タイマーの機能（半熟）
          func startTimer3(){
              
              timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeUpdate3), userInfo: nil, repeats: true)
              
          }
          
      //    タイマーが押されたとき（半熟）
          @objc func timeUpdate3(){
              
              if count < 420 {
                  
                  count += 1
                  
              }
              
              timerLabel.text = String(count)
              
              if count >= 420 {
                  
                  vibrate()
                  
                  timerFinishedLabel.text = String("半熟に出来上がりました！！")
                  
              }
              
          }

    
    
        func vibrate(){
            
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
            
        }
    
}


