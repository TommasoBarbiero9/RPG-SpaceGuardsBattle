//
//  Over.swift
//  SpaceGuardsBattle
//
//  Created by Piero Chianese on 21/02/22.
//

import Foundation
import SpriteKit


//class Over: SKScene {
//
//
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let reveal = SKTransition.crossFade(withDuration: 1.5)
//        let repl = SKScene(fileNamed: "GameScene")
//        repl!.scaleMode = scaleMode
//        view?.presentScene(repl!, transition: reveal)
//    }
//
//}


import UIKit
import SpriteKit
class Win: SKScene {
    
    var button: SKNode! = nil
    let mainScreenText = SKLabelNode(text: "Main Screen")
    override func didMove(to view: SKView) {
        // Create a simple red rectangle that's 100x44
        button = SKLabelNode(text: "Play Again")
        // Put it in the center of the scene
        button.position = CGPoint(x:self.frame.midX, y:self.frame.midY);
        self.addChild(button)
        
        mainScreenText.position = CGPoint(x: self.frame.midX, y: self.frame.midY - 50)
        self.addChild(mainScreenText)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Loop over all the touches in this event
        for touch in touches {
            // Get the location of the touch in this scene
            let location = touch.location(in: self)
            // Check if the location of the touch is within the button's bounds
            if button.contains(location) {
                print("tapped!")
                        
                        let repl = SKScene(fileNamed: "Tutorial")
                        repl!.scaleMode = scaleMode
                        view?.presentScene(repl!)
            }
            if mainScreenText.contains(location) {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "NavigationViewController")
                
                vc.view.frame = (self.view?.frame)!
                vc.view.layoutIfNeeded()
                
                UIView.transition(with: self.view!, duration: 0, animations: {
                    self.view?.window?.rootViewController = vc
                }, completion: { completed in
                })
            }
        }
    }
}
