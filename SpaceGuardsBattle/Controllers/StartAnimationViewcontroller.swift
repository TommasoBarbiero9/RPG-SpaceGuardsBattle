//
//  StartAnimationViewcontroller.swift
//  SGB-SpaceGuardsBattle
//
//  Created by Cristina Buccino on 06/03/22.
//

import Foundation
import UIKit
import SwiftUI
import GameplayKit

class StartAnimationViewController : UIViewController{

    @IBOutlet weak var shipLeaving: UIImageView!
    
    override func viewDidLoad() {
        
        
        UIView.animate(withDuration: 2.0) {
            self.shipLeaving.frame = CGRect(x: 100, y: -100, width: 200, height: 100)
        }

}
}
