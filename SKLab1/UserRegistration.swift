//
//  UserRegistration.swift
//  SKLab1
//
//  Created by Lisa Steele on 12/12/17.
//  Copyright © 2017 lisahsteele. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit
import Firebase
import FirebaseDatabase

class UserRegistration: SKScene, UITextFieldDelegate {
    
    let background = SKSpriteNode(imageNamed: "GameOverBackground")
    let usernameSceneImage = SKSpriteNode(imageNamed: "UsernameSceneImage")
    let createUsernameLabel = SKSpriteNode(imageNamed: "CreateUsernameLabel")
    let leaderboardGreeting = SKSpriteNode(imageNamed: "LeaderboardComingSoon")
    let backToGameButton = SKSpriteNode(imageNamed: "BackToGameButton")
    //var usernameTextField: UITextField!
    var fireUserID = String()
    var username = String()
    let scoreKey = "SKLab_Highscore"
    
    let submitButton = SKSpriteNode(imageNamed: "SubmitButton")
    var playableRect: CGRect
    var deviceWidth = UIScreen.main.bounds.width
    var deviceHeight = UIScreen.main.bounds.height
    
    
    
    override func sceneDidLoad() {
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.zPosition = -1
        addChild(background)
        
        usernameSceneImage.position = CGPoint(x: size.width / 2, y: (deviceHeight - deviceHeight) + usernameSceneImage.size.height)
        addChild(usernameSceneImage)
        
        leaderboardGreeting.position = CGPoint(x: size.width / 2, y: (size.height / 2 + backToGameButton.size.height) + leaderboardGreeting.size.height)
        addChild(leaderboardGreeting)
        
        backToGameButton.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(backToGameButton)
        
        //createUsernameLabel.position = CGPoint(x: size.width / 2, y: size.height / 2 + createUsernameLabel.size.height * 2)
        //addChild(createUsernameLabel)
        
        //submitButton.position = CGPoint(x: size.width / 2 , y: size.height / 2 - submitButton.size.height)
        //addChild(submitButton)
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
            if backToGameButton.contains(location) {
                let scene = GameScene(size: size)
                self.view?.presentScene(scene)
            }
            /*
            else if submitButton.contains(location) {
                self.saveUsernameToFirebase()
                DispatchQueue.main.async(execute: {
                    self.usernameTextField.removeFromSuperview()
                })
            }
            */
        }
    }
    
    /*
    override func didMove(to view: SKView) {
        guard let view = self.view else {return}
        
        let originX = (size.width - size.width / 2) / 2
        usernameTextField = UITextField(frame: CGRect.init(x: originX, y: size.height / 2 - 40, width: size.width / 2, height: 50))
        customize(textField: usernameTextField, placeholder: "Username")
        view.addSubview(usernameTextField)
        usernameTextField.addTarget(self, action: #selector(UserRegistration.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
    }
   
    func saveUsernameToFirebase() {
        let defaults = UserDefaults.standard
        let highScore = defaults.integer(forKey: scoreKey)
        
        var ref: DatabaseReference!
        ref = Database.database().reference().child("Users")
        let childUpdates = [username : highScore]
        ref.setValue(childUpdates)
    }
    
    func customize(textField: UITextField, placeholder: String, isSecureTextEntry: Bool = false) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        textField.leftView = paddingView
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.leftViewMode = UITextFieldViewMode.always
        textField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSForegroundColorAttributeName : UIColor.gray])
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 4.0
        textField.textColor = .darkGray
        textField.isSecureTextEntry = isSecureTextEntry
        textField.delegate = self
    }
    
    func textFieldDidChange(textField: UITextField) {
        if textField == self.usernameTextField {
            self.username = textField.text!
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    */
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
