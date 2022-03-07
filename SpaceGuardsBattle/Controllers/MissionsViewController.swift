//
//  MissionsViewController.swift
//  SpaceGuardsBattle
//
//  Created by Cristina Buccino on 28/02/22.
//

import Foundation
import UIKit


class MissionsViewController : UIViewController{
    
    @IBOutlet weak var planetsMissions: UIImageView!
    @IBOutlet weak var missionsView: UIView!
    @IBOutlet weak var missionsLabel: UILabel!
//    @IBOutlet weak var missionLabel: UILabel!
    override func viewDidLoad() {
            super.viewDidLoad()
        planetsMissions.rotate()
        missionsLabel.layer.borderWidth = 1.0
        missionsLabel.layer.cornerRadius = 8
//        missionsLabel.backgroundColor = UIColor.black
//        missionsLabel.layer.borderColor = UIColor.orange.cgColor
        missionsLabel.layer.borderColor = UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 1).cgColor;
        missionsLabel.layer.masksToBounds = true
        
        missionsView.layer.borderWidth = 1.0
        missionsView.layer.cornerRadius = 8
//        missionsLabel.backgroundColor = UIColor.black
//        missionsLabel.layer.borderColor = UIColor.orange.cgColor
        missionsView.layer.borderColor = UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 1).cgColor;
        missionsView.layer.masksToBounds = true
        missionsView.layer.backgroundColor = UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 1).cgColor;
    }
    
    @IBAction func playGameButtonPressed(_ sender: UIButton) {
        self.navigationController?.isNavigationBarHidden = true
        if let play = storyboard?.instantiateViewController(withIdentifier: "TutorialViewController") as? TutorialViewController {
            navigationController?.pushViewController(play, animated: false)
        }
    }
    
    @IBAction func mission1ButtonPressed(_ sender: Any) {
        self.navigationController?.isNavigationBarHidden = true
        if let play = storyboard?.instantiateViewController(withIdentifier: "Mission1ViewController") as? Mission1ViewController {
            navigationController?.pushViewController(play, animated: false)
        }
    }
    @IBAction func mission2ButtonPressed(_ sender: Any) {
        self.navigationController?.isNavigationBarHidden = true
        if let play = storyboard?.instantiateViewController(withIdentifier: "Mission2ViewController") as? Mission2ViewController{
            navigationController?.pushViewController(play, animated: false)
        }
    }
    @IBAction func mission3ButtonPressed(_ sender: Any) {
        
        self.navigationController?.isNavigationBarHidden = true
        if let play = storyboard?.instantiateViewController(withIdentifier: "Mission3ViewController") as? Mission3ViewController{
            navigationController?.pushViewController(play, animated: false)
        }
        
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.isNavigationBarHidden = true
        if let back = storyboard?.instantiateViewController(withIdentifier: "GalaxySelectionViewController") as? GalaxySelectionViewController{
            navigationController?.pushViewController(back, animated: false)
        }
    }
    
}
    
