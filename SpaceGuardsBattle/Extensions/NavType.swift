//
//  NavType.swift
//  SGB-SpaceGuardsBattle
//
//  Created by Piero Chianese on 02/03/22.
//

import Foundation
class NavType {

    static let sharedGameData = NavType()

    var tfscore: Int = 0
    var mcscore: Int = 0
    var mapsscore: Int = 0
    var photoscore: Int = 0
    var overallscore: Int = 0
    
    var Nav = "navicellarossa"
        var type: String = GeneralSettings.sharedGameData.defaults.string(forKey: "type") ?? "5"
        var form: String = GeneralSettings.sharedGameData.defaults.string(forKey: "form") ?? "q"
        var color: String = GeneralSettings.sharedGameData.defaults.string(forKey: "color") ?? "viola"
    
    init () {

    }
}
