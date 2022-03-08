//
//  GeneralSettings.swift
//  SGB-SpaceGuardsBattle
//
//  Created by Piero Chianese on 03/03/22.
//

import Foundation
import UIKit
import SpriteKit
class GeneralSettings {

    static let sharedGameData = GeneralSettings()

    var soundON: Bool = true
    var positionJoy: Int = 1
    var mission1Unlocked: Bool = false
    var mission2Unlocked: Bool = false
    var mission3Unlocked: Bool = false
    var selectedMission: Int = 1
    var levelSelected = ""
    var bgsound : Bool = true
    var segmentBody : Bool = true
    var JoyPos : Bool = true
    var shotyn : Bool = true
   
    
    init () {

    }
}
