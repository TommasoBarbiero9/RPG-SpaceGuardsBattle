//
//  Mission1ViewController.swift
//  SGB-SpaceGuardsBattle
//
//  Created by Tommaso Barbiero on 03/03/22.
//

import Foundation
import UIKit
import SpriteKit


class Mission1ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
        let scia = SKEmitterNode(fileNamed: "playerTrail")
        let activityView = UIActivityIndicatorView(style: .large)
       activityView.center = self.view.center
        activityView.color = .orange
        activityView.layer.zPosition = 3
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
           backgroundImage.image = UIImage(named: "background2")
        let navicella = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        navicella.center = self.view.center
        scia?.zPosition = 6
        scia?.position = self.view.center
        
        
        navicella.image = UIImage(named: "5qviola")
        navicella.layer.zPosition = 2
        navicella.contentMode = UIView.ContentMode.scaleToFill
        backgroundImage.contentMode = UIView.ContentMode.scaleToFill
           self.view.insertSubview(backgroundImage, at: 0)
        self.view.insertSubview(navicella, at: 1)
       self.view.addSubview(activityView)
        
        
       activityView.startAnimating()
        
        UIView.animate(withDuration: 10.0) {
            navicella.frame = CGRect(x: 100, y: -100, width: 200, height: 100)}
        
        if let view = self.view as! SKView? {
            DispatchQueue.global(qos: .background).async{
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "Mission1") {
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
                    ciao[1].removeFromSuperview()
                    
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
