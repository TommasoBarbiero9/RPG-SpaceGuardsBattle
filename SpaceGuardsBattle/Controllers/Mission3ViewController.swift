//
//  Mission3ViewController.swift
//  SGB-SpaceGuardsBattle
//
//  Created by Piero Chianese on 05/03/22.
//

import Foundation
import UIKit
import SpriteKit
import GameplayKit

class Mission3ViewController: UIViewController{
   
  
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        let activityView = UIActivityIndicatorView(style: .large)
       activityView.center = self.view.center
        activityView.color = .orange
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
           backgroundImage.image = UIImage(named: "backgroundBlu")
        backgroundImage.contentMode = UIView.ContentMode.scaleToFill
           self.view.insertSubview(backgroundImage, at: 0)
       self.view.addSubview(activityView)
        
        
       activityView.startAnimating()
        if let view = self.view as! SKView? {
            DispatchQueue.global(qos: .background).async{
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "Mission3") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                // Present the scene
                
                DispatchQueue.main.asyncAfter(deadline: .now() ) {
                
                    view.presentScene(scene)
                    view.isUserInteractionEnabled = true
                    activityView.hidesWhenStopped = true
                    activityView.stopAnimating()
                   let  ciao = self.view.subviews
                    ciao[0].removeFromSuperview()
                    
                }
            }
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
