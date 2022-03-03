//
//  GalaxySelectionViewController.swift
//  SpaceGuardsBattle
//
//  Created by Cristina Buccino on 23/02/22.
//

import Foundation
import UIKit
import SwiftUI

class GalaxySelectionViewController : UIViewController{
    @State private var changesymbol: Bool = false
    
    @IBAction func galaxySelected(_ sender: UIButton) {
        
            self.navigationController?.isNavigationBarHidden = true
            if let play = storyboard?.instantiateViewController(withIdentifier: "MissionsViewController") as? MissionsViewController {
                navigationController?.pushViewController(play, animated: false)
            }
        }
    
//    @IBOutlet weak var startButton1: UIButton!
//    @IBOutlet weak var startButton: UIButton!
   
    @IBAction func playGameButtonPressed(_ sender: UIButton) {
        HomeScreenViewController.audioPlayer.stop()
        self.navigationController?.isNavigationBarHidden = true
        if let play = storyboard?.instantiateViewController(withIdentifier: "TutorialViewController") as? TutorialViewController {
            navigationController?.pushViewController(play, animated: false)
        }
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.isNavigationBarHidden = true
        if let back = storyboard?.instantiateViewController(withIdentifier: "HomeScreenViewController") as? HomeScreenViewController {
            navigationController?.pushViewController(back, animated: false)
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
//    @IBAction func swipeRight(_ sender: Any) {
//        self.navigationController?.isNavigationBarHidden = true
//        if let custom = storyboard?.instantiateViewController(withIdentifier: "SpaceshipCustomizationViewController") as? SpaceshipCustomizationViewController {
//            navigationController?.pushViewController(custom, animated: false)
//        }
//    }
//    @IBAction func swipeRight(_ sender: Any) {
//
//        self.changesymbol.toggle()
//        self.navigationController?.isNavigationBarHidden = true
//        if let custom = storyboard?.instantiateViewController(withIdentifier: "SpaceshipCustomizationViewController") as? SpaceshipCustomizationViewController {
//            navigationController?.pushViewController(custom, animated: true)
//        }
//    }
       
  
    
    
}
    









//    @IBAction func shipCustomizationPressed(_ sender: UIButton) {
//        self.navigationController?.isNavigationBarHidden = true
//        if let custom = storyboard?.instantiateViewController(withIdentifier: "SpaceshipCustomizationViewController") as? SpaceshipCustomizationViewController {
//            navigationController?.pushViewController(custom, animated: false)
//        }
//    
//    
//        override func viewDidLoad() {
//            let borderLayer = CAShapeLayer()
//            borderLayer.strokeColor = UIColor.orange.cgColor
//            borderLayer.borderWidth = 8.0
//    
//            let borderPath = UIBezierPath(roundedRect: startButton1.bounds,
//                                          byRoundingCorners: [.allCorners],
//                cornerRadii: CGSize(width:10.0, height: 10.0))
//            borderLayer.path = borderPath.cgPath
//    
//            startButton1.layer.insertSublayer(borderLayer, at: 0)
//        }

