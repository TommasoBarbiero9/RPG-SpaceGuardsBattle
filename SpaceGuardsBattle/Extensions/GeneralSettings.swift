//
//  GeneralSettings.swift
//  SGB-SpaceGuardsBattle
//
//  Created by Piero Chianese on 03/03/22.
//

import Foundation
class GeneralSettings {

    static let sharedGameData = GeneralSettings()

    var soundON: Bool = true
    var positionJoy: Int = 1
    var mission1Unlocked: Bool = false
    var mission2Unlocked: Bool = false
    var selectedMission: Int = 1
    var livello = Mission1ViewController()
    var bgsound : Bool = true
    
    
   
    
    init () {

    }
}
