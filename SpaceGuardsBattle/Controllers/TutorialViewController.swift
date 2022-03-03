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
                // Present the scene
                view.presentScene(scene)
            }

            self.dismiss(animated: true, completion: nil)
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
}
