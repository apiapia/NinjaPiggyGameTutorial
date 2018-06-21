
//
// GameWon.swift
// NinjaPiggy
//
// Copyright © 2018 iFiero. All rights reserved.
//

import SpriteKit

class GameWon:SKScene {
    
    private var learningNode:SKSpriteNode?
    private var playNode:SKSpriteNode?
    
    override func didMove(to view: SKView) {
        learningNode = childNode(withName: "Learning") as? SKSpriteNode
        playNode = childNode(withName: "Play") as? SKSpriteNode
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            let touchLocation = touch.location(in: self)
            // 点击开始游戏按钮
            print("进入游戏")
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
    /*
     
     GameScene 直接调用 GameWonScene时须使用此代码
     override init(size:CGSize) {
     super.init()
     }
     
     required init?(coder aDecoder: NSCoder) {
     fatalError("init(coder:) has not been implemented")
     }
     
     */
    
}
