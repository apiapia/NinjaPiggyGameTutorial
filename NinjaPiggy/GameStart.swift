//
//  GameStart.swift
//  NinjaPiggy
//
//  Copyright © 2018 iFiero. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameStart:SKScene {
    
    private var playNode:SKSpriteNode?
    private var monsterNode:SKSpriteNode?
    private var projectileNode:SKSpriteNode?
    private var learningNode:SKSpriteNode?
    
    override func didMove(to view: SKView) {
        
        // 背景音乐
        let backgroundMusic = SKAudioNode(fileNamed: "background-music-aac.caf")
        backgroundMusic.autoplayLooped = true
        addChild(backgroundMusic)
        
        // iFiero -- 让游戏开发变简单 WWW.iFIERO.COM
        self.learningNode = childNode(withName: "Learning") as? SKSpriteNode
        
        // playNode Bounce 
        self.playNode = self.childNode(withName: "Play") as? SKSpriteNode
        let scaleUp =  SKAction.scale(to: 0.7*1.02, duration: 0.75)
        scaleUp.timingMode = .easeInEaseOut
        let scaleDown = SKAction.scale(to: 0.7*0.98, duration: 0.75)
        scaleDown.timingMode = .easeInEaseOut
        
        let repeatAction = SKAction.sequence([scaleUp,scaleDown])
        playNode?.run(SKAction.repeatForever(repeatAction))
        
        // monster
        self.monsterNode = self.childNode(withName: "monster") as? SKSpriteNode
        var monsterTextArray = [SKTexture]()
        let monsterAtallas = SKTextureAtlas(named: "Bomb")
        for i in 1...monsterAtallas.textureNames.count {
            let imageName = "Bomb0\(i).png"
            monsterTextArray.append(SKTexture(imageNamed:imageName))
        }
        let ninjaActionAnimation = SKAction.animate(with: monsterTextArray, timePerFrame: 0.1)
        monsterNode?.run(SKAction.repeatForever(ninjaActionAnimation), withKey: "monster")
        
        // projectile
        self.projectileNode = childNode(withName: "projectile") as? SKSpriteNode
        let actionRotate = SKAction.rotate(byAngle: CGFloat(-Double.pi/2), duration: TimeInterval(0.5))
        let actionRotateForver = SKAction.repeatForever(actionRotate)
        projectileNode?.run(actionRotateForver, withKey: "rotate")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            // 点击开始游戏按钮
            if (playNode?.contains(touchLocation))! {
    
                let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
                let scene = GameScene(size: CGSize(width: 2048, height: 1536))
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition:reveal)
            }
            // 点击学习教程按钮
            if (learningNode?.contains(touchLocation))!{

                UIApplication.shared.open(URL(string: "http://www.iFIERO.com")!, options: [:], completionHandler: { (error) in
                     print("jump to http://www.iFiero.com")
                })
            }
        }
        
    }
    
}
