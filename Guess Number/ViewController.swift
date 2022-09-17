//
//  ViewController.swift
//  Guess Number
//
//  Created by Ryan Lin on 2022/9/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var guessButttonShow: UIButton!
    
    @IBOutlet weak var successImageView: UIImageView!
    
    //把0到99存入變數answer
    var answer = Int.random(in: 0...99)
    //把5存入變數剩餘次數
    var remainingTime = 7
    //提示的最大值跟最小值會隨著所猜的數值而改變，所以也是變數
    var minimum = 0
    var maximum = 99
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
    //把停用guessButtton跟textField變成function
    fileprivate func disableUIKits() {
        guessButttonShow.isEnabled = false
        textField.isEnabled = false
    }
   
    @IBAction func guessButton(_ sender: Any) {
        //把textField輸入的數字存入guessNumber
        let guessNumber = textField.text!
        //把guessNumber的整數存入number
        let number = Int(guessNumber)
       
            if number != nil {
                
                if number == answer {
                    hintLabel.text = "Hooray !"
                    disableUIKits()
                    textField.isHidden = true
                    successImageView.isHidden = false
                    successImageView.image = UIImage.animatedImageNamed("3271c5474c264bbf9c1fea6a567dbdc5Hna4mId0iokAso2b-", duration: 2)
                }
                
                else if number != answer {
                    
                    textField.text = ""
                    remainingTime -= 1
                    timeLabel.text = "Remaining Times \(remainingTime)"
                    
                    if number! < answer {
                        hintLabel.text = "Too few for me..."
                        minimum = number!
                        textField.placeholder = "\(minimum)~\(maximum)"
                     
                    }
                    if number! > answer {
                        hintLabel.text = "Too many for me..."
                        maximum = number!
                        textField.placeholder = "\(minimum)~\(maximum)"
                     
                    }
                    if remainingTime < 1 {
                        textField.placeholder = "Game Over"
                        hintLabel.text = String("The right number is \(answer) ")
                        disableUIKits()
                    }
                 }
               }
            }
      
    @IBAction func replayButton(_ sender: Any) {
        //重置answer隨機0到99
        answer = Int.random(in: 0...99)
        textField.text = ""
        textField.placeholder = "0~99"
        //重置剩餘時次數為7
        remainingTime = 7
        timeLabel.text = "Remaining Times \(remainingTime)"
        hintLabel.text = "Press Cookie to Guess"
        //重置最大最小值
        maximum = 99
        minimum = 0
        guessButttonShow.isEnabled = true
        textField.isEnabled = true
        successImageView.isHidden = true
        textField.isHidden = false
    }
}

