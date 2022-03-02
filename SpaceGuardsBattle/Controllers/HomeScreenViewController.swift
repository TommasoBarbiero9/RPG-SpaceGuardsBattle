//
//  HomeScreenViewController.swift
//  SpaceGuardsBattle
//
//  Created by Luca Perrotti on 23/02/22.
//

import Foundation
import UIKit

// MARK: HomeScreenViewController: UIViewController

class HomeScreenViewController: UIViewController {
    @IBAction func playGameButtonPressed(_ sender: UIButton) {
        self.navigationController?.isNavigationBarHidden = true
        if let play = storyboard?.instantiateViewController(withIdentifier: "GalaxySelectionViewController") as? GalaxySelectionViewController {
            navigationController?.pushViewController(play, animated: false)
            
        }
    }
    @IBAction func playGamecenterButton(_ sender: UIButton) {
        self.navigationController?.isNavigationBarHidden = true
        if let pippo = storyboard?.instantiateViewController(withIdentifier: "MultiplayerViewController") as? MultiplayerViewController {
            navigationController?.pushViewController(pippo, animated: false)
        }
        }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
