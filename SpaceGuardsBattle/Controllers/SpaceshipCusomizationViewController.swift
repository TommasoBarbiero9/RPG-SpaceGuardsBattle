//
//  SpaceshipCusomization.swift
//  SpaceGuardsBattle
//
//  Created by Cristina Buccino on 25/02/22.
//

import Foundation
import UIKit
import SwiftUI
class SpaceshipCustomizationViewController: UIViewController {
    @Environment(\.dismiss) var dismiss
    @IBAction func dismissPopup(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
//    ROMBI
//    rosse
    let imageq1r = UIImage(named: "1qr")
    let imageq2r = UIImage(named: "2qr")
    let imageq3r = UIImage(named: "3qr")
    let imageq4r = UIImage(named: "4qr")
    let imageq5r = UIImage(named: "5qr")
    let imageq6r = UIImage(named: "6qr")
//    verdi
    let imageq1v = UIImage(named: "1qv")
    let imageq2v = UIImage(named: "2qv")
    let imageq3v = UIImage(named: "3qv")
    let imageq4v = UIImage(named: "4qv")
    let imageq5v = UIImage(named: "5qv")
    let imageq6v = UIImage(named: "6qv")
//    violet
    let imageq1violet = UIImage(named: "1qviola")
    let imageq2violet = UIImage(named: "2qviola")
    let imageq3violet = UIImage(named: "3qviola")
    let imageq4violet = UIImage(named: "4qviola")
    let imageq5violet = UIImage(named: "5qviola")
    let imageq6violet = UIImage(named: "6qviola")
//    blu
    let imageq1b = UIImage(named: "1qb")
    let imageq2b = UIImage(named: "2qb")
    let imageq3b = UIImage(named: "3qb")
    let imageq4b = UIImage(named: "4qb")
    let imageq5b = UIImage(named: "5qb")
    let imageq6b = UIImage(named: "6qb")
    
    
    
//    CERCHIO
//    rosse
    let imagec1r = UIImage(named: "1cr")
    let imagec2r = UIImage(named: "2cr")
    let imagec3r = UIImage(named: "3cr")
    let imagec4r = UIImage(named: "4cr")
    let imagec5r = UIImage(named: "5cr")
    let imagec6r = UIImage(named: "6cr")
//    verdi
    let imagec1v = UIImage(named: "1cv")
    let imagec2v = UIImage(named: "2cv")
    let imagec3v = UIImage(named: "3cv")
    let imagec4v = UIImage(named: "4cv")
    let imagec5v = UIImage(named: "5cv")
    let imagec6v = UIImage(named: "6cv")
//    viola
    let imagec1violet = UIImage(named: "1cviola")
    let imagec2violet = UIImage(named: "2cviola")
    let imagec3violet = UIImage(named: "3cviola")
    let imagec4violet = UIImage(named: "4cviola")
    let imagec5violet = UIImage(named: "5cviola")
    let imagec6violet = UIImage(named: "6cviola")
//    blu
    let imagec1b = UIImage(named: "1cb")
    let imagec2b = UIImage(named: "2cb")
    let imagec3b = UIImage(named: "3cb")
    let imagec4b = UIImage(named: "4cb")
    let imagec5b = UIImage(named: "5cb")
    let imagec6b = UIImage(named: "6cb")
    
   
    @IBOutlet weak var segmentedBodies: UISegmentedControl!
    @IBOutlet weak var done: UIButton!
   
    
    @IBOutlet weak var ship1: UIButton!
    @IBOutlet weak var ship2: UIButton!
    @IBOutlet weak var ship3: UIButton!
    @IBOutlet weak var ship4: UIButton!
    @IBOutlet weak var ship5: UIButton!
    @IBOutlet weak var ship6: UIButton!
    
    
    
    
//    CAMBIO FORME NAVICELLE
    @IBAction func bodiesChange(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex{
        case 0 :
            
            ship1.setBackgroundImage(imageq1r, for: .normal)
            ship2.setBackgroundImage(imageq2r, for: .normal)
            ship3.setBackgroundImage(imageq3r, for: .normal)
            ship4.setBackgroundImage(imageq4r, for: .normal)
            ship5.setBackgroundImage(imageq5r, for: .normal)
            ship6.setBackgroundImage(imageq6r, for: .normal)
           
        case 1 :
            ship1.setBackgroundImage(imagec1r, for: .normal)
            ship2.setBackgroundImage(imagec2r, for: .normal)
            ship3.setBackgroundImage(imagec3r, for: .normal)
            ship4.setBackgroundImage(imagec4r, for: .normal)
            ship5.setBackgroundImage(imagec5r, for: .normal)
            ship6.setBackgroundImage(imagec6r, for: .normal)
        default :
            break
           
        }
        
        print(segmentedBodies.selectedSegmentIndex)
        
    }
    
    
//  CAMBIO COLORI
    
//    ARANCIONE
    @IBAction func orangeButton(_ sender: Any) {

        if segmentedBodies.selectedSegmentIndex == 0
        {

            ship1.setBackgroundImage(imageq1r, for: .normal)
            ship2.setBackgroundImage(imageq2r, for: .normal)
            ship3.setBackgroundImage(imageq3r, for: .normal)
            ship4.setBackgroundImage(imageq4r, for: .normal)
            ship5.setBackgroundImage(imageq5r, for: .normal)
            ship6.setBackgroundImage(imageq6r, for: .normal)
        }
        else{
            
            ship1.setBackgroundImage(imagec1r, for: .normal)
            ship2.setBackgroundImage(imagec2r, for: .normal)
            ship3.setBackgroundImage(imagec3r, for: .normal)
            ship4.setBackgroundImage(imagec4r, for: .normal)
            ship5.setBackgroundImage(imagec5r, for: .normal)
            ship6.setBackgroundImage(imagec6r, for: .normal)
            
        }
    }
    
//    VERDE
    
    @IBAction func greenButton(_ sender: Any) {
        
        
        if segmentedBodies.selectedSegmentIndex == 0
        {

            ship1.setBackgroundImage(imageq1v, for: .normal)
            ship2.setBackgroundImage(imageq2v, for: .normal)
            ship3.setBackgroundImage(imageq3v, for: .normal)
            ship4.setBackgroundImage(imageq4v, for: .normal)
            ship5.setBackgroundImage(imageq5v, for: .normal)
            ship6.setBackgroundImage(imageq6v, for: .normal)
        }
        else{
            
            ship1.setBackgroundImage(imagec1v, for: .normal)
            ship2.setBackgroundImage(imagec2v, for: .normal)
            ship3.setBackgroundImage(imagec3v, for: .normal)
            ship4.setBackgroundImage(imagec4v, for: .normal)
            ship5.setBackgroundImage(imagec5v, for: .normal)
            ship6.setBackgroundImage(imagec6v, for: .normal)
            
        }
        
        
        
    }
    
//    VIOLA
    
    @IBAction func violetButton(_ sender: Any) {
        if segmentedBodies.selectedSegmentIndex == 0
        {

            ship1.setBackgroundImage(imageq1violet, for: .normal)
            ship2.setBackgroundImage(imageq2violet, for: .normal)
            ship3.setBackgroundImage(imageq3violet, for: .normal)
            ship4.setBackgroundImage(imageq4violet, for: .normal)
            ship5.setBackgroundImage(imageq5violet, for: .normal)
            ship6.setBackgroundImage(imageq6violet, for: .normal)
        }
        else{
            
            ship1.setBackgroundImage(imagec1violet, for: .normal)
            ship2.setBackgroundImage(imagec2violet, for: .normal)
            ship3.setBackgroundImage(imagec3violet, for: .normal)
            ship4.setBackgroundImage(imagec4violet, for: .normal)
            ship5.setBackgroundImage(imagec5violet, for: .normal)
            ship6.setBackgroundImage(imagec6violet, for: .normal)
            
        }
    }
    
//    blu
    
    @IBAction func blueButton(_ sender: Any) {
        
        if segmentedBodies.selectedSegmentIndex == 0
        {

            ship1.setBackgroundImage(imageq1b, for: .normal)
            ship2.setBackgroundImage(imageq2b, for: .normal)
            ship3.setBackgroundImage(imageq3b, for: .normal)
            ship4.setBackgroundImage(imageq4b, for: .normal)
            ship5.setBackgroundImage(imageq5b, for: .normal)
            ship6.setBackgroundImage(imageq6b, for: .normal)
        }
        else{
            
            ship1.setBackgroundImage(imagec1b, for: .normal)
            ship2.setBackgroundImage(imagec2b, for: .normal)
            ship3.setBackgroundImage(imagec3b, for: .normal)
            ship4.setBackgroundImage(imagec4b, for: .normal)
            ship5.setBackgroundImage(imagec5b, for: .normal)
            ship6.setBackgroundImage(imagec6b, for: .normal)
            
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

