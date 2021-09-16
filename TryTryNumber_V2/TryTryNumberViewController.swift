//
//  TryTryNumberViewController.swift
//  TryTryNumber_V2
//
//  Created by fred fu on 2021/9/14.
//

import UIKit

class TryTryNumberViewController: UIViewController {
    
    var botNumber: Int = Int.random(in: 1...100)
    var picBotNumber: Int = Int.random(in: 1...15)
    var gameTimes: Int = 6
    var gmaeTimeSet: Int = 0
    
    let gmaeStareMsgStart: String = "猜猜看我的價值多少？"
    let gmaeStareMsgStartNone: String = "答案不能為空白，請輸數1~100之間的整數"
    
    
    @IBOutlet weak var msg1Label: UILabel!
    @IBOutlet weak var msg2Label: UILabel!

    @IBOutlet weak var gameTimesLabel: UILabel!
    @IBOutlet weak var gameDisplayLabel: UILabel!
    @IBOutlet weak var gameInputNumberTextField: UITextField!
    
    @IBOutlet weak var enterAswerButton: UIButton!
    @IBOutlet weak var reTryButton: UIButton!
    
    
    @IBOutlet weak var peopleImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enterAswerButton.setTitle("你來猜猜看", for: .normal)
        reTryButton.setTitle("重來一次", for: .normal)
        msg1Label.text = "你還有"
        msg2Label.text = "次機會"

        gameDisplayLabel.text = gmaeStareMsgStart
        gameTimesLabel.text = "\(gameTimes)"
        peopleImageView.image = UIImage(named: "\(picBotNumber).png")
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func sendAnwserButton(_ sender: Any) {
        
        let gameInputNumber = Int(gameInputNumberTextField.text!)
        let gameInputNumberText = gameInputNumber
        
        if let gameInputNumberText = gameInputNumberText {
            
            if gameTimes > gmaeTimeSet {
                
                if gameInputNumberText == botNumber {
                    
                    gameDisplayLabel.text = "恭喜！猜對了！我價值\(botNumber)萬元"
                    gameTimes = 0
                    
                    
                } else if gameInputNumberText > botNumber {
                    
                    gameDisplayLabel.text = "沒那麼貴啦"
                    gameTimes -= 1
                    gameInputNumberTextField.text = ""
                    gameTimesLabel.text = "\(gameTimes)"
                     
                } else if gameInputNumberText < botNumber {
                    
                    gameDisplayLabel.text = "沒那麼便宜"
                    gameTimes -= 1
                    gameInputNumberTextField.text = ""
                    gameTimesLabel.text = "\(gameTimes)"
                
            } else {
                gameTimes = 0
                gameDisplayLabel.text = "猜超過\( gmaeTimeSet )次遊戲結束"
                
            }
            
        } else {
            
            gameDisplayLabel.text = "猜超過\( gmaeTimeSet )次遊戲結束"
        }
            
        } else {
            gameDisplayLabel.text = "請輸入數字"
        }
        
    }
    
    @IBAction func reTryGameButton(_ sender: Any) {
        
        gameInputNumberTextField.text = ""
        gameTimes = 6
        gameDisplayLabel.text = "\(gmaeStareMsgStart)"
        
        picBotNumber = Int.random(in: 1...15)
        peopleImageView.image = UIImage(named: "\(picBotNumber).png")
        botNumber = Int.random(in: 1...100)
        
    }

}

