//
//  ViewController.swift
//  ticTacToe_Dodson
//
//  Created by Daniel Dodson on 4/9/19.
//  Copyright © 2019 Daniel Dodson. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {
    
    
    
    
    //Variables
    
    var player = 1
    var gridNumber = [0,0,0,0,0,0,0,0,0]
    var winningBlocks = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var gameIsLive = true
    var tieGame = true
    @IBOutlet weak var playerLabel: UILabel!
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet var skView: SKView!
    
    
    
    //View did load
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        buttonDesign()
        //addGradient()
        pop()
        startNewGameButton()
        skView.backgroundColor = UIColor.black
        view.backgroundColor = UIColor.black
        
    }
    
    
    
    
    
    //add pop scene for viewdidload and when someone wins
    
    func pop() {
        let scene = KScene(size: CGSize(width: 1080, height: 1920))
        scene.scaleMode = .aspectFill
        skView = self.view as? SKView
        scene.zPosition = 1
        skView.presentScene(scene)
    }
    
    
    
    
    
    
    //Button Layout Design
    
    func buttonDesign() {
        
        for button in 0...8 {
            
            buttons[button].setImage(nil, for: UIControl.State.normal)
            buttons[button].imageEdgeInsets = UIEdgeInsets(top: 30,left: 30,bottom: 30,right: 30)
        }
        
    }
    
    
    
    
    //Grid buttons clicked
    
    @IBAction func buttonClick(_ sender: AnyObject) {
        
        // make sure grid # hasnt been clicked yet & game is live
        
        if gridNumber[sender.tag] == 0 && gameIsLive == true {
            
            gridNumber[sender.tag] = player
      
            //player 1 clicked
            
            if player == 1 {
                
                sender.setImage(UIImage(named: "whiteX"), for: UIControl.State.normal)
                player = 2
                playerLabel.text = "Player 2 is up!"
                
            }
                
            //player 2 clicked
                
            else {
                
                sender.setImage(UIImage(named: "whiteO"), for: UIControl.State.normal)
                player = 1
                playerLabel.text = "Player 1 is up!"
                
                }
            
            }
        
        //check to see which blocks have been selected and by who
        
            for blocks in winningBlocks {
                
                if gridNumber[blocks[0]] != 0 && gridNumber[blocks[0]] == gridNumber[blocks[1]] && gridNumber[blocks[1]] == gridNumber[blocks[2]] {
                    
                    
                    tieGame = false
                    
                    if gridNumber[blocks[0]] == 1 {
                        
                        print("player 1 won")
                        playerLabel.text = "Player 1 has won!"
                        pop()
                        gameIsLive = false
                        newGameButton.isHidden = false
                        
                       
                    }
                        
                    else {
                        
                        print("player 2 won")
                        playerLabel.text = "Player 2 has won!"
                        pop()
                        gameIsLive = false
                        newGameButton.isHidden = false
                       
                    }
                
                }
                
            }
        
        
                gameIsLive = false
                
                for i in gridNumber {
                    if i == 0 {
                        gameIsLive = true
                        break
                        
                    }
                }
                
                
                if gameIsLive == false && tieGame == true {
                        playerLabel.text = "It was a tie!"
                        newGameButton.isHidden = false
                        gameIsLive = false
                }
        
        }
    
    

    
    
    //Start new game button design
    
    func startNewGameButton() {
        newGameButton.layer.cornerRadius = 8
        newGameButton.isHidden = true
    }
    
    
    
    
    
    // Start new game
    
    @IBAction func newGameClicked(_ sender: Any) {
        player = 1
        gridNumber = [0,0,0,0,0,0,0,0,0]
        playerLabel.text = "Player 1 is up!"
        buttonDesign()
        startNewGameButton()
        gameIsLive = true
        tieGame = true
        
    }
    
}

