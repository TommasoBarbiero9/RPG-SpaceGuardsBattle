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
    
    @IBOutlet weak var viewLocked1: UIImageView!
    @IBOutlet weak var viewLocked: UIImageView!
    @IBOutlet weak var selectedNav2: UIImageView!
    @IBOutlet weak var labelChevron2: UILabel!
    @IBOutlet weak var gifBg: UIImageView!
    @IBOutlet weak var milkGalaxy: UILabel!
    @IBOutlet weak var goldGalaxy: UILabel!
    @IBOutlet weak var choosegalaxyLabel: UILabel!
    @IBOutlet weak var milkGalaxyButton: UIButton!
    @IBOutlet weak var goldGalaxyButton: UIButton!
    @IBOutlet weak var greenGalaxy: UILabel!
    @IBOutlet weak var greenGalaxyButton: UIButton!
    @IBOutlet weak var planets2: UIImageView!

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {

        viewLocked1.layer.cornerRadius = 15
        viewLocked.layer.cornerRadius = 15
        selectedNav2.shake()
        labelChevron2.shake()
        gifBg.loadGif(name: "gif")
        planets2.rotate()
//        scrollView.contentInset = UIEdgeInsets()
        

        milkGalaxyButton.layer.borderWidth = 1.0
        milkGalaxyButton.layer.cornerRadius = 15
        milkGalaxyButton.layer.borderColor = UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 1).cgColor;
        milkGalaxyButton.layer.masksToBounds = true
        milkGalaxyButton.clipsToBounds = false

        goldGalaxyButton.layer.borderWidth = 1.0
        goldGalaxyButton.layer.cornerRadius = 15

        goldGalaxyButton.layer.borderColor = UIColor.init(red: 144/255, green: 21/255, blue: 175/255, alpha: 1).cgColor;
        goldGalaxyButton.layer.masksToBounds = true
        goldGalaxyButton.clipsToBounds = false


        milkGalaxy.layer.borderWidth = 1.0
        milkGalaxy.layer.cornerRadius = 8
        milkGalaxy.layer.borderColor = UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 1).cgColor;
        milkGalaxy.layer.masksToBounds = true
        milkGalaxy.clipsToBounds = false

        goldGalaxy.layer.borderWidth = 1.0
        goldGalaxy.layer.cornerRadius = 8
        goldGalaxy.layer.borderColor = UIColor.init(red: 240/255, green: 201/255, blue: 254/255, alpha: 1).cgColor;

        goldGalaxy.layer.masksToBounds = true
        goldGalaxy.clipsToBounds = false
        
        
        greenGalaxyButton.layer.borderWidth = 1.0
        greenGalaxyButton.layer.cornerRadius = 15

        greenGalaxyButton.layer.borderColor = UIColor.init(red: 5/255, green: 149/255, blue: 62/255, alpha: 1).cgColor;

        greenGalaxyButton.layer.masksToBounds = true
        greenGalaxyButton.clipsToBounds = false


        greenGalaxy.layer.borderWidth = 1.0
        greenGalaxy.layer.cornerRadius = 8
        greenGalaxy.layer.borderColor = UIColor.init(red: 5/255, green: 149/255, blue: 62/255, alpha: 1).cgColor;

       greenGalaxy.layer.masksToBounds = true
       greenGalaxy.clipsToBounds = false

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

//    @IBAction func goldGalaxySelected(_ sender: UIButton) {
//        self.navigationController?.isNavigationBarHidden = true
//        if let back = storyboard?.instantiateViewController(withIdentifier: "StartAnimationViewController") as? StartAnimationViewController {
//            navigationController?.pushViewController(back, animated: false)
//        }
//        
//    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}


