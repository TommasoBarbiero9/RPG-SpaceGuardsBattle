//
//  PauseViewController.swift
//  SGB-SpaceGuardsBattle
//
//  Created by Cristina Buccino on 07/03/22.
//

import Foundation
import UIKit

class PauseViewController : UIViewController{
    
    
    @IBOutlet weak var missionsView: UIView!
    override func viewDidLoad() {
            super.viewDidLoad()
    missionsView.layer.borderWidth = 1.0
    missionsView.layer.cornerRadius = 8
//        missionsLabel.backgroundColor = UIColor.black
//        missionsLabel.layer.borderColor = UIColor.orange.cgColor
    missionsView.layer.borderColor = UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 1).cgColor;
    missionsView.layer.masksToBounds = true
    missionsView.layer.backgroundColor = UIColor.init(red: 46/255, green: 176/255, blue: 205/255, alpha: 1).cgColor;
}
    
//    func animateOut() {
//        UIView.animate(withDuration: 0.3, animations: {
//            self.
//        }, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
//    }
    @IBAction func pauseBackButton(_ sender: Any) {
        
        self.navigationController?.isNavigationBarHidden = true
        if let back = storyboard?.instantiateViewController(withIdentifier: "HomeScreenViewController") as? HomeScreenViewController{
            navigationController?.pushViewController(back, animated: false)
        }
        
    }
}
