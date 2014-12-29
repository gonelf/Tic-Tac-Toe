//
//  ViewController.swift
//  tic tac toe
//
//  Created by Gonçalo Henriques on 20/12/14.
//  Copyright (c) 2014 Mobigeek Studios. All rights reserved.
//

let NOUGHT = 1
let CROSS = 2

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var winnerLabel: UILabel!
    var goNumber = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombinations = [
        // horizontals
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        // verticals
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        // diagonals
        [0, 4, 8], [2, 4, 6]]
    
    var winner = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        var cross = UIImage(named: "cross.png")
        var nought = UIImage(named: "nought.png")
        var image = UIImage()
        
        if (gameState[sender.tag] == 0 && winner == 0) {
        
            if (goNumber%2 == 0) {
                image = cross!
                gameState[sender.tag] = CROSS
            }
            else {
                image = nought!
                gameState[sender.tag] = NOUGHT
            }
            
            for combination in winningCombinations {
                if  (gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] && gameState[combination[0]] != 0) {
                    
                    winner = gameState[combination[0]]
                    
                }
                
                if  winner != 0 {
                    
                    var win = ""
                    
                    if winner == CROSS {
                        win = "Crosses"
                    }
                    else {
                        win = "Noughts"
                    }
                    
                    winnerLabel.text = win + " won the game"
                }
            }
            
            goNumber++
            
            sender.setImage(image, forState: .Normal)
            
            
        }
    }
    
    @IBAction func restartGame(sender: AnyObject) {
        winner = 0;
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        goNumber = 1
        winnerLabel.text = ""
        
        for var i = 0; i < 9; i++ {
            var bt : UIButton = view.viewWithTag(i) as UIButton
            bt.setImage(nil, forState: .Normal)
        }
    }

}

