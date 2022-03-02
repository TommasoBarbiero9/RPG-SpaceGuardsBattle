//
//  GalaxySelectionViewController.swift
//  SpaceGuardsBattle
//
//  Created by Cristina Buccino on 23/02/22.
//

import Foundation
import UIKit

class GalaxySelectionViewController : UIViewController{
    
  
    @IBOutlet weak var startButton1: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBAction func playGameButtonPressed(_ sender: UIButton) {
    self.navigationController?.isNavigationBarHidden = true
        HomeScreenViewController.audioPlayer.stop()
    if let play = storyboard?.instantiateViewController(withIdentifier: "TutorialViewController") as? TutorialViewController {
        navigationController?.pushViewController(play, animated: false)
    }
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
    

    @IBAction func shipCustomizationPressed(_ sender: UIButton) {
        self.navigationController?.isNavigationBarHidden = true
        if let custom = storyboard?.instantiateViewController(withIdentifier: "SpaceshipCustomizationViewController") as? SpaceshipCustomizationViewController {
            navigationController?.pushViewController(custom, animated: false)
        }
        }
    
    override func viewDidLoad() {
        let borderLayer = CAShapeLayer()
        borderLayer.strokeColor = UIColor.orange.cgColor
        borderLayer.borderWidth = 8.0

        let borderPath = UIBezierPath(roundedRect: startButton1.bounds,
                                      byRoundingCorners: [.allCorners],
            cornerRadii: CGSize(width:10.0, height: 10.0))
        borderLayer.path = borderPath.cgPath

        startButton1.layer.insertSublayer(borderLayer, at: 0)
    }
}
