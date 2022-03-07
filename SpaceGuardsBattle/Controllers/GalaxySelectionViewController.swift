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
    
 
    
    

    @IBOutlet weak var milkGalaxy: UILabel!

    @IBOutlet weak var goldGalaxy: UILabel!

    @IBOutlet weak var choosegalaxyLabel: UILabel!

    @IBOutlet weak var milkGalaxyButton: UIButton!

    @IBOutlet weak var goldGalaxyButton: UIButton!

    
    @IBOutlet weak var planets2: UIImageView!

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {

        planets2.rotate()
//        scrollView.contentInset = UIEdgeInsets
        

        milkGalaxyButton.layer.borderWidth = 1.0
        milkGalaxyButton.layer.cornerRadius = 15
        milkGalaxyButton.layer.borderColor = UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 1).cgColor;
//        milkGalaxy.layer.backgroundColor = UIColor.orange.cgColor
        milkGalaxyButton.layer.masksToBounds = true
        milkGalaxyButton.clipsToBounds = false

        goldGalaxyButton.layer.borderWidth = 1.0
        goldGalaxyButton.layer.cornerRadius = 15
//        goldGalaxyButton.layer.borderColor = UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 1).cgColor;
        goldGalaxyButton.layer.borderColor = UIColor.init(red: 255/255, green: 197/255, blue: 85/255, alpha: 1).cgColor;
//        goldGalaxy.layer.backgroundColor = UIColor.orange.cgColor
        goldGalaxyButton.layer.masksToBounds = true
        goldGalaxyButton.clipsToBounds = false


        milkGalaxy.layer.borderWidth = 1.0
        milkGalaxy.layer.cornerRadius = 8
        milkGalaxy.layer.borderColor = UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 1).cgColor;
//        milkGalaxy.layer.backgroundColor = UIColor.orange.cgColor
        milkGalaxy.layer.masksToBounds = true
        milkGalaxy.clipsToBounds = false

        goldGalaxy.layer.borderWidth = 1.0
        goldGalaxy.layer.cornerRadius = 8
        goldGalaxy.layer.borderColor = UIColor.init(red: 255/255, green: 197/255, blue: 85/255, alpha: 1).cgColor;

        goldGalaxy.layer.masksToBounds = true
        goldGalaxy.clipsToBounds = false

        choosegalaxyLabel.layer.borderWidth = 1.0
        choosegalaxyLabel.layer.cornerRadius = 8
        choosegalaxyLabel.layer.borderColor = UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 1).cgColor;
    }


    @IBAction func GalaxyMilkSelected(_ sender: UIButton) {
            self.navigationController?.isNavigationBarHidden = true
            if let play = storyboard?.instantiateViewController(withIdentifier: "MissionsViewController") as? MissionsViewController {
                navigationController?.pushViewController(play, animated: false)
            }
        }

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

    @IBAction func goldGalaxySelected(_ sender: UIButton) {
        self.navigationController?.isNavigationBarHidden = true
        if let back = storyboard?.instantiateViewController(withIdentifier: "StartAnimationViewController") as? StartAnimationViewController {
            navigationController?.pushViewController(back, animated: false)
        }
        
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}


