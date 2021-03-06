//
//  GameOverScene.swift
//  SKLab1
//
//  Created by Lisa Steele on 9/25/17.
//  Copyright © 2017 lisahsteele. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {
    
    let replayButtonTexture = SKTexture(imageNamed: "ReplayButton")
    var replayButton : SKSpriteNode! = nil
    let leaderboardButtonTexture = SKTexture(imageNamed: "LeaderboardButton")
    var leaderboardButton : SKSpriteNode! = nil
    let leaderBoard_ID = "com.leaderboard.sklab1"
    let newHighScoreNode = SKLabelNode(fontNamed: "AvenirNext-DemiBold")
    let scoreNode = SKLabelNode(fontNamed: "AvenirNext-DemiBold")
    let highScoreNode = SKLabelNode(fontNamed: "AvenirNext-DemiBold")
    let drawScoreNode = SKLabelNode(fontNamed: "AvenirNext-DemiBold")
    let playerStatusLabel = SKLabelNode(fontNamed: "AvenirNext-DemiBold")
    let scoreKey = "SKLab_Highscore"
    var usernameKey = "DBUsername"
    var gameOverBackground : SKSpriteNode! = nil
    var playableRect: CGRect
    var deviceWidth = UIScreen.main.bounds.width
    var deviceHeight = UIScreen.main.bounds.height
    
    let replayButton2 = SKSpriteNode(imageNamed: "Replay2")
    
    override func sceneDidLoad() {
        
        if UIScreen.main.sizeType == .iphone4 {
            gameOverBackground = SKSpriteNode(imageNamed: "GameOverBackground4")
        } else if UIScreen.main.sizeType == .iphone5 {
            gameOverBackground = SKSpriteNode(imageNamed: "GameOverBackground5s")
        } else if UIScreen.main.sizeType == .iphone6 {
            gameOverBackground = SKSpriteNode(imageNamed: "GameOverBackground6")
        } else if UIScreen.main.sizeType == .iphonePlus {
            gameOverBackground = SKSpriteNode(imageNamed: "GameOverBackgroundPlus")
        } else if UIScreen.main.sizeType == .iphoneX {
            gameOverBackground = SKSpriteNode(imageNamed: "GameOverBackgroundX")
        }
        
        
        gameOverBackground.position = CGPoint(x: size.width/2, y: size.height/2)
        gameOverBackground.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        gameOverBackground.zPosition = -1
        addChild(gameOverBackground)
    
        replayButton2.position = CGPoint(x: size.width/2, y: size.height/2 - replayButton2.size.height/2)
        addChild(replayButton2)
        
        leaderboardButton = SKSpriteNode(texture: leaderboardButtonTexture)
        leaderboardButton.position = CGPoint(x: size.width/2, y: (size.height/2 - replayButton2.size.height) - leaderboardButton.size.height)
        addChild(leaderboardButton)
        
        self.showCurrentOrHighScore()
    }
    
    override init(size: CGSize) {
        let maxAspectRatio: CGFloat = deviceHeight / deviceWidth
        let playableWidth = size.height / maxAspectRatio
        let playableMargin = (size.width - playableWidth) / 2.0
        playableRect = CGRect(x: playableMargin, y: 0, width: playableWidth, height: size.height)
        super.init(size: size)
       
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            if replayButton2.contains(location) {
                let scene = GameScene(size: size)
                self.view?.presentScene(scene)
            } else if leaderboardButton.contains(location) {

                if UserDefaults.standard.object(forKey: usernameKey) != nil {
                    if GameScene.gameWonBoolean == true && GameScene.itsADraw == false {
                        let scoreSavedScene = ScoreSaved(size: self.size)
                        self.view?.presentScene(scoreSavedScene)
                    } else if GameScene.gameWonBoolean == false || GameScene.itsADraw == true {
                        let leaderboardScene = LeaderboardScene(size: self.size)
                        self.view?.presentScene(leaderboardScene)
                    }
                } else {
                    if GameScene.gameWonBoolean == false || GameScene.itsADraw == true {
                        let leaderboardScene = LeaderboardScene(size: self.size)
                        self.view?.presentScene(leaderboardScene)
                    } else if GameScene.gameWonBoolean == true {
                        let userRegistrationScene = UserRegistration(size: self.size)
                        self.view?.presentScene(userRegistrationScene)
                    }
                }

            }
        }
    }
    
    func showCurrentOrHighScore() {
        
        let defaults = UserDefaults.standard
        let highScore = defaults.integer(forKey: scoreKey)
       
        if GameScene.gameWonBoolean == false && GameScene.itsADraw == false {
            playerStatusLabel.text = "You Lost :("
            playerStatusLabel.fontSize = 40
            playerStatusLabel.fontColor = SKColor.darkGray
            playerStatusLabel.verticalAlignmentMode = .top
            playerStatusLabel.position = CGPoint(x: size.width/2, y: size.height/2 + 100)
            addChild(playerStatusLabel)
            
            scoreNode.text = "Current Score: \(GameScene.currentScore)"
            scoreNode.fontSize = 20
            scoreNode.fontColor = SKColor.darkGray
            scoreNode.verticalAlignmentMode = .top
            scoreNode.position = CGPoint(x: size.width/2, y: size.height/2 + 50)
            addChild(scoreNode)
            
            highScoreNode.text = "High Score: \(highScore)"
            highScoreNode.fontSize = 20
            highScoreNode.fontColor = SKColor.darkGray
            highScoreNode.verticalAlignmentMode = .top
            highScoreNode.position = CGPoint(x: size.width/2, y: size.height/2 + 25)
            addChild(highScoreNode)
            
        } else if GameScene.itsADraw == true && GameScene.gameWonBoolean == false {
            playerStatusLabel.text = "It's a draw!"
            playerStatusLabel.fontSize = 40
            playerStatusLabel.fontColor = SKColor.darkGray
            playerStatusLabel.verticalAlignmentMode = .top
            playerStatusLabel.position = CGPoint(x: size.width/2, y: size.height/2 + 100)
            addChild(playerStatusLabel)
            
            scoreNode.text = "Current Score: \(GameScene.currentScore)"
            scoreNode.fontSize = 20
            scoreNode.fontColor = SKColor.darkGray
            scoreNode.verticalAlignmentMode = .top
            scoreNode.position = CGPoint(x: size.width/2, y: size.height/2 + 50)
            addChild(scoreNode)
            
            highScoreNode.text = "High Score: \(highScore)"
            highScoreNode.fontSize = 20
            highScoreNode.fontColor = SKColor.darkGray
            highScoreNode.verticalAlignmentMode = .top
            highScoreNode.position = CGPoint(x: size.width/2, y: size.height/2 + 25)
            addChild(highScoreNode)

        } else if GameScene.gameWonBoolean == true && GameScene.itsADraw == false {
            playerStatusLabel.text = "You Won!"
            playerStatusLabel.fontSize = 40
            playerStatusLabel.fontColor = SKColor.darkGray
            playerStatusLabel.verticalAlignmentMode = .top
            playerStatusLabel.position = CGPoint(x: size.width/2, y: size.height/2 + 100)
            addChild(playerStatusLabel)
            
            newHighScoreNode.text = "New High Score: \(highScore)"
            newHighScoreNode.fontSize = 20
            newHighScoreNode.fontColor = SKColor.darkGray
            newHighScoreNode.verticalAlignmentMode = .top
            newHighScoreNode.position = CGPoint(x: size.width/2, y: size.height/2 + 50)
            addChild(newHighScoreNode)

        } 
    }
    
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
