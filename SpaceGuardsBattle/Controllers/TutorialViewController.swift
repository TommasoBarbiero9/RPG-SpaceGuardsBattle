//
//  GameViewController.swift
//  SpaceGuardsBattle
//
//  Created by Tommaso Barbiero on 08/02/22.
//

import UIKit
import SpriteKit
import GameplayKit

class TutorialViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
       
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "Tutorial") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
               
//                scene.physicsBody = SKPhysicsBody(edgeLoopFrom: scene.calculateAccumulatedFrame())
//                var g = scene.calculateAccumulatedFrame()
//                g.size.height = g.size.height - 2000
//                g.size.width = g.size.width - 2000
//                g.origin.x = g.origin.x + 1000
//                g.origin.y = g.origin.y + 1000
//                scene.physicsBody = SKPhysicsBody(edgeLoopFrom: g)
//                scene.physicsBody?.categoryBitMask = PhysicsCategory.Confine
//                scene.physicsBody?.contactTestBitMask = PhysicsCategory.Hero
//                scene.physicsBody?.collisionBitMask = PhysicsCategory.Hero
//
                // Present the scene
                view.presentScene(scene)
            }

            self.dismiss(animated: true, completion: nil)
            
//            view.ignoresSiblingOrder = true
//            view.showsFPS = true
//            view.showsNodeCount = true
//            view.showsPhysics = true
//           
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
//    func returnToMainMenu(){
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        guard  let storyboard = appDelegate.window?.rootViewController?.storyboard else { return }
//        if let vc = storyboard.instantiateInitialViewController() {
//            print("go to main menu")
//            self.present(vc, animated: true, completion: nil)
//        }
//    }
}
