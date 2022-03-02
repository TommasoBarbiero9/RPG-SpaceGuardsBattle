//
//  SpaceshipCusomization.swift
//  SpaceGuardsBattle
//
//  Created by Cristina Buccino on 25/02/22.
//

import Foundation
import UIKit
class SpaceshipCustomizationViewController: UIViewController {
  
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.navigationController?.isNavigationBarHidden = true
        if let back = storyboard?.instantiateViewController(withIdentifier: "GalaxySelectionViewController") as? GalaxySelectionViewController {
            navigationController?.pushViewController(back, animated: false)
        }
    }
    

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

