//
//  PhysicsCategory.swift
//  SGB-SpaceGuardsBattle
//
//  Created by Piero Chianese on 03/03/22.
//

import Foundation
struct PhysicsCategory {
    static let None:  UInt32 = 0
    static let Hero:   UInt32 = 0b1 // 1
    static let Shot: UInt32 = 0b10 // 2
    static let Asteroid:   UInt32 = 0b11 // 3
    static let Planet: UInt32 = 0b100 //4
    static let Confine: UInt32 = 0b101 //5
    static let eneShot:  UInt32 = 0b1010 //5

}
