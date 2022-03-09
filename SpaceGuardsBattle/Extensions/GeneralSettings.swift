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
    var bgsound : Bool
        var segmentBody : Bool = true
        var JoyPos : Bool = true
        var shotyn : Bool = true
        let defaults = UserDefaults.standard
     var firsttime : Bool







            init () {

                if let _ = defaults.string(forKey: "isAppAlreadyLaunchedOnce") {

                    firsttime = false
                } else {
                    defaults.set(true, forKey: "isAppAlreadyLaunchedOnce")

                    firsttime = true
                }


                if firsttime == false {
                bgsound = defaults.bool(forKey: "bgSound")
                JoyPos = defaults.bool(forKey: "JoyPos")
                    shotyn = defaults.bool(forKey: "shotyn")}
                else{
                    bgsound = true
                    JoyPos = true
                        shotyn = true
                }
        }






    }

