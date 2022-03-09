//
//  GameViewController.swift
//  SpaceGuardsBattle
//
//  Created by Tommaso Barbiero on 08/02/22.
//

import UIKit
import SpriteKit
import GameplayKit

class Mission2ViewController: UIViewController{
    @IBOutlet weak var shipLeaving: UIImageView!
    @IBOutlet weak var pistaView: UIImageView!
    @IBOutlet weak var backgroundView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.shipLeaving.image = UIImage(named: NavType.sharedGameData.type + NavType.sharedGameData.form + NavType.sharedGameData.color)
        self.navigationController?.isNavigationBarHidden = true
//        self.view.insertSubview(backgroundView, at: 2)
            self.view.insertSubview(pistaView, at: 1)
            self.view.insertSubview(shipLeaving, at: 0)
//            pistaView.center = self.view.center
    //        SettingsMenu.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            pistaView.alpha = 1
            
            UIView.animate(withDuration: 0.2, animations: {
                self.pistaView.alpha = 1
                self.pistaView.transform = CGAffineTransform.identity
            })
            
//            shipLeaving.center = self.view.center
            shipLeaving.alpha = 1
        shipLeaving.layer.zPosition = 5
            UIView.animate(withDuration: 5.0) {
                self.shipLeaving.frame = CGRect(x: 100, y: -100, width: 200, height: 100)
            }
        
        if let view = self.view as! SKView? {
            DispatchQueue.global(qos: .background).async{
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "Mission2") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                // Present the scene
                
                DispatchQueue.main.asyncAfter(deadline: .now() ) {
                
                    view.presentScene(scene)
                    view.isUserInteractionEnabled = true
                   let  ciao = self.view.subviews
                    ciao[0].removeFromSuperview()
                    ciao[1].removeFromSuperview()
                    ciao[2].removeFromSuperview()
                    
                }
            }
            }
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

