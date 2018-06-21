//
//  GameViewController.swift
//  NinjaPiggy
/*
 *
 *  *** 游戏元素使用条款及注意事项 ***
 *
 *  游戏中的所有元素全部由iFIERO所原创(除引用之外)，包括人物、音乐、场景等，
 *  创作的初衷就是让更多的游戏爱好者可以在开发游戏中获得自豪感 -- 让手机游戏开发变得简单。
 *  秉着开源分享的原则,iFIERO发布的游戏都尽可能的易懂实用，并开放所有源码，
 *  任何使用者都可以使用游戏中的代码块，也可以进行拷贝、修改、更新、升级，无须再经过iFIERO的同意。
 *  但这并不表示可以任意复制、拆分其中的游戏元素:
 *  用于[商业目的]而不注明出处，
 *  用于[任何教学]而不注明出处,
 *  用于[游戏上架]而不注明出处；
 *  另外,iFIERO有商用授权游戏元素，获得iFIERO官方授权后，即无任何限制！
 *  请尊重帮助过你的iFIERO的知识产权，非常感谢！
 *
 *  Created by VANGO杨 && ANDREW陈
 *  Copyright © 2018 iFiero. All rights reserved.
 *  iFIERO -- 让手机游戏开发变得简单
 *  www.iFIERO.com
 *
 *  NinjaPiggy 忍者小猪 在此游戏中您将获得如下技能：
 *  1、LaunchScreen       学习如何设置游戏启动画面
 *  2、Scene              学习如何切换游戏的游戏场景
 *  3、Scene Edit         学习直接使用可见即所得操作编辑游戏场景
 *  4、Scene Coding       学习纯代码编写一个场景、建立节点、设置音乐
 *  5、Random             利用可复用的随机函数生成Enemy
 *  6、Music              如何添加背景音乐、碰撞时的音效
 *  7、Particle           学习如何制造粒子爆炸特效
 *  8、Collision          学习有节点与节点之间的碰撞的原理及处理方法
 *  9、Animation&Atlas    学习如何导入动画帧及何为Atlas
 *  10、SKEmitter         学习如何使用SKEmitter产生特效
 *
 */


import UIKit
import SpriteKit
class GameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let sceneStart = SKScene(fileNamed: "GameStart")
        sceneStart?.size = CGSize(width: 2048, height: 1536)
        // let scene = GameScene(size:CGSize(width: 2048, height: 1536))
        // let scene = GameScene(size:self.view.bounds.size) // view指手机屏幕的尺寸;
        // iPhone 5=>320 | iPhone/6/7/8=>375
        // print(scene.size)
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        sceneStart?.scaleMode = .aspectFill
        skView.presentScene(sceneStart)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

