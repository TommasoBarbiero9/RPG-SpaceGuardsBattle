//
//  MissionsViewController.swift
//  SpaceGuardsBattle
//
//  Created by Cristina Buccino on 28/02/22.
//

import Foundation
import UIKit

class MissionsViewController : UIViewController{
    
    @IBOutlet weak var missionLabel: UILabel!
    override func viewDidLoad() {
            super.viewDidLoad()
        missionLabel.layer.borderWidth = 1.0
        missionLabel.layer.cornerRadius = 8
        missionLabel.backgroundColor = UIColor.black
        missionLabel.layer.borderColor = UIColor.orange.cgColor
        missionLabel.layer.masksToBounds = true
    }
    
    @IBAction func playGameButtonPressed(_ sender: UIButton) {
        self.navigationController?.isNavigationBarHidden = true
        if let play = storyboard?.instantiateViewController(withIdentifier: "TutorialViewController") as? TutorialViewController {
            navigationController?.pushViewController(play, animated: false)
        }
    }
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.isNavigationBarHidden = true
        if let back = storyboard?.instantiateViewController(withIdentifier: "GalaxySelectionViewController") as? GalaxySelectionViewController{
            navigationController?.pushViewController(back, animated: false)
        }
    }
    @IBAction func Mission2play(_ sender: UIButton) {
        self.navigationController?.isNavigationBarHidden = true
        if let mission2 = storyboard?.instantiateViewController(withIdentifier: "Mission2ViewController") as? Mission2ViewController {
            navigationController?.pushViewController(mission2, animated: false)
        }
    }
    @IBAction func Mission1play(_ sender: UIButton) {
        self.navigationController?.isNavigationBarHidden = true
        if let mission1 = storyboard?.instantiateViewController(withIdentifier: "Mission1ViewController") as? Mission1ViewController {
            navigationController?.pushViewController(mission1, animated: false)
        }
    }
}
    
